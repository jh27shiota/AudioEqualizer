#include <iostream>
#include <vector>
#include <cmath>
#include <chrono>
#define DR_WAV_IMPLEMENTATION
#include "dr_wav.h"

#define FFT_SIZE 256
#define HOP_SIZE (FFT_SIZE / 2)
#define PI 3.14159265358979323846

// 24bit 相当のスケーリング
using sample_t = int32_t;  

struct complex_t {
    int32_t re;
    int32_t im;
};

// --- Hann window ---
static std::vector<float> hann_window;

void init_hann() {
    hann_window.resize(FFT_SIZE);
    for (int i = 0; i < FFT_SIZE; i++) {
        hann_window[i] = 0.5f * (1.0f - cosf(2.0f * PI * i / (FFT_SIZE - 1)));
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

// --- Twiddle LUT ---
static int32_t tw_re[FFT_SIZE/2];
static int32_t tw_im[FFT_SIZE/2];

void init_twiddle() {
    for (int i = 0; i < FFT_SIZE/2; i++) {
        double angle = -2.0 * PI * i / FFT_SIZE;
        tw_re[i] = (int32_t)(cos(angle) * (1<<15)); // Q1.15
        tw_im[i] = (int32_t)(sin(angle) * (1<<15));
    }
}

// --- FFT/IFFT (fixed-point like) ---
void fft(complex_t buf[FFT_SIZE], bool inverse) {
    int logN = 0;
    for (int temp = FFT_SIZE; temp > 1; temp >>= 1) logN++;

    // Bit reverse
    for (int i = 0; i < FFT_SIZE; i++) {
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
        for (int k = 0; k < FFT_SIZE; k += m) {
            for (int j = 0; j < m2; j++) {
                int idx = j * (FFT_SIZE / m);
                int32_t tr = tw_re[idx];
                int32_t ti = inverse ? -tw_im[idx] : tw_im[idx];

                int32_t xr = buf[k + j + m2].re;
                int32_t xi = buf[k + j + m2].im;

                // fixed-point multiply (Q1.15)
                int32_t pr = (int64_t)xr * tr / (1<<15) - (int64_t)xi * ti / (1<<15);
                int32_t pi = (int64_t)xr * ti / (1<<15) + (int64_t)xi * tr / (1<<15);

                int32_t ur = buf[k + j].re;
                int32_t ui = buf[k + j].im;

                buf[k + j].re      = ur + pr;
                buf[k + j].im      = ui + pi;
                buf[k + j + m2].re = ur - pr;
                buf[k + j + m2].im = ui - pi;
            }
        }
    }

    // IFFT normalize
    if (inverse) {
        for (int i = 0; i < FFT_SIZE; i++) {
            buf[i].re /= FFT_SIZE;
            buf[i].im /= FFT_SIZE;
        }
    }
}

// --- EQ (シフト演算ベース) ---
void apply_eq(complex_t buf[FFT_SIZE]) {
    for (int i = 1; i < FFT_SIZE/2; i++) {
        int mode = 1;
        if (i == 1) mode = 2;
        else if (i >= 2 && i <= 4) mode = -1;
        else if (i >= 5 && i <= 16) mode = 1;
        else if (i >= 17 && i <= 42) mode = 2;
        else mode = -1;

        if (mode == 2) {
            buf[i].re <<= 1; buf[i].im <<= 1;
            buf[FFT_SIZE - i].re <<= 1; buf[FFT_SIZE - i].im <<= 1;
        } else if (mode == -1) {
            buf[i].re >>= 1; buf[i].im >>= 1;
            buf[FFT_SIZE - i].re >>= 1; buf[FFT_SIZE - i].im >>= 1;
        }
    }
    buf[0].re = buf[0].im = 0;
    buf[FFT_SIZE/2].re = buf[FFT_SIZE/2].im = 0;
}

int main() {
    // 入力読み込み
    drwav wav;
    if (!drwav_init_file(&wav, "input.wav", NULL)) {
        std::cerr << "Failed to open input.wav" << std::endl;
        return 1;
    }
    std::vector<float> original(wav.totalPCMFrameCount * wav.channels);
    drwav_read_pcm_frames_f32(&wav, wav.totalPCMFrameCount, original.data());
    drwav_uninit(&wav);

    int sampleRate = wav.sampleRate;
    size_t numSamples = original.size();

    // 出力
    std::vector<float> output(numSamples + FFT_SIZE, 0.0f);

    init_hann();
    init_twiddle();

    auto globalStart = std::chrono::high_resolution_clock::now();

    double fftEqIfftTotalMs = 0.0;
    int frame = 0;
    for (size_t pos = 0; pos + FFT_SIZE <= numSamples; pos += HOP_SIZE) {
        complex_t buf[FFT_SIZE];

        // Windowing + 24bit固定小数点化
        for (int i = 0; i < FFT_SIZE; i++) {
            float sample = original[pos + i] * hann_window[i];
            int32_t s24 = (int32_t)(sample * (1<<23));
            buf[i].re = s24;
            buf[i].im = 0;
        }

        auto start = std::chrono::high_resolution_clock::now();
        auto t1 = std::chrono::high_resolution_clock::now();

        fft(buf, false);
        apply_eq(buf);
        fft(buf, true);

        auto t2 = std::chrono::high_resolution_clock::now();
        auto end = std::chrono::high_resolution_clock::now();
        double us = std::chrono::duration<double, std::micro>(t2 - t1).count();
        fftEqIfftTotalMs += std::chrono::duration<double, std::milli>(end - start).count();
        std::cout << "[EQ] Frame " << frame << " runtime: " << us << " us\n";

        // Overlap-Add
        for (int i = 0; i < FFT_SIZE; i++) {
            output[pos + i] += (float)buf[i].re / (1<<23);
        }
        frame++;
    }

    auto globalEnd = std::chrono::high_resolution_clock::now();
    double totalMs = std::chrono::duration<double, std::milli>(globalEnd - globalStart).count();
    std::cout << "Total processing time = " << totalMs << " ms" << std::endl;
    std::cout << "Total FFT→EQ→IFFT time = " << fftEqIfftTotalMs << " ms" << std::endl;

    // 保存
    drwav_data_format format;
    format.container = drwav_container_riff;
    format.format = DR_WAVE_FORMAT_IEEE_FLOAT;
    format.channels = wav.channels;
    format.sampleRate = sampleRate;
    format.bitsPerSample = 32;

    drwav outWav;
    if (drwav_init_file_write(&outWav, "output.wav", &format, NULL)) {
        drwav_write_pcm_frames(&outWav, wav.totalPCMFrameCount, output.data());
        drwav_uninit(&outWav);
    }
    system("pause");
    return 0;
}
