#include <hls_stream.h>
#include <ap_axi_sdata.h>
#include <ap_int.h>
#include <cmath>
#include <cstdio>

extern void EQ(hls::stream<ap_axis<32,2,5,6>>& in_stream,
               hls::stream<ap_axis<32,2,5,6>>& out_stream,
               int sample_rate);

typedef ap_axis<32,2,5,6> axis_t;

#define FFT_SIZE 256
#define PI 3.141592653589793

// --- サイン波生成 ---
void gen_sine(int *buf, int N, float freq, int sample_rate) {
    for (int i = 0; i < N; i++) {
        float t = (float)i / sample_rate;
        float val = sinf(2 * PI * freq * t);
        const float AMP_SCALE = 0.25f;  // 振幅を25%に
        buf[i] = (int)(val * ((1<<23)-1) * AMP_SCALE);

    }
}

// --- DC信号生成 ---
void gen_dc(int *buf, int N, float level) {
    int val = (int)(level * ((1<<23)-1));
    for (int i = 0; i < N; i++) buf[i] = val;
}

// --- RMS計算 ---
float calc_rms(const int *data, int N) {
    long long sum_sq = 0;
    for (int i = 0; i < N; i++) {
        sum_sq += (long long)data[i] * data[i];
    }
    return sqrt((double)sum_sq / N);
}

int main() {
    hls::stream<axis_t> in_stream, out_stream;
    int sample24[FFT_SIZE];
    const int sample_rate = 48000;

    struct { const char* name; float freq; bool is_dc; } tests[] = {
        {"DC",      0.0f,   true},
        {"187.5 Hz", 187.5f, false},   // bin[1]
        {"562.5 Hz", 562.5f, false},   // bin[3]
        {"937.5 Hz", 937.5f, false},   // bin[5]
        {"5062.5 Hz", 5062.5f, false}, // bin[27]
    };

    for (int t = 0; t < 5; t++) {
        printf("\n=== Test: %s ===\n", tests[t].name);

        // 入力生成
        if (tests[t].is_dc) gen_dc(sample24, FFT_SIZE, 0.5f);
        else gen_sine(sample24, FFT_SIZE, tests[t].freq, sample_rate);

        // 入力ストリームへ書き込み
        for (int i = 0; i < FFT_SIZE; i++) {
            axis_t d;
            ap_int<24> val24 = sample24[i];
            ap_int<32> dout  = val24;
            d.data = dout & 0xFFFFFF;
            d.keep = -1;
            d.strb = -1;
            d.last = (i == FFT_SIZE-1);
            in_stream.write(d);
        }

        // EQ 実行
        EQ(in_stream, out_stream, sample_rate);

        // 出力を取得
        int out24_arr[FFT_SIZE];
        for (int i = 0; i < FFT_SIZE; i++) {
            axis_t d = out_stream.read();
            int out24 = (int)(d.data & 0xFFFFFF);
            if (out24 & 0x800000) out24 |= ~0xFFFFFF; // 符号拡張
            out24_arr[i] = out24;
        }

        // RMS/Peak 比較
        float rms_in  = calc_rms(sample24, FFT_SIZE);
        float rms_out = calc_rms(out24_arr, FFT_SIZE);

        int peak_in = 0, peak_out = 0;
        for (int i = 0; i < FFT_SIZE; i++) {
            if (std::abs(sample24[i]) > peak_in)  peak_in  = std::abs(sample24[i]);
            if (std::abs(out24_arr[i]) > peak_out) peak_out = std::abs(out24_arr[i]);
        }

        printf("RMS IN = %.1f, RMS OUT = %.1f, Ratio = %.2f\n",
               rms_in, rms_out, rms_out / rms_in);
        printf("Peak IN = %d, Peak OUT = %d, Ratio = %.2f\n",
               peak_in, peak_out, (double)peak_out / peak_in);

        // 入出力対比を最初の16サンプル表示
        printf("Index | Input | Output\n");
        for (int i = 0; i < 16; i++) {
            printf("[%d] | %d | %d\n", i, sample24[i], out24_arr[i]);
        }
    }
    return 0;
}
