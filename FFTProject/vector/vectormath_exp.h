/****************************  vectormath_exp.h   ******************************
* Author:        Agner Fog
* Date created:  2014-04-18
* Last modified: 2014-05-02
* Version:       1.12
* Project:       vector classes
* Description:
* Header file containing inline vector functions of logarithms, exponential 
* and power functions:
* exp         exponential function
* exmp1       exponential function minus 1
* log         natural logarithm
* log1p       natural logarithm of 1+x
* cbrt        cube root
* pow         raise vector elements to power
* pow_ratio   raise vector elements to rational power
*
* For detailed instructions, see vectormath_common.h and VectorClass.pdf
*
* (c) Copyright 2014 GNU General Public License http://www.gnu.org/licenses
******************************************************************************/

#ifndef VECTORMATH_EXP_H
#define VECTORMATH_EXP_H  1


#include "vectormath_common.h"



/******************************************************************************
*                 Exponential functions
******************************************************************************/

// Helper functions, used internally:

// This function calculates pow(2,n) where n must be an integer. Does not check for overflow or underflow
static inline Vec4d vm_pow2n (Vec4d const & n) {
    const double pow2_52 = 4503599627370496.0;   // 2^52
    const double bias = 1023.0;                  // bias in exponent
    Vec4d a = n + (bias + pow2_52);              // put n + bias in least significant bits
    Vec4q b = reinterpret_i(a);                  // bit-cast to integer
    Vec4q c = b << 52;                           // shift left 52 places to get value into exponent field
    Vec4d d = reinterpret_d(c);                  // bit-cast back to double
    return d;
}

static inline Vec2d vm_pow2n (Vec2d const & n) {
    const double pow2_52 = 4503599627370496.0;   // 2^52
    const double bias = 1023.0;                  // bias in exponent
    Vec2d a = n + (bias + pow2_52);              // put n + bias in least significant bits
    Vec2q b = reinterpret_i(a);                  // bit-cast to integer
    Vec2q c = b << 52;                           // shift left 52 places to get into exponent field
    Vec2d d = reinterpret_d(c);                  // bit-cast back to double
    return d;
}

static inline Vec8f vm_pow2n (Vec8f const & n) {
    const float pow2_23 =  8388608.0;            // 2^23
    const float bias = 127.0;                    // bias in exponent
    Vec8f a = n + (bias + pow2_23);              // put n + bias in least significant bits
    Vec8i b = reinterpret_i(a);                  // bit-cast to integer
    Vec8i c = b << 23;                           // shift left 23 places to get into exponent field
    Vec8f d = reinterpret_f(c);                  // bit-cast back to float
    return d;
}

static inline Vec4f vm_pow2n (Vec4f const & n) {
    const float pow2_23 =  8388608.0;            // 2^23
    const float bias = 127.0;                    // bias in exponent
    Vec4f a = n + (bias + pow2_23);              // put n + bias in least significant bits
    Vec4i b = reinterpret_i(a);                  // bit-cast to integer
    Vec4i c = b << 23;                           // shift left 23 places to get into exponent field
    Vec4f d = reinterpret_f(c);                  // bit-cast back to float
    return d;
}


// exp function, double precision
// lower limit: -708.39
// upper limit:  708.39
// does not produce denormals
// template parameters:
// VTYPE: f.p. vector type
// BTYPE: boolean vector type
// M1: 0 for exp, 1 for expm1

#if 1  // choose method

// Taylor expansion
template<class VTYPE, class BTYPE, int M1> 
static inline VTYPE exp_d(VTYPE const & initial_x) {    

    // define constants
    static const double ln2d_hi = 0.693145751953125;
    static const double ln2d_lo = 1.42860682030941723212E-6;
    static const double log2e   = VM_LOG2E;
    static const double max_exp = 708.39;
    // Taylor coefficients, 1/n!
    static const double p2  = 1./2.;
    static const double p3  = 1./6.;
    static const double p4  = 1./24.;
    static const double p5  = 1./120.; 
    static const double p6  = 1./720.; 
    static const double p7  = 1./5040.; 
    static const double p8  = 1./40320.; 
    static const double p9  = 1./362880.; 
    static const double p10 = 1./3628800.; 
    static const double p11 = 1./39916800.; 
    static const double p12 = 1./479001600.; 
    static const double p13 = 1./6227020800.; 

    // data vectors
    VTYPE x, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13;
    VTYPE r, z, n2;
    BTYPE inrange;                     // boolean vector

    x = initial_x;
    r = round(initial_x*log2e);

    x -= r * ln2d_hi;                    // subtraction in two steps for higher precision
    x -= r * ln2d_lo;

    // powers of x
    x2  = x  * x;
    x4  = x2 * x2;
    x8  = x4 * x4;
    x3  = x2 * x;
    x5  = x4 * x;
    x9  = x8 * x;
    x10 = x8 * x2;
    x11 = x8 * x3;
    x12 = x8 * x4;
    x13 = x8 * x5;
    x6  = x4 * x2;
    x7  = x6 * x;

    // Taylor polynomial
    z = ((x+p2*x2)+(p3*x3+p4*x4)) + 
        ((p5*x5+p6*x6)+(p7*x7+p8*x8)) +        
        (((p9*x9+p10*x10)+(p11*x11+p12*x12))+
        (p13*x13));

    // multiply by power of 2 
    n2 = vm_pow2n(r);

    if (M1 == 0) {
        // exp
        z = (z + 1.0) * n2;
    }
    else {
        // expm1
        z = z * n2 + (n2 - 1.0);
    }

    // check for overflow
    inrange  = abs(initial_x) < max_exp;
    // check for INF and NAN
    inrange &= is_finite(initial_x);

    if (horizontal_and(inrange)) {
        // fast normal path
        return z;
    }
    else {
        // overflow, underflow and NAN
        r = select(sign_bit(initial_x), 0.-M1, infinite_vec<VTYPE>()); // value in case of +/- overflow or INF
        z = select(inrange, z, r);                                      // +/- underflow
        z = select(is_nan(initial_x), initial_x, z);                    // NAN goes through
        return z;
    }
}

#else

// Padé expansion uses less code and fewer registers, but is slower
template<class VTYPE, class BTYPE, int M1> 
static inline VTYPE exp_d(VTYPE const & initial_x) {

    // define constants
    static const double ln2p1   = 0.693145751953125;
    static const double ln2p2   = 1.42860682030941723212E-6;
    static const double log2e   = VM_LOG2E;
    static const double max_exp = 708.39;
    // coefficients of pade polynomials
    static const double P0exp = 9.99999999999999999910E-1;
    static const double P1exp = 3.02994407707441961300E-2;
    static const double P2exp = 1.26177193074810590878E-4;
    static const double Q0exp = 2.00000000000000000009E0;
    static const double Q1exp = 2.27265548208155028766E-1;
    static const double Q2exp = 2.52448340349684104192E-3;
    static const double Q3exp = 3.00198505138664455042E-6;

    VTYPE x, r, xx, px, qx, y, n2;          // data vectors
    BTYPE inrange;                          // boolean vector

    x = initial_x;
    r = round(initial_x*log2e);

    x -= r * ln2p1;           // subtraction in one step would gives loss of precision
    x -= r * ln2p2;

    xx = x * x;

    // px = x * P(x^2).
    px = polynomial_2(xx, P0exp, P1exp, P2exp) * x;

    // Evaluate Q(x^2).
    qx = polynomial_3(xx, Q0exp, Q1exp, Q2exp, Q3exp);

    // e^x = 1 + 2*P(x^2)/( Q(x^2) - P(x^2) )
    y = (2.0 * px) / (qx - px);

    // Get 2^n in double.
    // n  = round_to_int64_limited(r);
    // n2 = exp2(n);
    n2 = vm_pow2n(r);  // this is faster

    if (M1 == 0) {
        // exp
        y = (y + 1.0) * n2;
    }
    else {
        // expm1
        y = y * n2 + (n2 - 1.0);
    }

    // overflow
    inrange  = abs(initial_x) < max_exp;
    // check for INF and NAN
    inrange &= is_finite(initial_x);

    if (horizontal_and(inrange)) {
        // fast normal path
        return y;
    }
    else {
        // overflow, underflow and NAN
        r = select(sign_bit(initial_x), 0.-M1, infinite_vec<VTYPE>()); // value in case of overflow or INF
        y = select(inrange, y, r);                                     // +/- overflow
        y = select(is_nan(initial_x), initial_x, y);                   // NAN goes through
        return y;
    }
}
#endif

// instances of exp_d template
static inline Vec2d exp(Vec2d const & x) {
    return exp_d<Vec2d, Vec2db, 0>(x);
}

static inline Vec4d exp(Vec4d const & x) {
    return exp_d<Vec4d, Vec4db, 0>(x);
}

static inline Vec2d expm1(Vec2d const & x) {
    return exp_d<Vec2d, Vec2db, 1>(x);
}

static inline Vec4d expm1(Vec4d const & x) {
    return exp_d<Vec4d, Vec4db, 1>(x);
}

static inline Vec2d exp2(Vec2d const & x) {
    return exp_d<Vec2d, Vec2db, 0>(x * VM_LN2);
}

static inline Vec4d exp2(Vec4d const & x) {
    return exp_d<Vec4d, Vec4db, 0>(x * VM_LN2);
}

static inline Vec2d exp10(Vec2d const & x) {
    return exp_d<Vec2d, Vec2db, 0>(x * VM_LN10);
}

static inline Vec4d exp10(Vec4d const & x) {
    return exp_d<Vec4d, Vec4db, 0>(x * VM_LN10);
}


// template for exp function, single precision
// lower limit: -87.3
// upper limit:  87.3
// does not produce denormals
// template parameters:
// VTYPE: f.p. vector type
// BTYPE: boolean vector type
// M1: 0 for exp, 1 for expm1

template<class VTYPE, class BTYPE, int M1> 
static inline VTYPE exp_f(VTYPE const & initial_x) {

    // define constants
    static const float ln2f_hi  =  0.693359375f;
    static const float ln2f_lo  = -2.12194440e-4f;
    static const float max_expf =  87.3f;
    // Taylor coefficients
    static const float P0expf   =  1.f/2.f;
    static const float P1expf   =  1.f/6.f;
    static const float P2expf   =  1.f/24.f;
    static const float P3expf   =  1.f/120.f; 
    static const float P4expf   =  1.f/720.f; 
    static const float P5expf   =  1.f/5040.f; 

    VTYPE x, r, x2, z, n2;                  // data vectors        
    BTYPE inrange;                          // boolean vector

    x = initial_x;
    r = round(initial_x*float(VM_LOG2E));
    x -= r * ln2f_hi;
    x -= r * ln2f_lo;
    x2 = x * x;
    z = polynomial_5(x,P0expf,P1expf,P2expf,P3expf,P4expf,P5expf);    
    z *= x2;
    z += x;

    // multiply by power of 2 
    n2 = vm_pow2n(r);

    if (M1 == 0) {
        // exp
        z = (z + 1.0f) * n2;
    }
    else {
        // expm1
        z = z * n2 + (n2 - 1.0f);
    }

    // check for overflow
    inrange  = abs(initial_x) < max_expf;
    // check for INF and NAN
    inrange &= is_finite(initial_x);

    if (horizontal_and(inrange)) {
        // fast normal path
        return z;
    }
    else {
        // overflow, underflow and NAN
        r = select(sign_bit(initial_x), 0.f-M1, infinite_vec<VTYPE>()); // value in case of +/- overflow or INF
        z = select(inrange, z, r);                                      // +/- underflow
        z = select(is_nan(initial_x), initial_x, z);                    // NAN goes through
        return z;
    }
}

// instances of exp_f template
static inline Vec4f exp(Vec4f const & x) {
    return exp_f<Vec4f, Vec4fb, 0>(x);
}

static inline Vec8f exp(Vec8f const & x) {
    return exp_f<Vec8f, Vec8fb, 0>(x);
}

static inline Vec4f expm1(Vec4f const & x) {
    return exp_f<Vec4f, Vec4fb, 1>(x);
}

static inline Vec8f expm1(Vec8f const & x) {
    return exp_f<Vec8f, Vec8fb, 1>(x);
}

static inline Vec4f exp2(Vec4f const & x) {
    return exp_f<Vec4f, Vec4fb, 0>(x * float(VM_LN2));
}

static inline Vec8f exp2(Vec8f const & x) {
    return exp_f<Vec8f, Vec8fb, 0>(x * float(VM_LN2));
}

static inline Vec4f exp10(Vec4f const & x) {
    return exp_f<Vec4f, Vec4fb, 0>(x * float(VM_LN10));
}

static inline Vec8f exp10(Vec8f const & x) {
    return exp_f<Vec8f, Vec8fb, 0>(x * float(VM_LN10));
}


/******************************************************************************
*                 Logarithm functions
******************************************************************************/

// Helper functions: fraction_2(x) = fraction(x)*0.5

// Modified fraction function:
// Extract the fraction part of a floating point number, and divide by 2
// The fraction function is defined in vectorf128.h etc.
// fraction_2(x) = fraction(x)*0.5
// This version gives half the fraction without extra delay
static inline Vec4f fraction_2(Vec4f const & a) {
    Vec4ui t1 = _mm_castps_si128(a);   // reinterpret as 32-bit integer
    Vec4ui t2 = Vec4ui((t1 & 0x007FFFFF) | 0x3F000000); // set exponent to 0 + bias
    return _mm_castsi128_ps(t2);
}

static inline Vec8f fraction_2(Vec8f const & a) {
#if defined (VECTORI256_H) && VECTORI256_H > 2  // 256 bit integer vectors are available, AVX2
    Vec8ui t1 = _mm256_castps_si256(a);   // reinterpret as 32-bit integer
    Vec8ui t2 = (t1 & 0x007FFFFF) | 0x3F000000; // set exponent to 0 + bias
    return _mm256_castsi256_ps(t2);
#else
    return Vec8f(fraction_2(a.get_low()), fraction_2(a.get_high()));
#endif
}

static inline Vec2d fraction_2(Vec2d const & a) {
    Vec2uq t1 = _mm_castpd_si128(a);   // reinterpret as 64-bit integer
    Vec2uq t2 = Vec2uq((t1 & 0x000FFFFFFFFFFFFFll) | 0x3FE0000000000000ll); // set exponent to 0 + bias
    return _mm_castsi128_pd(t2);
}

static inline Vec4d fraction_2(Vec4d const & a) {
#if VECTORI256_H > 1  // AVX2
    Vec4uq t1 = _mm256_castpd_si256(a);   // reinterpret as 64-bit integer
    Vec4uq t2 = Vec4uq((t1 & 0x000FFFFFFFFFFFFFll) | 0x3FE0000000000000ll); // set exponent to 0 + bias
    return _mm256_castsi256_pd(t2);
#else
    return Vec4d(fraction_2(a.get_low()), fraction_2(a.get_high()));
#endif
}

// Helper functions: exponent_f(x) = exponent(x) as floating point number

union vm_udi {
    double d;
    uint64_t i;
};

// extract exponent of a positive number x as a floating point number
static inline Vec4d exponent_f(Vec4d const & x) {
    const double pow2_52 = 4503599627370496.0;   // 2^52
    const double bias = 1023.0;                  // bias in exponent
    const vm_udi upow2_52 = {pow2_52};

    Vec4uq a = reinterpret_i(x);                 // bit-cast x to integer
    Vec4uq b = a >> 52;                          // shift down exponent to low bits
    Vec4uq c = b | Vec4uq(upow2_52.i);           // insert new exponent
    Vec4d  d = reinterpret_d(c);                 // bit-cast back to double
    Vec4d  e = d - (pow2_52 + bias);             // subtract magic number and bias
    return e;
}
static inline Vec2d exponent_f(Vec2d const & x) {
    const double pow2_52 = 4503599627370496.0;   // 2^52
    const double bias = 1023.0;                  // bias in exponent
    const vm_udi upow2_52 = {pow2_52};

    Vec2uq a = reinterpret_i(x);                 // bit-cast x to integer
    Vec2uq b = a >> 52;                          // shift down exponent to low bits
    Vec2uq c = b | Vec2uq(upow2_52.i);           // insert new exponent
    Vec2d  d = reinterpret_d(c);                 // bit-cast back to double
    Vec2d  e = d - (pow2_52 + bias);             // subtract magic number and bias
    return e;
} 

// log function, double precision
// template parameters:
// VTYPE: f.p. vector type
// BTYPE: boolean vector type
// M1: 0 for log, 1 for log1p
template<class VTYPE, class BTYPE, int M1> 
static inline VTYPE log_d(VTYPE const & initial_x) {

    // define constants
    static const double ln2_hi =  0.693359375;
    static const double ln2_lo = -2.121944400546905827679E-4;
    static const double P0log  =  7.70838733755885391666E0;
    static const double P1log  =  1.79368678507819816313E1;
    static const double P2log  =  1.44989225341610930846E1;
    static const double P3log  =  4.70579119878881725854E0;
    static const double P4log  =  4.97494994976747001425E-1;
    static const double P5log  =  1.01875663804580931796E-4;
    static const double Q0log  =  2.31251620126765340583E1;
    static const double Q1log  =  7.11544750618563894466E1;
    static const double Q2log  =  8.29875266912776603211E1;
    static const double Q3log  =  4.52279145837532221105E1;
    static const double Q4log  =  1.12873587189167450590E1;

    VTYPE x1, x, x2, px, qx, res, fe;  // data vectors
    BTYPE blend, overflow, underflow;  // boolean vectors

    if (M1 == 0) {
        x1 = initial_x;                // log(x)
    }
    else {
        x1 = initial_x + 1.0;          // log(x+1)
    }
    // separate mantissa from exponent 
    // VTYPE x  = fraction(x1) * 0.5;
    x  = fraction_2(x1);

    blend = x > VM_SQRT2*0.5;
    x  = if_add(!blend, x, x);         // conditional add


    if (M1 == 0) {
        // log(x). Expand around 1.0
        x -= 1.0;
    }
    else {
        // log(x+1). Avoid loss of precision when adding 1 and later subtracting 1 if exponent = 0
        x = select(fe==0., initial_x, x - 1.0);
    }

    // rational form 
    px = polynomial_5 (x, P0log, P1log, P2log, P3log, P4log, P5log);
    x2 = x*x;
    px *= x * x2;
    qx = polynomial_5n(x, Q0log, Q1log, Q2log, Q3log, Q4log);
    res = px / qx ;

    // extract exponent
    fe = exponent_f(x1);
    fe = if_add(blend, fe, 1.);        // conditional add

    // add exponent
    res += fe * ln2_lo;
    res += x  - 0.5 * x2;
    res += fe * ln2_hi;

    overflow  = !is_finite(x1);
    underflow = x1 < VM_SMALLEST_NORMAL;   // denormals not supported by this functions

    if (!horizontal_or(overflow | underflow)) {
        // normal path
        return res;
    }
    else {
        // overflow and underflow
        res = select(underflow, nan_vec<VTYPE>(NAN_LOG), res);       // x1  < 0 gives NAN
        res = select(x1 == 0. || is_denormal(x1), -infinite_vec<VTYPE>(), res); // x1 == 0 gives -INF
        res = select(overflow,  x1, res);                     // INF or NAN goes through
        res = select(is_inf(x1)&sign_bit(x1), nan_vec<VTYPE>(NAN_LOG), res); // -INF gives NAN
        return res;
    }
}


static inline Vec2d log(Vec2d const & x) {
    return log_d<Vec2d, Vec2db, 0>(x);
}

static inline Vec4d log(Vec4d const & x) {
    return log_d<Vec4d, Vec4db, 0>(x);
}

static inline Vec2d log1p(Vec2d const & x) {
    return log_d<Vec2d, Vec2db, 1>(x);
}

static inline Vec4d log1p(Vec4d const & x) {
    return log_d<Vec4d, Vec4db, 1>(x);
}

static inline Vec2d log2(Vec2d const & x) {
    return VM_LOG2E * log_d<Vec2d, Vec2db, 0>(x);
}

static inline Vec4d log2(Vec4d const & x) {
    return VM_LOG2E * log_d<Vec4d, Vec4db, 0>(x);
}

static inline Vec2d log10(Vec2d const & x) {
    return VM_LOG10E * log_d<Vec2d, Vec2db, 0>(x);
}

static inline Vec4d log10(Vec4d const & x) {
    return VM_LOG10E * log_d<Vec4d, Vec4db, 0>(x);
}

// log function, single precision
// template parameters:
// VTYPE: f.p. vector type
// ITYPE: integer vector type with same element size
// BTYPE: boolean vector type
// M1: 0 for log, 1 for log1p
template<class VTYPE, class ITYPE, class BTYPE, int M1> 
static inline VTYPE log_f(VTYPE const & initial_x) {

    // define constants
    static const float ln2f_hi =  0.693359375f;
    static const float ln2f_lo = -2.12194440E-4f;
    static const float P0logf  =  3.3333331174E-1f;
    static const float P1logf  = -2.4999993993E-1f;
    static const float P2logf  =  2.0000714765E-1f;
    static const float P3logf  = -1.6668057665E-1f;
    static const float P4logf  =  1.4249322787E-1f;
    static const float P5logf  = -1.2420140846E-1f;
    static const float P6logf  =  1.1676998740E-1f;
    static const float P7logf  = -1.1514610310E-1f;
    static const float P8logf  =  7.0376836292E-2f;

    VTYPE x1, x, res, x2, fe;          // data vectors
    ITYPE e;                           // integer vector
    BTYPE blend, overflow, underflow;  // boolean vectors

    if (M1 == 0) {
        x1 = initial_x;                // log(x)
    }
    else {
        x1 = initial_x + 1.0f;         // log(x+1)
    }

    // separate mantissa from exponent 
    x = fraction_2(x1);

    blend = x > float(VM_SQRT2*0.5);
    x  = if_add(!blend, x, x);         // conditional add
    if (M1 == 0) {
        // log(x). Expand around 1.0
        x -= 1.0f;
    }
    else {
        // log(x+1). Avoid loss of precision when adding 1 and later subtracting 1 if exponent = 0
        x = select(BTYPE(e==0), initial_x, x - 1.0f);
    }

    // Taylor expansion
    res = polynomial_8(x, P0logf, P1logf, P2logf, P3logf, P4logf, P5logf, P6logf, P7logf, P8logf);
    x2 = x*x;
    res *= x2*x;

    // get exponent
    e    = exponent(x1);
    e    = if_add(blend,  e, 1);         // conditional add
    fe   = to_float(e);
    res += ln2f_lo  * fe;
    res += x - 0.5f * x2;
    res += ln2f_hi  * fe;

    overflow  = !is_finite(x1);
    underflow = x1 < VM_SMALLEST_NORMALF;   // denormals not supported by this functions

    if (!horizontal_or(overflow | underflow)) {
        // normal path
        return res;
    }
    else {
        // overflow and underflow
        res = select(underflow, nan_vec<VTYPE>(NAN_LOG), res);       // x1 < 0 gives NAN
        res = select(x1 == 0.f || is_denormal(x1), -infinite_vec<VTYPE>(), res); // x1 == 0 or denormal gives -INF
        res = select(overflow,  x1, res);                     // INF or NAN goes through
        res = select(is_inf(x1)&sign_bit(x1), nan_vec<VTYPE>(NAN_LOG), res); // -INF gives NAN
        return res;
    }
}

static inline Vec4f log(Vec4f const & x) {
    return log_f<Vec4f, Vec4i, Vec4fb, 0>(x);
}

static inline Vec8f log(Vec8f const & x) {
    return log_f<Vec8f, Vec8i, Vec8fb, 0>(x);
}

static inline Vec4f log1p(Vec4f const & x) {
    return log_f<Vec4f, Vec4i, Vec4fb, 1>(x);
}

static inline Vec8f log1p(Vec8f const & x) {
    return log_f<Vec8f, Vec8i, Vec8fb, 1>(x);
}

static inline Vec4f log2(Vec4f const & x) {
    return float(VM_LOG2E) * log_f<Vec4f, Vec4i, Vec4fb, 0>(x);
}

static inline Vec8f log2(Vec8f const & x) {
    return float(VM_LOG2E) * log_f<Vec8f, Vec8i, Vec8fb, 0>(x);
}

static inline Vec4f log10(Vec4f const & x) {
    return float(VM_LOG10E) * log_f<Vec4f, Vec4i, Vec4fb, 0>(x);
}

static inline Vec8f log10(Vec8f const & x) {
    return float(VM_LOG10E) * log_f<Vec8f, Vec8i, Vec8fb, 0>(x);
}


/******************************************************************************
*           Cube root and reciprocal cube root
******************************************************************************/

// cube root template, double precision
// template parameters:
// VTYPE:  f.p. vector type
// ITYPE:  uint32_t integer vector type with same total number of bits
// ITYPE2: uint64_t integer vector type with same total number of bits
// BTYPE:  boolean vector type
// CR:     -1 for reciprocal cube root, 1 for cube root, 2 for cube root squared
template<class VTYPE, class ITYPE, class ITYPE2, class BTYPE, int CR> 
static inline VTYPE cbrt_d(VTYPE const & x) {
    const int iter = 7;     // iteration count of x^(-1/3) loop
    int i;
    VTYPE  xa, xa3, a;
    ITYPE  m1, m2;
    BTYPE  underflow;
    ITYPE2 q1(0x5540000000000000ULL);  // exponent bias
    ITYPE2 q2(0x0005555500000000ULL);  // exponent multiplier for 1/3
    ITYPE2 q3(0x0010000000000000ULL);  // denormal limit

    xa = abs(x);
    xa3 = (1./3.)*xa;

    // multiply exponent by -1/3
    m1 = reinterpret_i(xa);
    m2 = ITYPE(q1) - (m1 >> 20) * ITYPE(q2);
    a  = reinterpret_d(m2);
    underflow = BTYPE(ITYPE2(m1) < q3);  // true if denormal or zero

    // Newton Raphson iteration
    for (i = 0; i < iter-1; i++) {
        a = (4./3.)*a - xa3*(a*a)*(a*a);
    }
    // last iteration with better precision
    a = a + (1./3.)*(a - xa*(a*a)*(a*a));

    if (CR == -1) {  // reciprocal cube root
        // (note: gives wrong sign when input is INF)
        // generate INF if underflow
        a = select(underflow, infinite_vec<VTYPE>(), a);
        // get sign
        a = sign_combine(a, x);
    }
    else if (CR == 1) {     // cube root
        a = a * a * x;
        // generate 0 if underflow
        a = select(underflow, 0., a);
    }
    else if (CR == 2) {     // cube root squared
        // (note: gives wrong sign when input is INF)
        a = a * xa;
        // generate 0 if underflow
        a = select(underflow, 0., a);
    }
    return a;
}

// template instances for cbrt and reciprocal_cbrt

// cube root
static inline Vec2d cbrt(Vec2d const & x) {
    return cbrt_d<Vec2d, Vec4ui, Vec2uq, Vec2db, 1> (x);
}

static inline Vec4d cbrt(Vec4d const & x) {
    return cbrt_d<Vec4d, Vec8ui, Vec4uq, Vec4db, 1> (x);
}

// reciprocal cube root
static inline Vec2d reciprocal_cbrt(Vec2d const & x) {
    return cbrt_d<Vec2d, Vec4ui, Vec2uq, Vec2db, -1> (x);
}

static inline Vec4d reciprocal_cbrt(Vec4d const & x) {
    return cbrt_d<Vec4d, Vec8ui, Vec4uq, Vec4db, -1> (x);
}

// square cube root
static inline Vec2d square_cbrt(Vec2d const & x) {
    return cbrt_d<Vec2d, Vec4ui, Vec2uq, Vec2db, 2> (x);
}

static inline Vec4d square_cbrt(Vec4d const & x) {
    return cbrt_d<Vec4d, Vec8ui, Vec4uq, Vec4db, 2> (x);
}

// cube root template, single precision
// template parameters:
// VTYPE:  f.p. vector type
// ITYPE:  uint32_t integer vector type
// BTYPE:  boolean vector type
// CR:     -1 for reciprocal cube root, 1 for cube root, 2 for cube root squared
template<class VTYPE, class ITYPE, class BTYPE, int CR> 
static inline VTYPE cbrt_f(VTYPE const & x) {

    const int iter = 6;     // iteration count of x^(-1/3) loop
    int i;
    VTYPE  xa, xa3, a;
    ITYPE  m1, m2;
    BTYPE  underflow;
    ITYPE  q1(0x54800000U);  // exponent bias
    ITYPE  q2(0x002AAAAAU);  // exponent multiplier for 1/3
    ITYPE  q3(0x00800000U);  // denormal limit

    xa = abs(x);
    xa3 = (1.f/3.f)*xa;

    // multiply exponent by -1/3
    m1 = reinterpret_i(xa);
    m2 = q1 - (m1 >> 23) * q2;
    a  = reinterpret_f(m2);

    underflow = BTYPE(m1 < q3);  // true if denormal or zero

    // Newton Raphson iteration
    for (i = 0; i < iter-1; i++) {
        a = (4.f/3.f)*a - xa3*(a*a)*(a*a);
    }
    // last iteration with better precision
    a = a + (1.f/3.f)*(a - xa*(a*a)*(a*a));

    if (CR == -1) {  // reciprocal cube root
        // generate INF if underflow
        a = select(underflow, infinite_vec<VTYPE>(), a);
        // get sign
        a = sign_combine(a, x);
    }
    else if (CR == 1) {     // cube root
        a = a * a * x;
        // generate 0 if underflow
        a = select(underflow, 0., a);
    }
    else if (CR == 2) {     // cube root squared
        a = a * xa;
        // generate 0 if underflow
        a = select(underflow, 0., a);
    }
    return a;
}

// template instances for cbrt and reciprocal_cbrt

// cube root
static inline Vec4f cbrt(Vec4f const & x) {
    return cbrt_f<Vec4f, Vec4ui, Vec4fb, 1> (x);
}

static inline Vec8f cbrt(Vec8f const & x) {
    return cbrt_f<Vec8f, Vec8ui, Vec8fb, 1> (x);
}

// reciprocal cube root
static inline Vec4f reciprocal_cbrt(Vec4f const & x) {
    return cbrt_f<Vec4f, Vec4ui, Vec4fb, -1> (x);
}

static inline Vec8f reciprocal_cbrt(Vec8f const & x) {
    return cbrt_f<Vec8f, Vec8ui, Vec8fb, -1> (x);
}

// square cube root
static inline Vec4f square_cbrt(Vec4f const & x) {
    return cbrt_f<Vec4f, Vec4ui, Vec4fb, 2> (x);
}

static inline Vec8f square_cbrt(Vec8f const & x) {
    return cbrt_f<Vec8f, Vec8ui, Vec8fb, 2> (x);
}


// *****************************************************************
//             pow template, double precision
// *****************************************************************
// Note:
// MORE PRECISE VERSION UNDERWAY!

// Template parameters:
// VTYPE:  data vector type
// UTYPE:  unsigned integer vector type
// BTYPE:  boolean vector type
// Calculate x to the power of y
template <class VTYPE, class UTYPE, class BTYPE>
static inline VTYPE pow_template_d(VTYPE const & x, VTYPE const & y) {
    VTYPE p, r, z, xp;
    BTYPE xzero, yzero;
    UTYPE m;

    z = log(x);

    // split y into integer part and fraction for the sake of precision
    r = round(y);
    m = abs(round_to_int64_limited(y));

    // calculate integer power of x
    p = 1.;  xp = x;
    while (true) {
        p = if_mul((m & 1) != 0, p, xp);
        m >>= 1u;
        if (horizontal_and(m == 0)) break;
        xp *= xp;
    } 
    // reciprocal if negative power
    if (horizontal_or(y < 0.)) {
        p = select(y < 0., 1./p, p);
    }

    z *= (y-r);
    z = exp(z);
    z *= p;
    xzero = (x == 0.);
    yzero = (y == 0.);
    if (!horizontal_or(xzero | yzero)) {
        return z;            // normal case
    }
    // special cases
    z = select(xzero, select(y > 0., 0., infinite_vec<VTYPE>()), z);  // zero allowed only for y >= 0
    z = select(yzero, 1., z);             // pow(x,0) = 1, pow(0,0) = 1 by convention
    return z;
}

// instantiations of pow_template_d:
static inline Vec2d pow(Vec2d const & x, Vec2d const & y) {
    return pow_template_d<Vec2d, Vec2uq, Vec2db>(x, y);
}

static inline Vec4d pow(Vec4d const & x, Vec4d const & y) {
    return pow_template_d<Vec4d, Vec4uq, Vec4db>(x, y);
}


// *************************************************************
//             pow template, single precision
// *************************************************************
// Note:
// MORE PRECISE VERSION UNDERWAY!

// Template parameters:
// VTYPE:  data vector type
// UTYPE:  unsigned integer vector type
// BTYPE:  boolean vector type
// Calculate x to the power of y
template <class VTYPE, class UTYPE, class BTYPE>
static inline VTYPE pow_template_f(VTYPE const & x, VTYPE const & y) {
    VTYPE p, r, z, xp;
    BTYPE xzero, yzero;
    UTYPE m;

    z = log(x);

    // split y into integer part and fraction for the sake of precision
    r = round(y);
    m = abs(round_to_int(y));
    // calculate integer power of x
    p = 1.f;  xp = x;
    while (true) {
        //p = select((m & 1) != 0, p * xp, p);
        p = if_mul((m & 1) != 0, p, xp);
        m >>= 1u;
        if (horizontal_and(m == 0)) break;
        xp *= xp;
    }

    // reciprocal if negative power
    if (horizontal_or(y < 0.)) {
        p = select(y < 0.f, 1.f/p, p);
    }
    z *= (y-r);
    z = exp(z);
    z *= p;
    xzero = (x == 0.f);
    yzero = (y == 0.f);
    if (!horizontal_or(xzero | yzero)) {
        return z;            // normal case
    }
    // special cases
    z = select(xzero, select(y > 0.f, 0.f, infinite_vec<VTYPE>()), z);  // zero allowed only for y >= 0
    z = select(yzero, 1.f, z);             // pow(x,0) = 1, pow(0,0) = 1 by convention
    return z;
}

static inline Vec4f pow(Vec4f const & x, Vec4f const & y) {
    return pow_template_f<Vec4f, Vec4ui, Vec4fb>(x, y);
}

static inline Vec8f pow(Vec8f const & x, Vec8f const & y) {
    return pow_template_f<Vec8f, Vec8ui,  Vec8fb>(x, y);
}


// some compilers don't have round function. Define it
static inline double round_sd(double x) {
#if !defined(_MSC_VER) || _MSC_VER >= 1800
    return round(x);
#else 
    Vec2d y = round(Vec2d(x));
    return y[0];
#endif
}
static inline float round_sf(float x) {
#if !defined(_MSC_VER) || _MSC_VER >= 1800
    return roundf(x);
#else 
    Vec4f y = round(Vec4f(x));
    return y[0];
#endif
}

// *************************************************************
//             pow template, double precision, scalar y
// *************************************************************
// Template parameters:
// VTYPE:  data vector type
// BTYPE:  boolean vector type
// Calculate x to the power of y
template <class VTYPE, class BTYPE>
static inline VTYPE pow_template_sd(VTYPE const & x, double y) {
    VTYPE p, z;
    BTYPE xzero;
    double r;

    if (y == 0.) return VTYPE(1.);

    z = log(x);

    // split y into integer part and fraction for the sake of precision
    r = round_sd(y);

    // calculate integer power of x
    p = pow(x,(int)r);

    // combine with fraction power
    z *= (y-r);
    z = exp(z);
    z *= p;

    xzero = (x == 0.);
    if (!horizontal_or(xzero)) {
        return z;            // normal case
    }
    // special cases
    if (y > 0.) {    
        z = select(xzero, 0., z);  // zero allowed only for y >= 0
    }
    return z;
}

static inline Vec2d pow(Vec2d const & x, double y) {
    return pow_template_sd<Vec2d, Vec2db>(x, y);
}

static inline Vec4d pow(Vec4d const & x, double y) {
    return pow_template_sd<Vec4d, Vec4db>(x, y);
}


// *************************************************************
//             pow template, single precision, scalar y
// *************************************************************
// Template parameters:
// VTYPE:  data vector type
// BTYPE:  boolean vector type
// Calculate x to the power of y
template <class VTYPE, class BTYPE>
static inline VTYPE pow_template_sf(VTYPE const & x, float y) {
    VTYPE p, z;
    BTYPE xzero;
    float r;

    if (y == 0.f) return 1.f;

    z = log(x);

    // split y into integer part and fraction for the sake of precision
    r = round_sf(y);

    // calculate integer power of x
    p = pow(x,(int)r);

    // combine with fraction power
    z *= (y-r);
    z = exp(z);
    z *= p;

    xzero = (x == 0.f);
    if (!horizontal_or(xzero)) {
        return z;            // normal case
    }
    // special cases
    if (y > 0.f) {    
        z = select(xzero, 0.f, z);  // zero allowed only for y >= 0
    }
    return z;
}

static inline Vec4f pow(Vec4f const & x, float y) {
    return pow_template_sf<Vec4f, Vec4fb>(x, y);
}

static inline Vec8f pow(Vec8f const & x, float y) {
    return pow_template_sf<Vec8f, Vec8fb>(x, y);
}


// *************************************************************
//             power function with rational exponent
// *************************************************************
// Power function with rational exponent: x^(a/b)
// Template must be defined as class to allow partial template specialization
template <int a, int b>
class Power_rational {
public:
    // overloaded member function for each vector type
    Vec4f pow(Vec4f const & x) {
        Vec4f y = x;
        // negative x allowed when b odd or a even
        // (if a is even then either b is odd or a/b can be reduced, 
        // but we can check a even anyway at no cost to be sure)
        if (a == 0) return 1.f;
        if ((b | ~a) & 1) y = abs(y);
        y = log(y);
        y *= float(a)/float(b);
        y = exp(y);
        if (a & b & 1) y = sign_combine(y, x);          // apply sign if a and b both odd
        if ((a ^ b) >= 0) y = select(x == 0.f, 0.f, y); // zero allowed for positive a and b
        return y;
    }
    Vec8f pow(Vec8f const & x) {
        Vec8f y = x;
        if (a == 0) return 1.f;
        if ((b | ~a) & 1) y = abs(y);
        y = log(y);
        y *= float(a)/float(b);
        y = exp(y);
        if (a & b & 1) y = sign_combine(y, x);
        if ((a ^ b) >= 0) y = select(x == 0.f, 0.f, y);
        return y;
    }
    Vec2d pow(Vec2d const & x) {
        Vec2d y = x;
        if (a == 0) return 1.;
        if ((b | ~a) & 1) y = abs(y);
        y = log(y);
        y *= double(a)/double(b);
        y = exp(y);
        if (a & b & 1) y = sign_combine(y, x);
        if ((a ^ b) >= 0) y = select(x == 0., 0., y);
        return y;
    }
    Vec4d pow(Vec4d const & x) {
        Vec4d y = x;
        if (a == 0) return 1.;
        if ((b | ~a) & 1) y = abs(y);
        y = log(y);
        y *= double(a)/double(b);
        y = exp(y);
        if (a & b & 1) y = sign_combine(y, x);
        if ((a ^ b) >= 0) y = select(x == 0., 0., y);
        return y;
    }
};

// partial specialization for b = 0
template<int a>
class Power_rational<a,0> {
public:
    template<class VTYPE>
    VTYPE pow(VTYPE x) {return nan_vec<VTYPE>(NAN_LOG);}
};

// partial specialization for b = 1
template<int a>
class Power_rational<a,1> {
public:
    template<class VTYPE>
    VTYPE pow(VTYPE x) {return pow_n<a>(x);}
};

// partial specialization for b = 2
template<int a>
class Power_rational<a,2> {
public:
    template<class VTYPE>
    VTYPE pow(VTYPE x) {
        VTYPE y = pow_n<(a > 0 ? a/2 : (a-1)/2)>(x);
        if (a & 1) y *= sqrt(x);
        return y;
    }
};

// full specialization for a = 1, b = 2
template<>
class Power_rational<1,2> {
public:
    template<class VTYPE>
    VTYPE pow(VTYPE x) {        
        return sqrt(x);
    }
};

// full specialization for a = -1, b = 2
template<>
class Power_rational<-1,2> {
public:
    template<class VTYPE>
    VTYPE pow(VTYPE x) {        
        // (this is faster than iteration method on modern CPUs)
        return VTYPE(1.f) / sqrt(x);
    }
};

// partial specialization for b = 3
template<int a>
class Power_rational<a,3> {
public:
    template<class VTYPE>
    VTYPE pow(VTYPE x) {
        VTYPE t;
        switch (a % 3) {
        case -2:
            t = reciprocal_cbrt(x);
            t *= t;
            if (a == -2) return t;
            t = t / pow_n<(-a-2)/3>(x);
            break;
        case -1:
            t = reciprocal_cbrt(x);
            if (a == -1) return t;
            t = t / pow_n<(-a-1)/3>(x);
            break;
        case  0:
            t = pow_n<a/3>(x);
            break;
        case  1:
            t = cbrt(x);
            if (a == 1) return t;
            t = t * pow_n<a/3>(x);
            break;
        case  2:
            t = square_cbrt(x);
            if (a == 2) return t;
            t = t * pow_n<a/3>(x);
            break;
        }
        return t;
    }
};

// partial specialization for b = 4
template<int a>
class Power_rational<a,4> {
public:
    template<class VTYPE>
    VTYPE pow(VTYPE x) {
        VTYPE t, s1, s2;
        s1 = sqrt(x);
        if (a & 1) s2 = sqrt(s1);
        switch (a % 4) {
        case -3:
            t = s2 / pow_n<1+(-a)/4>(x);
            break;
        case -2:
            t = s1 / pow_n<1+(-a)/4>(x);
            break;
        case -1:
            if (a != -1) s2 *= pow_n<(-a)/4>(x);
            t = VTYPE(1.f) / s2;
            break;
        case  0: default:
            t = pow_n<a/4>(x);
            break;
        case  1:
            t = s2;
            if (a != 1) t *= pow_n<a/4>(x);
            break;
        case  2:
            t = s1;
            if (a != 2) t *= pow_n<a/4>(x);
            break;
        case  3:
            t = s1 * s2;
            if (a != 3) t *= pow_n<a/4>(x);
            break;
        }
        return t;
    }
};

// partial specialization for b = 6
template<int a>
class Power_rational<a,6> {
public:
    template<class VTYPE>
    VTYPE pow(VTYPE x) {
        VTYPE t, s1, s2, s3;
        switch (a % 6) {
        case -5:
            t = reciprocal_cbrt(x);
            t = t * t * sqrt(t);
            if (a != -5) t /= pow_n<(-a)/6>(x);
            break;
        case -4:
            t = reciprocal_cbrt(x);
            t *= t;
            if (a != -4) t /= pow_n<(-a)/6>(x);
            break;
        case -3:
            t = pow_n<a/6>(x);
            t /= sqrt(x);
            break;
        case -2:
            t = reciprocal_cbrt(x);
            if (a != -2) t /= pow_n<(-a)/6>(x);
            break;
        case -1:
            t = sqrt(reciprocal_cbrt(x));
            if (a != -1) t /= pow_n<(-a)/6>(x);
            break;
        case  0: default:
            t = pow_n<a/6>(x);
            break;
        case  1:
            t = sqrt(cbrt(x));
            if (a != 1) t *= pow_n<a/6>(x);
            break;
        case  2:
            t = cbrt(x);
            if (a != 2) t *= pow_n<a/6>(x);
            break;
        case  3:
            t = sqrt(x);
            if (a != 3) t *= pow_n<a/6>(x);
            break;
        case  4:
            t = square_cbrt(x);
            if (a != 4) t *= pow_n<a/6>(x);
            break;
        case  5:
            t = cbrt(x);
            t = t * t * sqrt(t);
            if (a != 5) t *= pow_n<a/6>(x);
            break;
        }
        return t;
    }
};

// partial specialization for b = 8
template<int a>
class Power_rational<a,8> {
public:
    template<class VTYPE>
    VTYPE pow(VTYPE x) {
        VTYPE t, s1, s2, s3;
        s1 = sqrt(x);               // x^(1/2)
        if (a & 3) s2 = sqrt(s1);   // x^(1/4)
        if (a & 1) s3 = sqrt(s2);   // x^(1/8)
        switch (a % 8) {
        case -7:
            t = s3 / pow_n<1+(-a)/8>(x);
            break;
        case -6:
            t = s2 / pow_n<1+(-a)/8>(x);
            break;
        case -5:
            t = s3 * (s2 / pow_n<1+(-a)/8>(x));
            break;
        case -4:
            t = s1 / pow_n<1+(-a)/8>(x);
            break;
        case -3:
            t = s3 * (s1 / pow_n<1+(-a)/8>(x));
            break;
        case -2:
            if (a != -2) s2 *= pow_n<(-a)/8>(x);
            t = VTYPE(1.f) / s2;
            break;
        case -1:
            if (a != -1) s3 *= pow_n<(-a)/8>(x);
            t = VTYPE(1.f) / s3;
            break;
        case  0: default:
            t = pow_n<a/8>(x);
            break;
        case  1:
            t = s3;
            if (a != 1) t *= pow_n<a/8>(x);
            break;
        case  2:
            t = s2;
            if (a != 2) t *= pow_n<a/8>(x);
            break;
        case  3:
            t = s2 * s3;
            if (a != 3) t *= pow_n<a/8>(x);
            break;
        case  4:
            t = s1;
            if (a != 4) t *= pow_n<a/8>(x);
            break;
        case  5:
            t = s1 * s3;
            if (a != 5) t *= pow_n<a/8>(x);
            break;
        case  6:
            t = s1 * s2;
            if (a != 6) t *= pow_n<a/8>(x);
            break;
        case  7:
            t = s2 * s3;
            if (a != 7) s1 *= pow_n<a/8>(x);
            t *= s1;
            break;

        }
        return t;
    }
};

// macro to call template class member function pow
#define pow_ratio(x, a, b) (Power_rational<(b)<0 ? -(a):(a), (b)<0 ? -(b):(b)> ().pow(x))

#endif
