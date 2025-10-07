#include <stdio.h>  // sprintf用（xil_printfは%f非対応）
#include "demo.h"
#include "audio/audio.h"
#include "dma/dma.h"
#include "intc/intc.h"
#include "userio/userio.h"
#include "iic/iic.h"

#include "xaxidma.h"
#include "xparameters.h"
#include "xil_exception.h"
#include "xdebug.h"
#include "xiic.h"
#include "xtime_l.h"

#ifdef XPAR_INTC_0_DEVICE_ID
 #include "xintc.h"
 #include "microblaze_sleep.h"
#else
 #include "xscugic.h"
 #include "sleep.h"
 #include "xil_cache.h"
#endif

#define FFT_SIZE       256
#define EQ_FRAME_SIZE (FFT_SIZE + 1)   // TLAST込み

volatile sDemo_t Demo;

static XIic sIic;
static XAxiDma sAxiDma;       // 録音・再生用 DMA (axi_dma_0)
static XAxiDma sAxiDmaEq;     // FFT/EQ/IFFT チェーン用 DMA (axi_dma_eq)
static XGpio sUserIO;

#ifdef XPAR_INTC_0_DEVICE_ID
 static XIntc sIntc;
#else
 static XScuGic sIntc;
#endif

#ifdef XPAR_INTC_0_DEVICE_ID
const ivt_t ivt[] = {
    {XPAR_AXI_INTC_0_AXI_IIC_0_IIC2INTC_IRPT_INTR, (XInterruptHandler)XIic_InterruptHandler, &sIic},
    {XPAR_AXI_INTC_0_AXI_DMA_0_S2MM_INTROUT_INTR, (XInterruptHandler)fnS2MMInterruptHandler, &sAxiDma},
    {XPAR_AXI_INTC_0_AXI_DMA_0_MM2S_INTROUT_INTR, (XInterruptHandler)fnMM2SInterruptHandler, &sAxiDma},
    {XPAR_AXI_INTC_0_AXI_GPIO_0_IP2INTC_IRPT_INTR, (XInterruptHandler)fnUserIOIsr, &sUserIO}
};
#else
const ivt_t ivt[] = {
    {XPAR_FABRIC_AXI_IIC_0_IIC2INTC_IRPT_INTR, (Xil_ExceptionHandler)XIic_InterruptHandler, &sIic},
    {XPAR_FABRIC_AXI_DMA_0_S2MM_INTROUT_INTR, (Xil_ExceptionHandler)fnS2MMInterruptHandler, &sAxiDma},
    {XPAR_FABRIC_AXI_DMA_0_MM2S_INTROUT_INTR, (Xil_ExceptionHandler)fnMM2SInterruptHandler, &sAxiDma},
    {XPAR_FABRIC_AXI_GPIO_0_IP2INTC_IRPT_INTR, (Xil_ExceptionHandler)fnUserIOIsr, &sUserIO}
};
#endif

/************** ここから SW制御・録音/再生制御の追加 **************/
#define USERIO_SW_CH   1     // Block DesignでCH2無効 → CH1を使用
#define SW0_MASK       0x1   // SW0: FFT/EQ/IFFT 単発（ONエッジで1回）
#define SW1_MASK       0x2   // SW1: 録音(MIC)  — ONの間
#define SW2_MASK       0x4   // SW2: 再生(HPH)  — ONの間
#define SW3_MASK       0x8   // SW3: 録音(LINE) — ONの間（優先）
#define CHUNK_SIZE 1024   // EQ IPが扱える単位


/* 重要：
 * 元デモではキャッシュ操作が 5 * NR_AUDIO_SAMPLES バイトで行われていた。
 * それに合わせ、1サンプル=5バイトとして扱う（内部I2S/パッキング仕様に準拠）。
 * ここを 4 にしていると整合が取れず、ノイズの原因になる。
 */
#define BYTES_PER_SAMPLE      5

/* 録音バッファの上限は、元デモが確保している領域 (= NR_AUDIO_SAMPLES サンプル) に合わせる。
 * これを越えるとDDR上の他領域を破壊 → 再生でノイズ。
 */
static u32 prev_sw = 0;

static volatile int rec_active = 0;    // 録音中？
static volatile int rec_src_line = 0;  // 1=LINE, 0=MIC
static volatile int play_active = 0;   // 再生中？

static u32  last_recorded_samples = 0; // 直近録音の実サンプル数（REC_BUF_SAMPLES以内）
static XTime rec_start_cycles = 0;     // 録音開始クロック
int procSamples = 0;

// --- スイッチ・デバウンス（3回連続同値で確定）---
static u32 sw_shadow = 0;
static u32 sw_stable = 0;
static int  sw_cnt    = 0;
static inline u32 ReadSwitchStable(void) {
    u32 raw = XGpio_DiscreteRead(&sUserIO, USERIO_SW_CH);
    if (raw == sw_shadow) {
        if (sw_cnt < 3) sw_cnt++;
    } else {
        sw_shadow = raw;
        sw_cnt = 0;
    }
    if (sw_cnt >= 3) sw_stable = sw_shadow;
    return sw_stable;
}

static void StartLongRecord(int use_line_in)
{
    if (rec_active || play_active) return;

    if (use_line_in) fnSetLineInput();
    else             fnSetMicInput();

    // “バッファ上限” で 1 本の転送を開始（SW OFFで切り上げ可能）
    XTime_GetTime(&rec_start_cycles);
    fnAudioRecord(sAxiDma, REC_BUF_SAMPLES);
    rec_active = 1;
    rec_src_line = use_line_in;
    xil_printf("\r\n[REC] long transfer started (max %d sec)", NR_SEC_TO_REC_PLAY);
}

static void StopLongRecord(void)
{
    if (!rec_active) return;

    // I2S/転送停止
    Xil_Out32(I2S_STREAM_CONTROL_REG, 0);
    Xil_Out32(I2S_TRANSFER_CONTROL_REG, 0);

    // DMA S2MM 停止（Simpleはリセットが手早い）
    XAxiDma_Reset(&sAxiDma);
    while (!XAxiDma_ResetIsDone(&sAxiDma)) {}

    // 実録音時間 → REC_BUF_SAMPLES でクリップ
    XTime end; XTime_GetTime(&end);
    u64 delta = (u64)(end - rec_start_cycles);

    u64 est_samples64 = (delta * (u64)AUDIO_SAMPLING_RATE) / (u64)COUNTS_PER_SECOND;
    if (est_samples64 > (u64)REC_BUF_SAMPLES) est_samples64 = (u64)REC_BUF_SAMPLES;
    last_recorded_samples = (u32)est_samples64;

    // 再生で読む分だけキャッシュ無効化（5バイト/サンプル）
    if (last_recorded_samples > 0) {
        Xil_DCacheInvalidateRange((UINTPTR)MEM_BASE_ADDR, last_recorded_samples * BYTES_PER_SAMPLE);
    }

    // 表示（msを文字列化）
    double time_ms = ((double)delta / (double)COUNTS_PER_SECOND) * 1000.0;
    char msbuf[32]; sprintf(msbuf, "%.3f", time_ms);
    xil_printf("\r\n[REC] stopped. duration=%s ms, samples=%u\r\n", msbuf, last_recorded_samples);

    rec_active = 0;
}

static void StartPlayOneTake(void)
{
    if (play_active || rec_active) return;
    if (last_recorded_samples == 0) {
        xil_printf("\r\n[PLAY] no recorded data.");
        return;
    }
    if (procSamples == 0) {
        xil_printf("\r\n[PLAY] no valid procSamples.");
        return;
    }

    // 短すぎるデータは拒否（50ms未満）
    if (procSamples < (AUDIO_SAMPLING_RATE / 20)) {
        xil_printf("\r\n[PLAY] too short (%u samples).", procSamples);
        return;
    }

    fnSetHpOutput();
    fnAudioPlay(sAxiDma, procSamples);   // ★ procSamples を使う
    play_active = 1;
    xil_printf("\r\n[PLAY] started. samples=%u", procSamples);
}

static void AbortPlay(void)
{
    if (!play_active) return;
    Xil_Out32(I2S_STREAM_CONTROL_REG, 0);
    Xil_Out32(I2S_TRANSFER_CONTROL_REG, 0);
    XAxiDma_Reset(&sAxiDma);
    while (!XAxiDma_ResetIsDone(&sAxiDma)) {}
    play_active = 0;
    xil_printf("\r\n[PLAY] aborted.");
}
/************** 追加ここまで **************/

/************** FFT/EQ/IFFT チェーン（単発） **************/

// --- 自作 cosf ---
// 入力: ラジアン
static float my_cosf(float x) {
    // 角度を -PI〜PI に正規化
    const float PI = 3.14159265358979323846f;
    const float TWO_PI = 6.28318530717958647692f;

    while (x >  PI) x -= TWO_PI;
    while (x < -PI) x += TWO_PI;

    // テイラー展開による近似 (x^2, x^4, x^6まで)
    float x2 = x * x;
    float result = 1.0f - x2 / 2.0f + (x2 * x2) / 24.0f - (x2 * x2 * x2) / 720.0f;
    return result;
}

// --- Hann窓とOLA用バッファ ---
static float ola_buffer[REC_BUF_SAMPLES + FFT_SIZE];   // 出力用
static float ola_norm[REC_BUF_SAMPLES + FFT_SIZE];     // 正規化カウンタ

// --- 256-point Hann Window (LUT, 0.0〜1.0) ---
static const float hann_window[256] = {
    0.000000, 0.000151, 0.000606, 0.001365, 0.002429, 0.003797, 0.005469, 0.007445,
    0.009726, 0.012310, 0.015198, 0.018389, 0.021884, 0.025682, 0.029782, 0.034185,
    0.038890, 0.043896, 0.049204, 0.054812, 0.060721, 0.066929, 0.073436, 0.080242,
    0.087345, 0.094746, 0.102443, 0.110436, 0.118724, 0.127306, 0.136181, 0.145348,
    0.154806, 0.164554, 0.174590, 0.184914, 0.195523, 0.206417, 0.217594, 0.229051,
    0.240787, 0.252800, 0.265087, 0.277647, 0.290476, 0.303573, 0.316934, 0.330558,
    0.344440, 0.358578, 0.372969, 0.387610, 0.402497, 0.417627, 0.432997, 0.448602,
    0.464440, 0.480506, 0.496797, 0.513307, 0.530033, 0.546970, 0.564114, 0.581460,
    0.599004, 0.616740, 0.634663, 0.652769, 0.671051, 0.689505, 0.708124, 0.726904,
    0.745838, 0.764920, 0.784145, 0.803507, 0.823000, 0.842617, 0.862353, 0.882201,
    0.902155, 0.922207, 0.942352, 0.962583, 0.982892, 1.000000, 0.982892, 0.962583,
    0.942352, 0.922207, 0.902155, 0.882201, 0.862353, 0.842617, 0.823000, 0.803507,
    0.784145, 0.764920, 0.745838, 0.726904, 0.708124, 0.689505, 0.671051, 0.652769,
    0.634663, 0.616740, 0.599004, 0.581460, 0.564114, 0.546970, 0.530033, 0.513307,
    0.496797, 0.480506, 0.464440, 0.448602, 0.432997, 0.417627, 0.402497, 0.387610,
    0.372969, 0.358578, 0.344440, 0.330558, 0.316934, 0.303573, 0.290476, 0.277647,
    0.265087, 0.252800, 0.240787, 0.229051, 0.217594, 0.206417, 0.195523, 0.184914,
    0.174590, 0.164554, 0.154806, 0.145348, 0.136181, 0.127306, 0.118724, 0.110436,
    0.102443, 0.094746, 0.087345, 0.080242, 0.073436, 0.066929, 0.060721, 0.054812,
    0.049204, 0.043896, 0.038890, 0.034185, 0.029782, 0.025682, 0.021884, 0.018389,
    0.015198, 0.012310, 0.009726, 0.007445, 0.005469, 0.003797, 0.002429, 0.001365,
    0.000606, 0.000151, 0.000000
};

int fnProcessAudioChain(u32 *bufferIn, u32 *bufferOut, int totalSamples) {
    const int frameSize = FFT_SIZE;
    int processed = 0;

    // --- OLAバッファ初期化 ---
    for (int i = 0; i < totalSamples + frameSize; i++) {
        ola_buffer[i] = 0.0f;
        ola_norm[i]   = 0.0f;
    }

    xil_printf("[EQ] totalSamples=%d (Hann Window + OLA, last frame padded)\r\n", totalSamples);

    int frame = 0;
    while (processed + frameSize <= totalSamples) {  // ★末尾切り捨て
        u32 *src = bufferIn  + processed;
        u32 *dst = bufferOut + processed;

        // --- 入力に窓を掛けて一時バッファへ ---
        static u32 temp_in[FFT_SIZE];
        for (int i = 0; i < frameSize; i++) {
            int sample24 = (int)(src[i] & 0xFFFFFF);
            if (sample24 & 0x800000) sample24 |= ~0xFFFFFF;
            float sample = (float)sample24 / (1 << 23);
            sample *= hann_window[i];  // Hann窓

            int s24 = (int)(sample * (1 << 23));
            if (s24 >  0x7FFFFF) s24 =  0x7FFFFF;
            if (s24 < -0x800000) s24 = -0x800000;
            temp_in[i] = (u32)(s24 & 0xFFFFFF);
        }

        int sizeBytes = frameSize * 4;

        // --- EQ IP 起動と DMA 転送 ---
        Xil_Out32(XPAR_EQ_0_S_AXI_CTRL_BASEADDR, 0x01);

        XTime tStart, tEnd;
            XTime_GetTime(&tStart);

        XAxiDma_SimpleTransfer(&sAxiDmaEq, (UINTPTR)temp_in, sizeBytes, XAXIDMA_DMA_TO_DEVICE);
        XAxiDma_SimpleTransfer(&sAxiDmaEq, (UINTPTR)dst,     sizeBytes, XAXIDMA_DEVICE_TO_DMA);
        while (XAxiDma_Busy(&sAxiDmaEq, XAXIDMA_DMA_TO_DEVICE));
        while (XAxiDma_Busy(&sAxiDmaEq, XAXIDMA_DEVICE_TO_DMA));

        XTime_GetTime(&tEnd);

        u64 cycles = tEnd - tStart;
        u64 us = (cycles * 1000000ULL) / (COUNTS_PER_SECOND * 2);

        xil_printf("[EQ] Frame %d runtime: %llu us (%llu cycles)\r\n",
                   frame, us, cycles);

        // --- OLA 加算 ---
        for (int i = 0; i < frameSize; i++) {
            int sample24 = (int)(dst[i] & 0xFFFFFF);
            if (sample24 & 0x800000) sample24 |= ~0xFFFFFF;
            float sample = (float)sample24 / (1 << 23);

            float w = hann_window[i];
            ola_buffer[processed + i] += sample;
            ola_norm[processed + i]   += w;
        }

        processed += frameSize / 2;
        frame++;
    }

    // usableSamples = OLA 正常に処理できた部分だけ
    int usableSamples = processed;

    // --- Peak値を探索 ---
    float peak = 0.0f;
    for (int i = 0; i < usableSamples; i++) {
        float norm = (ola_norm[i] > 1e-6f) ? ola_norm[i] : 1.0f;
        float sample = ola_buffer[i] / norm;
        if (fabsf(sample) > peak) peak = fabsf(sample);
    }

    // --- スケーリング ---
    float scale = (peak > 1e-6f) ? (0.9f / peak) : 1.0f;

    // --- 出力 ---
    for (int i = 0; i < usableSamples; i++) {
        float norm   = (ola_norm[i] > 1e-6f) ? ola_norm[i] : 1.0f;
        float sample = (ola_buffer[i] / norm) * scale;

        int s24 = (int)(sample * (1 << 23));
        if (s24 >  0x7FFFFF) s24 =  0x7FFFFF;
        if (s24 < -0x800000) s24 = -0x800000;
        bufferOut[i] = (u32)(s24 & 0xFFFFFF);
    }
    // --- キャッシュフラッシュ ---
    Xil_DCacheFlushRange((UINTPTR)bufferOut, usableSamples * BYTES_PER_SAMPLE);

    xil_printf("[EQ] Output done. usableSamples=%d (dropped last frame)\r\n",
               usableSamples);

    return usableSamples;
}

int main(void) {
    int Status;
    Demo.u8Verbose = 0;

    xil_printf("\r\n--- Entering main() --- \r\n");

    Status = fnInitInterruptController(&sIntc);
    if (Status != XST_SUCCESS) return XST_FAILURE;

    Status = fnInitIic(&sIic);
    if (Status != XST_SUCCESS) return XST_FAILURE;

    Status = fnInitUserIO(&sUserIO);
    if (Status != XST_SUCCESS) return XST_FAILURE;

    // スイッチ側チャンネルを入力方向に（BD構成に合わせて）
    XGpio_SetDataDirection(&sUserIO, USERIO_SW_CH, 0xFFFFFFFF);

    Status = fnConfigDma(&sAxiDma);     // 録音・再生用 DMA
    if (Status != XST_SUCCESS) return XST_FAILURE;

    Status = fnConfigDmaEq(&sAxiDmaEq, XPAR_AXIDMA_1_DEVICE_ID); // EQ 用 DMA
    if (Status != XST_SUCCESS) return XST_FAILURE;

    Status = fnInitAudio();
    if (Status != XST_SUCCESS) return XST_FAILURE;

    fnEnableInterrupts(&sIntc, &ivt[0], sizeof(ivt)/sizeof(ivt[0]));

    xil_printf("----------------------------------------------------------\r\n");
    xil_printf("Zybo Z7-20 DMA Audio Demo (Switch-driven)\r\n");
    xil_printf("----------------------------------------------------------\r\n");
    xil_printf("  SW0: Run FFT/EQ/IFFT once (edge-trigger)\r\n");
    xil_printf("  SW1: Record MIC  while ON  (one take)\r\n");
    xil_printf("  SW2: Play HPH    while ON  (loops same take)\r\n");
    xil_printf("  SW3: Record LINE while ON  (one take; priority over SW1)\r\n");
    xil_printf("----------------------------------------------------------\r\n");

    while (1) {
        // ========= スイッチ読み取り（デバウンス後の安定値）=========
        u32 sw = ReadSwitchStable();
        int sw0 = (sw & SW0_MASK) != 0;
        int sw1 = (sw & SW1_MASK) != 0;  // MIC
        int sw2 = (sw & SW2_MASK) != 0;  // PLAY
        int sw3 = (sw & SW3_MASK) != 0;  // LINE

        // ========= SW0: FFT/EQ/IFFT 単発（ONエッジ）=========
        if (sw0 && !(prev_sw & SW0_MASK)) {
            if (!rec_active && !play_active) {
                int usable = fnProcessAudioChain((u32 *)MEM_BASE_ADDR,
                                                 (u32 *)MEM_BASE_ADDR,
                                                 last_recorded_samples);
                xil_printf("[SW0] EQ processing completed. usableSamples=%d\r\n", usable);

                // ★ 再生に使うサンプル数を更新
                last_recorded_samples = usable;
            } else {
                xil_printf("\r\n[SW0] Busy. Skipped.");
            }
        }
        // ========= 録音（ONの間：開始/停止はエッジ）=========
        // LINE を優先
        if (sw3 && !(prev_sw & SW3_MASK)) {           // LINE録音 開始
            if (!rec_active && !play_active) StartLongRecord(1);
        }
        if (!sw3 && (prev_sw & SW3_MASK)) {           // LINE録音 停止
            if (rec_active && rec_src_line) StopLongRecord();
        }

        if (sw1 && !(prev_sw & SW1_MASK)) {           // MIC録音 開始（LINEより低優先）
            if (!rec_active && !play_active && !sw3) StartLongRecord(0);
        }
        if (!sw1 && (prev_sw & SW1_MASK)) {           // MIC録音 停止
            if (rec_active && !rec_src_line) StopLongRecord();
        }

        // ========= 再生（ONの間：一回分を流し、ONが続けば同じ長さで再トリガ）=========
        if (sw2 && !(prev_sw & SW2_MASK)) {           // 再生開始
            if (!rec_active && !play_active) StartPlayOneTake();
        }
        if (!sw2 && (prev_sw & SW2_MASK)) {           // 再生停止（OFFで即中断）
            AbortPlay();
        }

        // ========= 割り込みフラグ処理 =========
        // 録音完了（バッファ上限まで到達）→ 停止扱い
        if (Demo.fDmaS2MMEvent) {
            Xil_Out32(I2S_STREAM_CONTROL_REG, 0);
            Xil_Out32(I2S_TRANSFER_CONTROL_REG, 0);
            Xil_DCacheInvalidateRange((u32)MEM_BASE_ADDR, REC_BUF_BYTES);
            Demo.fDmaS2MMEvent = 0;
            Demo.fAudioRecord = 0;

            if (rec_active) {
                last_recorded_samples = REC_BUF_SAMPLES;
                rec_active = 0;
                xil_printf("\r\n[REC] reached buffer limit. samples=%u", last_recorded_samples);

                // ★ FFT サイズに切り捨てて保持
                        procSamples = last_recorded_samples & ~(FFT_SIZE - 1);
                        xil_printf("\r\n[REC] procSamples=%d (aligned to %d)\r\n", procSamples, FFT_SIZE);
            }
        }

        // 再生完了 → SW2がまだONなら同じ長さで再トリガ（見かけ上連続）
        if (Demo.fDmaMM2SEvent) {
            Xil_Out32(I2S_STREAM_CONTROL_REG, 0);
            Xil_Out32(I2S_TRANSFER_CONTROL_REG, 0);
            if (last_recorded_samples > 0) {
                Xil_DCacheFlushRange((u32)MEM_BASE_ADDR, last_recorded_samples * BYTES_PER_SAMPLE);
            }
            Demo.fDmaMM2SEvent = 0;
            Demo.fAudioPlayback = 0;
            play_active = 0;

            if (sw2) {
                StartPlayOneTake();
            }
        }

        // エラー → 停止
        if (Demo.fDmaError) {
            xil_printf("\r\nDMA Error. Resetting...");
            Demo.fDmaError = 0;
            AbortPlay();
            StopLongRecord();
        }

        prev_sw = sw;
    }

    return XST_SUCCESS;
}
