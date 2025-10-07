// common.h
#include <hls_stream.h>
#include <ap_axi_sdata.h>
#include <ap_fixed.h>
#include <complex>
#include <cmath>

#define MAX_FFT_SIZE 1024
#define PI 3.14159265358979323846

typedef ap_axis<32,2,5,6> axis_t;  // 32bit幅, AXI4-Stream
typedef ap_fixed<16,2> fixed_t;    // 固定小数点（調整可）
typedef std::complex<fixed_t> cplx_t;

inline unsigned bit_reverse(unsigned x, int log2n) {
    unsigned n = 0;
    for (int i = 0; i < log2n; i++) {
        n = (n << 1) | ((x >> i) & 1);
    }
    return n;
}

// Twiddle LUT (最大サイズ分)
static cplx_t twiddle[MAX_FFT_SIZE/2];

// 初期化関数
inline void init_twiddle(int N, bool inverse=false) {
    for (int i = 0; i < N/2; i++) {
        double ang = 2 * PI * i / N;
        if (inverse) ang = -ang;
        twiddle[i] = cplx_t((fixed_t)cos(ang), (fixed_t)sin(ang));
    }
}
