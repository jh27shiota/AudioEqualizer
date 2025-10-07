#include <hls_stream.h>
#include <ap_axi_sdata.h>
#include <ap_fixed.h>
#include <cmath>
#include <chrono>
using namespace std::chrono;

#define MAX_FFT_SIZE 1024
#define PI 3.14159265358979323846

typedef ap_axis<32,2,5,6> axis_t;

// 実部は最低24bit確保（符号付き）
typedef ap_fixed<40,24> fixed_t;  // 入力24bitを安全に保持

struct complex_t {
    fixed_t re;
    fixed_t im;
};

// --- Twiddle factor ---
typedef ap_fixed<24,2> twid_t;   // ★ 精度を上げた
static twid_t twiddle_re[MAX_FFT_SIZE/2];
static twid_t twiddle_im[MAX_FFT_SIZE/2];

void init_twiddle(int fft_size, bool inverse) {
    for (int i = 0; i < fft_size/2; i++) {
        double angle = 2 * PI * i / fft_size;
        if (!inverse) angle = -angle;
        twiddle_re[i] = (twid_t)std::cos(angle);
        twiddle_im[i] = (twid_t)std::sin(angle);
    }
}

// --- Bit reversal ---
unsigned bit_reverse(unsigned x, int log2n) {
    unsigned n = 0;
    for (int i = 0; i < log2n; i++) {
        n <<= 1;
        n |= (x >> i) & 1;
    }
    return n;
}

// --- FFT/IFFT ---
void fft(complex_t buf[MAX_FFT_SIZE], int fft_size, bool inverse) {
    init_twiddle(fft_size, inverse);

    int logN = 0;
    for (int temp = fft_size; temp > 1; temp >>= 1) logN++;

    // Bit-reverse
    for (int i = 0; i < fft_size; i++) {
        int j = bit_reverse(i, logN);
        if (i < j) {
            complex_t tmp = buf[i];
            buf[i] = buf[j];
            buf[j] = tmp;
        }
    }

    // Cooley-Tukey
    for (int s = 1; s <= logN; s++) {
        int m = 1 << s;
        int m2 = m >> 1;
        for (int k = 0; k < fft_size; k += m) {
#pragma HLS PIPELINE II=1
            for (int j = 0; j < m2; j++) {
                int idx = j * (fft_size / m);
                twid_t tr = twiddle_re[idx];
                twid_t ti = twiddle_im[idx];

                fixed_t xr = buf[k + j + m2].re;
                fixed_t xi = buf[k + j + m2].im;

                fixed_t pr = xr * tr - xi * ti;
                fixed_t pi = xr * ti + xi * tr;

                complex_t tmp = buf[k + j];
                buf[k + j].re      = tmp.re + pr;
                buf[k + j].im      = tmp.im + pi;
                buf[k + j + m2].re = tmp.re - pr;
                buf[k + j + m2].im = tmp.im - pi;
            }
        }
    }

    // IFFT normalization
    if (inverse) {
        for (int i = 0; i < fft_size; i++) {
            buf[i].re /= fft_size;
            buf[i].im /= fft_size;
        }
    }
}

static void apply_eq(complex_t buf[MAX_FFT_SIZE], int fft_size) {
    for (int i = 1; i < fft_size/2; i++) {
#pragma HLS PIPELINE II=1

        // デフォルトはそのまま
        int mode = 1;  // 1:そのまま, 2:2倍, -1:0.5倍

        if (i == 1) {
            // <200 Hz → 2倍
            mode = 2;
        }
        else if (i >= 2 && i <= 4) {
            // 200–800 Hz → 0.5倍
            mode = -1;
        }
        else if (i >= 5 && i <= 16) {
            // 800–3000 Hz → 1倍（そのまま）
            mode = 1;
        }
        else if (i >= 17 && i <= 42) {
            // 3–8 kHz → 2倍
            mode = 2;
        }
        else {
            // >8 kHz → 0.5倍
            mode = -1;
        }

        // 実部・虚部にゲイン適用（シフト演算）
        if (mode == 2) {
            buf[i].re = buf[i].re << 1;
            buf[i].im = buf[i].im << 1;
            buf[fft_size - i].re = buf[fft_size - i].re << 1;
            buf[fft_size - i].im = buf[fft_size - i].im << 1;
        } else if (mode == -1) {
            buf[i].re = buf[i].re >> 1;
            buf[i].im = buf[i].im >> 1;
            buf[fft_size - i].re = buf[fft_size - i].re >> 1;
            buf[fft_size - i].im = buf[fft_size - i].im >> 1;
        }
        // mode==1 の場合は処理なし
    }

    // DC成分とNyquist成分は0にする
    buf[0].re = buf[0].im = 0;
    buf[fft_size/2].re = buf[fft_size/2].im = 0;
}

// --- Top module ---
void EQ(hls::stream<axis_t>& in_stream,
        hls::stream<axis_t>& out_stream,
        int sample_rate) {
#pragma HLS INTERFACE axis port=in_stream
#pragma HLS INTERFACE axis port=out_stream
#pragma HLS INTERFACE s_axilite port=sample_rate bundle=CTRL
#pragma HLS INTERFACE s_axilite port=return bundle=CTRL

#ifndef __SYNTHESIS__  // 合成時は削除
    auto t1 = high_resolution_clock::now();
#endif

    axis_t in_data;
    complex_t buf[MAX_FFT_SIZE];

    int count = 0;
    bool last = false;

    // --- Input (24bit real, imag=0) ---
    while (!last && count < MAX_FFT_SIZE) {
#pragma HLS PIPELINE II=1
        in_data = in_stream.read();
        ap_int<32> din = in_data.data;

        ap_int<24> real24 = din & 0xFFFFFF;
        // 正規化
        buf[count].re = (fixed_t)real24 / (1 << 23);
        buf[count].im = 0;

        last = in_data.last;
        count++;
    }

    int fft_size = count;

    // FFT → EQ → IFFT
    fft(buf, fft_size, false);
    apply_eq(buf, fft_size);
    fft(buf, fft_size, true);

    // --- Output (24bit に戻す) ---
    for (int i = 0; i < fft_size; i++) {
#pragma HLS PIPELINE II=1
        axis_t out_data;

        // ★ スケーリングを戻す
        ap_int<24> real24 = (ap_int<24>)(buf[i].re * (1 << 23));
        ap_int<32> dout   = real24;

        out_data.data = dout;
        out_data.keep = -1;
        out_data.strb = -1;
        out_data.user = 0;
        out_data.id   = 0;
        out_data.dest = 0;
        out_data.last = (i == fft_size - 1);
        out_stream.write(out_data);
    }
}
