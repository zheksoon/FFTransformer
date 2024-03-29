/****************************  vectormath_trig.h   ******************************
* Author:        Agner Fog
* Date created:  2014-04-18
* Last modified: 2014-04-22
* Version:       1.12
* Project:       vector classes
* Description:
* Header file containing inline version of trigonometric functions 
* and inverse trigonometric functions
* sin, cos, sincos, tan
* asin, acos, atan, atan2
*
* For detailed instructions, see vectormath_common.h and VectorClass.pdf
*
* (c) Copyright 2014 GNU General Public License http://www.gnu.org/licenses
******************************************************************************/

#ifndef VECTORMATH_TRIG_H
#define VECTORMATH_TRIG_H  1

#include "vectormath_common.h"

// Different overloaded functions for template resolution.
// These are used to fix the problem that the quadrant index uses
// a vector of 32-bit integers which doesn't fit the size of the
// 64-bit double precision vector:
// VTYPE | ITYPE | ITYPEH
// -----------------------
// Vec2d | Vec2q | Vec4i
// Vec4d | Vec4q | Vec4i
// Vec8d | Vec8q | Vec8i

// define overloaded truncate functions
static inline Vec4i vm_truncate_low_to_int(Vec2d const & x) {
    return truncate_to_int(x,x);
}

static inline Vec4i vm_truncate_low_to_int(Vec4d const & x) {
    return truncate_to_int(x);
}

// define int -> double conversions
template<class VTYPE>
static inline VTYPE vm_half_int_vector_to_double(Vec4i const & x);

template<>
inline Vec2d vm_half_int_vector_to_double<Vec2d>(Vec4i const & x) {
    return to_double_low(x);
}

template<>
inline Vec4d vm_half_int_vector_to_double<Vec4d>(Vec4i const & x) {
    return to_double(x);
}

// define int32_t to int64_t conversions
template<class ITYPE, class ITYPEH>
static inline ITYPE vm_half_int_vector_to_full(ITYPEH const & x);

template<>
inline Vec2q vm_half_int_vector_to_full<Vec2q,Vec4i>(Vec4i const & x) {
    return extend_low(x);
}

template<>
inline Vec4q vm_half_int_vector_to_full<Vec4q,Vec4i>(Vec4i const & x) {
    return extend_low(Vec8i(x,x));
}


// *************************************************************
//             sincos template, double precision
// *************************************************************
// Template parameters:
// VTYPE:  f.p. vector type
// ITYPE:  integer vector type with same element size
// ITYPEH: integer vector type with half the element size
// BTYPE:  boolean vector type
// SC:     1 = sin, 2 = cos, 3 = sincos
// Paramterers:
// xx = input x (radians)
// cosret = return pointer (only if SC = 3)
template<class VTYPE, class ITYPE, class ITYPEH, class BTYPE, int SC> 
static inline VTYPE sincos_d(VTYPE * cosret, VTYPE const & xx) {

    // define constants
    static const double ONEOPIO4 = 4./VM_PI;

    static const double DP1sc = 7.85398125648498535156E-1;
    static const double DP2sc = 3.77489470793079817668E-8;
    static const double DP3sc = 2.69515142907905952645E-15;

    static const double P0sin =-1.66666666666666307295E-1;
    static const double P1sin = 8.33333333332211858878E-3;
    static const double P2sin =-1.98412698295895385996E-4;
    static const double P3sin = 2.75573136213857245213E-6;
    static const double P4sin =-2.50507477628578072866E-8;
    static const double P5sin = 1.58962301576546568060E-10;

    static const double P0cos = 4.16666666666665929218E-2;
    static const double P1cos =-1.38888888888730564116E-3;
    static const double P2cos = 2.48015872888517045348E-5;
    static const double P3cos =-2.75573141792967388112E-7;
    static const double P4cos = 2.08757008419747316778E-9;
    static const double P5cos =-1.13585365213876817300E-11;

    static const double DP1 = 7.853981554508209228515625E-1;
    static const double DP2 = 7.94662735614792836714E-9;
    static const double DP3 = 3.06161699786838294307E-17;

    VTYPE xa, x, y, x2, s, c, sin1, cos1;  // data vectors
    ITYPEH q;                              // integer vectors, 32 bit
    ITYPE qq, signsin, signcos;            // integer vectors, 64 bit
    BTYPE swap, overflow;                  // boolean vectors

    xa = abs(xx);

    // Find quadrant
    //      0 -   pi/4 => 0
    //   pi/4 - 3*pi/4 => 2
    // 3*pi/4 - 5*pi/4 => 4
    // 5*pi/4 - 7*pi/4 => 6
    // 7*pi/4 - 8*pi/4 => 8

    // truncate to integer (magic number conversion is not faster here)
    q = vm_truncate_low_to_int(xa * ONEOPIO4);
    q = (q + 1) & ~1;

    y = vm_half_int_vector_to_double<VTYPE>(q);  // quadrant, as double

    // Reduce by extended precision modular arithmetic
    x = ((xa - y * DP1) - y * DP2) - y * DP3;

    // Expansion of sin and cos, valid for -pi/4 <= x <= pi/4
    x2 = x * x;
    s = polynomial_5(x2, P0sin, P1sin, P2sin, P3sin, P4sin, P5sin);
    c = polynomial_5(x2, P0cos, P1cos, P2cos, P3cos, P4cos, P5cos);
    s = x   + (x * x2) * s;
    c = 1.0 - x2 * 0.5 + (x2 * x2) * c;

    // correct for quadrant
    qq = vm_half_int_vector_to_full<ITYPE,ITYPEH>(q);
    swap = (qq & 2) != 0;

    // check for overflow
    if (horizontal_or(q < 0)) {
        overflow = (y < 0) & is_finite(xa);
        s = select(overflow, 0., s);
        c = select(overflow, 1., c);
    }

    if (SC & 1) {  // calculate sin
        sin1 = select(swap, c, s);
        signsin = ((qq << 61) ^ reinterpret_i(xx)) & (1ULL << 63);
        sin1 ^= reinterpret_d(signsin);
    }
    if (SC & 2) {  // calculate cos
        cos1 = select(swap, s, c);
        signcos = ((qq + 2) << 61) & (1ULL << 63);
        cos1 ^= reinterpret_d(signcos);
    }
    if (SC == 3) {  // calculate both. cos returned through pointer
        *cosret = cos1;
    }
    if (SC & 1) return sin1; else return cos1;
}

// instantiations of sincos_d template:

static inline Vec2d sin(Vec2d const & x) {
    return sincos_d<Vec2d, Vec2q, Vec4i, Vec2db, 1>(0, x);
}

static inline Vec2d cos(Vec2d const & x) {
    return sincos_d<Vec2d, Vec2q, Vec4i, Vec2db, 2>(0, x);
}

static inline Vec2d sincos(Vec2d * cosret, Vec2d const & x) {
    return sincos_d<Vec2d, Vec2q, Vec4i, Vec2db, 3>(cosret, x);
}

static inline Vec4d sin(Vec4d const & x) {
    return sincos_d<Vec4d, Vec4q, Vec4i, Vec4db, 1>(0, x);
}

static inline Vec4d cos(Vec4d const & x) {
    return sincos_d<Vec4d, Vec4q, Vec4i, Vec4db, 2>(0, x);
}

static inline Vec4d sincos(Vec4d * cosret, Vec4d const & x) {
    return sincos_d<Vec4d, Vec4q, Vec4i, Vec4db, 3>(cosret, x);
}


// *************************************************************
//             sincos template, single precision
// *************************************************************
// Template parameters:
// VTYPE:  f.p. vector type
// ITYPE:  integer vector type with same element size
// BTYPE:  boolean vector type
// SC:     1 = sin, 2 = cos, 3 = sincos, 4 = tan
// Paramterers:
// xx = input x (radians)
// cosret = return pointer (only if SC = 3)
template<class VTYPE, class ITYPE, class BTYPE, int SC> 
static inline VTYPE sincos_f(VTYPE * cosret, VTYPE const & xx) {

    // define constants
    static const float ONEOPIO4f = (float)(4./VM_PI);

    static const float DP1F = 0.78515625f;
    static const float DP2F = 2.4187564849853515625E-4f;
    static const float DP3F = 3.77489497744594108E-8f; 

    static const float P0sinf = -1.6666654611E-1f;
    static const float P1sinf =  8.3321608736E-3f;
    static const float P2sinf = -1.9515295891E-4f;

    static const float P0cosf =  4.166664568298827E-2f;
    static const float P1cosf = -1.388731625493765E-3f;
    static const float P2cosf =  2.443315711809948E-5f;

    VTYPE xa, x, y, x2, s, c, sin1, cos1;  // data vectors
    ITYPE q, signsin, signcos;             // integer vectors
    BTYPE swap, overflow;                  // boolean vectors

    xa = abs(xx);

    // Find quadrant
    //      0 -   pi/4 => 0
    //   pi/4 - 3*pi/4 => 2
    // 3*pi/4 - 5*pi/4 => 4
    // 5*pi/4 - 7*pi/4 => 6
    // 7*pi/4 - 8*pi/4 => 8
    q = truncate_to_int(xa * ONEOPIO4f);
    q = (q + 1) & ~1;

    y = to_float(q);  // quadrant, as float

    x = ((xa - y * DP1F) - y * DP2F) - y * DP3F;

    // A two-step reduction saves time at the cost of precision for very big x:
    //x = (xa - y * DP1F) - y * (DP2F+DP3F);

    // Taylor expansion of sin and cos, valid for -pi/4 <= x <= pi/4
    x2 = x * x;
    s = polynomial_2(x2, P0sinf, P1sinf, P2sinf) * (x*x2)  + x;
    c = polynomial_2(x2, P0cosf, P1cosf, P2cosf) * (x2*x2) + (1.0f - 0.5f*x2);

    // correct for quadrant
    swap = (q & 2) != 0;

    // check for overflow
    overflow = BTYPE(q < 0);  // q = 0x80000000 if overflow
    if (horizontal_or(overflow & is_finite(xa))) {
        s = select(overflow, 0.f, s);
        c = select(overflow, 1.f, c);
    }

    if (SC & 5) {  // calculate sin
        sin1 = select(swap, c, s);
        signsin = ((q << 29) ^ reinterpret_i(xx)) & (1 << 31);
        sin1 ^= reinterpret_f(signsin);
    }
    if (SC & 6) {  // calculate cos
        cos1 = select(swap, s, c);
        signcos = ((q + 2) << 29) & (1 << 31);
        cos1 ^= reinterpret_f(signcos);
    }
    if      (SC == 1) return sin1;
    else if (SC == 2) return cos1;
    else if (SC == 3) {  // calculate both. cos returned through pointer
        *cosret = cos1;
        return sin1;
    }
    else if (SC == 4) return sin1 / cos1;
}

// instantiations of sincos_f template:

static inline Vec4f sin(Vec4f const & x) {
    return sincos_f<Vec4f, Vec4i, Vec4fb, 1>(0, x);
}

static inline Vec4f cos(Vec4f const & x) {
    return sincos_f<Vec4f, Vec4i, Vec4fb, 2>(0, x);
}

static inline Vec4f sincos(Vec4f * cosret, Vec4f const & x) {
    return sincos_f<Vec4f, Vec4i, Vec4fb, 3>(cosret, x);
}

static inline Vec4f tan(Vec4f const & x) {
    return sincos_f<Vec4f, Vec4i, Vec4fb, 4>(0, x);
}

static inline Vec8f sin(Vec8f const & x) {
    return sincos_f<Vec8f, Vec8i, Vec8fb, 1>(0, x);
}

static inline Vec8f cos(Vec8f const & x) {
    return sincos_f<Vec8f, Vec8i, Vec8fb, 2>(0, x);
}

static inline Vec8f sincos(Vec8f * cosret, Vec8f const & x) {
    return sincos_f<Vec8f, Vec8i, Vec8fb, 3>(cosret, x);
}

static inline Vec8f tan(Vec8f const & x) {
    return sincos_f<Vec8f, Vec8i, Vec8fb, 4>(0, x);
}

// *************************************************************
//             tan template, double precision
// *************************************************************
// Template parameters:
// VTYPE:  f.p. vector type
// ITYPE:  integer vector type with same element size
// ITYPEH: integer vector type with half the element size
// BTYPE:  boolean vector type
// Paramterers:
// x = input x (radians)
template<class VTYPE, class ITYPE, class ITYPEH, class BTYPE> 
static inline VTYPE tan_d(VTYPE const & x) {

    // define constants
    static const double ONEOPIO4 = 4./VM_PI;

    static const double DP1 = 7.853981554508209228515625E-1;
    static const double DP2 = 7.94662735614792836714E-9;
    static const double DP3 = 3.06161699786838294307E-17;

    static const double P2tan=-1.30936939181383777646E4;
    static const double P1tan=1.15351664838587416140E6;
    static const double P0tan=-1.79565251976484877988E7;

    static const double Q3tan = 1.36812963470692954678E4;
    static const double Q2tan = -1.32089234440210967447E6;
    static const double Q1tan = 2.50083801823357915839E7;
    static const double Q0tan = -5.38695755929454629881E7;

    VTYPE xa, y, z, zz, px, qx, tn, recip;  // data vectors
    ITYPEH q;                               // integer vector, 32 bit
    ITYPE qq;                               // integer vector, 64 bit
    BTYPE doinvert, xzero, overflow;        // boolean vectors

    xa = abs(x);

    // Find quadrant
    //      0 -   pi/4 => 0
    //   pi/4 - 3*pi/4 => 2
    // 3*pi/4 - 5*pi/4 => 4
    // 5*pi/4 - 7*pi/4 => 6
    // 7*pi/4 - 8*pi/4 => 8

    q = vm_truncate_low_to_int(xa * ONEOPIO4);
    q = (q + 1) & ~1;

    y = vm_half_int_vector_to_double<VTYPE>(q);  // quadrant, as double

    // Reduce by extended precision modular arithmetic
    z = ((xa - y * DP1) - y * DP2) - y * DP3;

    // Pade expansion of tan, valid for -pi/4 <= x <= pi/4
    zz = z * z;
    px = polynomial_2 (zz, P0tan, P1tan, P2tan);
    qx = polynomial_4n(zz, Q0tan, Q1tan, Q2tan, Q3tan);

    tn = z + z * zz * px / qx;  // qx cannot be 0 for x <= pi/4

    // if (q&2) tn = -1/tn
    qq = vm_half_int_vector_to_full<ITYPE,ITYPEH>(q);
    doinvert = (qq & 2) != 0;
    xzero = (xa == 0.);
    // avoid division by 0. We will not be using recip anyway if xa == 0.
    // tn never becomes exactly 0 when x = pi/2 so we only have to make 
    // a special case for x == 0.
    recip = (-1.) / select(xzero, VTYPE(-1.), tn);
    tn = select(doinvert, recip, tn);
    tn = sign_combine(tn, x);       // get original sign

    // check for overflow
    if (horizontal_or(q < 0)) {
        overflow = (y < 0) & is_finite(xa);
        tn = select(overflow, 0., tn);
    }

    return tn;
}

// instantiations of tan_d template:

static inline Vec2d tan(Vec2d const & x) {
    return tan_d<Vec2d, Vec2q, Vec4i, Vec2db>(x);
}

static inline Vec4d tan(Vec4d const & x) { 
    return tan_d<Vec4d, Vec4q, Vec4i, Vec4db>(x);
}

/*
This is removed for the single precision version. 
It is faster to use tan(x) = sin(x)/cos(x)

// *************************************************************
//             tan template, single precision
// *************************************************************
// Template parameters:
// VTYPE:  f.p. vector type
// ITYPE:  integer vector type with same element size
// BTYPE:  boolean vector type
// Paramterers:
// x = input x (radians)
// cosret = return pointer (only if SC = 3)
template<class VTYPE, class ITYPE, class BTYPE> 
static inline VTYPE tan_f(VTYPE const & x) {

    // define constants
    static const float ONEOPIO4f = (float)(4./VM_PI);

    static const float DP1F = 0.78515625f;
    static const float DP2F = 2.4187564849853515625E-4f;
    static const float DP3F = 3.77489497744594108E-8f;

    static const float P5tanf = 9.38540185543E-3f;
    static const float P4tanf = 3.11992232697E-3f;
    static const float P3tanf = 2.44301354525E-2f;
    static const float P2tanf = 5.34112807005E-2f;
    static const float P1tanf = 1.33387994085E-1f;
    static const float P0tanf = 3.33331568548E-1f;

    VTYPE xa, y, z, zz, tn, recip;   // data vectors
    ITYPE q;                         // integer vector
    BTYPE doinvert, xzero;           // boolean vectors

    xa = abs(x);

    // Find quadrant
    //      0 -   pi/4 => 0
    //   pi/4 - 3*pi/4 => 2
    // 3*pi/4 - 5*pi/4 => 4
    // 5*pi/4 - 7*pi/4 => 6
    // 7*pi/4 - 8*pi/4 => 8
    q = truncate_to_int(xa * ONEOPIO4f);
    q = (q + 1) & ~1;

    y = to_float(q);             // quadrant, as float

    // Reduce by extended precision modular arithmetic
    z = ((xa - y * DP1F) - y * DP2F) - y * DP3F;
    //z = (xa - y * DP1F) - y * (DP2F + DP3F);
    zz = z * z;

    // Taylor expansion
    tn = polynomial_5(zz, P0tanf, P1tanf, P2tanf, P3tanf, P4tanf, P5tanf) * (zz * z) + z;

    // if (q&2) tn = -1/tn
    doinvert = (q & 2) != 0;
    xzero = (xa == 0.f);
    // avoid division by 0. We will not be using recip anyway if xa == 0.
    // tn never becomes exactly 0 when x = pi/2 so we only have to make 
    // a special case for x == 0.
    recip = (-1.f) / select(xzero, VTYPE(-1.f), tn);
    tn = select(doinvert, recip, tn);
    tn = sign_combine(tn, x);          // get original sign

    return tn;
}

// instantiations of tan_f template:

static inline Vec4f tan(Vec4f const & x) {
    return tan_f<Vec4f, Vec4i, Vec4fb>(x);
} 

static inline Vec8f tan(Vec8f const & x) {
    return tan_f<Vec8f, Vec8i, Vec8fb>(x);
}
*/

// *************************************************************
//             asin/acos template, double precision
// *************************************************************
// Template parameters:
// VTYPE:  f.p. vector type
// BTYPE:  boolean vector type
// AC: 0 = asin, 1 = acos
// Paramterers:
// x = input x
template<class VTYPE, class BTYPE, int AC> 
static inline VTYPE asin_d(VTYPE const & x) {

    // define constants
    static const double R4asin =  2.967721961301243206100E-3;
    static const double R3asin = -5.634242780008963776856E-1;
    static const double R2asin =  6.968710824104713396794E0;
    static const double R1asin = -2.556901049652824852289E1;
    static const double R0asin =  2.853665548261061424989E1;

    static const double S3asin = -2.194779531642920639778E1;
    static const double S2asin =  1.470656354026814941758E2;
    static const double S1asin = -3.838770957603691357202E2;
    static const double S0asin =  3.424398657913078477438E2;

    static const double P5asin =  4.253011369004428248960E-3;
    static const double P4asin = -6.019598008014123785661E-1;
    static const double P3asin =  5.444622390564711410273E0;
    static const double P2asin = -1.626247967210700244449E1;
    static const double P1asin =  1.956261983317594739197E1;
    static const double P0asin = -8.198089802484824371615E0;

    static const double Q4asin = -1.474091372988853791896E1;
    static const double Q3asin =  7.049610280856842141659E1;
    static const double Q2asin = -1.471791292232726029859E2;
    static const double Q1asin =  1.395105614657485689735E2;
    static const double Q0asin = -4.918853881490881290097E1;

    static const double MOREBITS = 6.123233995736765886130E-17;

    VTYPE xa, xb, x1, x2, x3, x4, x5, px, qx, rx, sx, vx, wx, y1, y3, yb, z, z1, z2;
    BTYPE big;
    bool dobig, dosmall;

    xa  = abs(x);
    big = xa >= 0.625;

    /*
    Small: xa < 0.625
    ------------------
    x = xa * xa;
    px = PX(x);
    qx = QX(x);
    y1 = x*px/qx;    
    y1 = xa * y1 + xa;

    Big: xa >= 0.625
    ------------------
    x = 1.0 - xa;
    rx = RX(x);
    sx = SX(x);
    y1 = x * rx/sx;
    x3 = sqrt(x+x);
    y3 = x3 * y1 - MOREBITS;
    z = pi/2 - x3 - y3
    */

    // select a common x for all polynomials
    // This allows sharing of powers of x through common subexpression elimination
    x1 = select(big, 1.0 - xa, xa * xa); 

    // calculate powers of x1 outside branches to make sure they are only calculated once
    x2 = x1 * x1;
    x4 = x2 * x2;
    x5 = x4 * x1;
    x3 = x2 * x1;

    dosmall = !horizontal_and(big);   // at least one element is small
    dobig   =  horizontal_or(big) ;   // at least one element is big

    // calculate polynomials
    if (dosmall) {
        px = (x4*P4asin+x3*P3asin) + (x2*P2asin+x1*P1asin+P0asin) + x5*P5asin;
        qx = (x4*Q4asin+x3*Q3asin) + (x2*Q2asin+x1*Q1asin+Q0asin) + x5;
        // px = polynomial_5 (x1, P0asin, P1asin, P2asin, P3asin, P4asin, P5asin);
        // qx = polynomial_5n(x1, Q0asin, Q1asin, Q2asin, Q3asin, Q4asin);
    }
    if (dobig) {
        rx = (x3*R3asin + x4*R4asin) + x2*R2asin + (x1*R1asin + R0asin);
        sx = (x3*S3asin + x4) + x2*S2asin + (x1*S1asin + S0asin);
        // rx = polynomial_4 (x1, R0asin, R1asin, R2asin, R3asin, R4asin);
        // sx = polynomial_4n(x1, S0asin, S1asin, S2asin, S3asin);
    }

    // select and divide outside branches to avoid dividing twice
    vx = select(big, rx, px);
    wx = select(big, sx, qx);
    y1 = vx/wx * x1;

    // results for big
    if (dobig) {                    // avoid square root if all are small
        xb = sqrt(x1+x1);           // this produces NAN if xa > 1 so we don't need a special case for xa > 1
        yb = xb * y1 ;
        //if (!AC) y3 -= MOREBITS;  // why? This gives marginally better results for asin, but worse for acos
        z1 = xb + yb;
    }

    // results for small        
    z2 = xa * y1 + xa;

    // correct for sign
    if (AC) {  // acos
        z1 = select(x < 0., VM_PI - z1, z1);
        z2 = VM_PI_2 - sign_combine(z2, x);
        z = select(big, z1, z2);
    }
    else {     // asin
        z1 = VM_PI_2 - z1;
        z = select(big, z1, z2);
        z = sign_combine(z, x);
    }
    return z;
}

// instantiations of asin_d template:

static inline Vec2d asin(Vec2d const & x) {
    return asin_d<Vec2d, Vec2db, 0>(x);
}

static inline Vec4d asin(Vec4d const & x) { 
    return asin_d<Vec4d, Vec4db, 0>(x);
}

static inline Vec2d acos(Vec2d const & x) {
    return asin_d<Vec2d, Vec2db, 1>(x);
}

static inline Vec4d acos(Vec4d const & x) { 
    return asin_d<Vec4d, Vec4db, 1>(x);
}


// *************************************************************
//             asin/acos template, single precision
// *************************************************************
// Template parameters:
// VTYPE:  f.p. vector type
// BTYPE:  boolean vector type
// AC: 0 = asin, 1 = acos
// Paramterers:
// x = input x
template<class VTYPE, class BTYPE, int AC> 
static inline VTYPE asin_f(VTYPE const & x) {

    // define constants
    static const float P4asinf = 4.2163199048E-2f;
    static const float P3asinf = 2.4181311049E-2f;
    static const float P2asinf = 4.5470025998E-2f;
    static const float P1asinf = 7.4953002686E-2f;
    static const float P0asinf = 1.6666752422E-1f;

    VTYPE xa, x1, x2, x3, x4, xb, z, z1, z2;
    BTYPE big;

    xa  = abs(x);
    big = xa > 0.5f;

    x1 = 0.5f * (1.0f - xa);
    x2 = xa * xa;        
    x3 = select(big, x1, x2);

    //if (horizontal_or(big)) 
    {
        xb = sqrt(x1);
    }
    x4 = select(big, xb, xa);

    z = polynomial_4(x3, P0asinf, P1asinf, P2asinf, P3asinf, P4asinf);
    z = z * (x3*x4) + x4;
    z1 = z + z;

    // correct for sign
    if (AC) {  // acos
        z1 = select(x < 0., float(VM_PI) - z1, z1);
        z2 = float(VM_PI_2) - sign_combine(z, x);
        z  = select(big, z1, z2);
    }
    else {     // asin
        z1 = float(VM_PI_2) - z1;
        z  = select(big, z1, z);
        z  = sign_combine(z, x);
    }

    return z;
}

// instantiations of asin_f template:

static inline Vec4f asin(Vec4f const & x) {
    return asin_f<Vec4f, Vec4fb, 0>(x);
}

static inline Vec8f asin(Vec8f const & x) { 
    return asin_f<Vec8f, Vec8fb, 0>(x);
}

static inline Vec4f acos(Vec4f const & x) {
    return asin_f<Vec4f, Vec4fb, 1>(x);
}

static inline Vec8f acos(Vec8f const & x) { 
    return asin_f<Vec8f, Vec8fb, 1>(x);
}


// *************************************************************
//             atan template, double precision
// *************************************************************
// Template parameters:
// VTYPE:  f.p. vector type
// BTYPE:  boolean vector type
// T2:     0 = atan, 1 = atan2
// Paramterers:
// y, x. calculate tan(y/x)
// result is between -pi/2 and +pi/2 when x > 0
// result is between -pi and -pi/2 or between pi/2 and pi when x < 0 for atan2
// atan2(0,0) gives NAN. Future versions may give 0
template<class VTYPE, class BTYPE, int T2> 
static inline VTYPE atan_d(VTYPE const & y, VTYPE const & x) {

    // define constants
    static const double ONEOPIO4 = 4./VM_PI;
    static const double MOREBITS = 6.123233995736765886130E-17;
    static const double MOREBITSO2 = MOREBITS * 0.5;
    static const double T3PO8 = VM_SQRT2 + 1.; // 2.41421356237309504880;

	static const double P4atan = -8.750608600031904122785E-1;
	static const double P3atan = -1.615753718733365076637E1;
	static const double P2atan = -7.500855792314704667340E1;
	static const double P1atan = -1.228866684490136173410E2;
	static const double P0atan = -6.485021904942025371773E1;

	static const double Q4atan = 2.485846490142306297962E1;
	static const double Q3atan = 1.650270098316988542046E2;
	static const double Q2atan = 4.328810604912902668951E2;
	static const double Q1atan = 4.853903996359136964868E2;
	static const double Q0atan = 1.945506571482613964425E2;

    VTYPE t, x1, x2, y1, y2, s, fac, a, b, z, zz, px, qx, re;  // data vectors
    BTYPE swapxy, notbig, notsmal;                             // boolean vectors

    if (T2) {  // atan2(y,x)
        // move in first octant
        x1 = abs(x);
        y1 = abs(y);
        swapxy = (y1 > x1);
        // swap x and y if y1 > x1
        x2 = select(swapxy, y1, x1);
        y2 = select(swapxy, x1, y1);        
        t  = y2 / x2;                  // x = y = 0 gives NAN here
    }
    else {    // atan(y)
        t = abs(y);
    }

    // small:  t < 0.66
    // medium: 0.66 <= t <= 2.4142 (1+sqrt(2))
    // big:    t > 2.4142
    notbig  = t <= T3PO8;  // t <= 2.4142
    notsmal = t >= 0.66;   // t >= 0.66

    s = select(notbig, VTYPE(VM_PI_4), VTYPE(VM_PI_2));
    s = notsmal & s;                   // select(notsmal, s, 0.);
    fac = select(notbig, VTYPE(MOREBITSO2), VTYPE(MOREBITS));
    fac = notsmal & fac;  //select(notsmal, fac, 0.);

    // small:  z = t / 1.0;
    // medium: z = (t-1.0) / (t+1.0);
    // big:    z = -1.0 / t;
    a = notbig & t;   // select(notbig, t, 0.);
    a = if_add(notsmal, a, -1.);
    b = notbig & VTYPE(1.); //  select(notbig, 1., 0.);
    b = if_add(notsmal, b, t);
    z = a / b;      // division by 0 will not occur unless x and y are both 0

    zz = z * z;

    px = polynomial_4 (zz, P0atan, P1atan, P2atan, P3atan, P4atan);
    qx = polynomial_5n(zz, Q0atan, Q1atan, Q2atan, Q3atan, Q4atan);

    re = (px / qx) * (z * zz) + z;
    re += s;
    re += fac;

    if (T2) {  // atan2(y,x)
        // move back in place
        re = select(swapxy, VM_PI_2 - re, re);
        re = select(x < 0., VM_PI   - re, re);
        re = select((x | y) == 0., 0., re);      // atan2(0,0) = 0 by convention
    }
    // get sign bit
    re = sign_combine(re, y);

    return re;
}

// instantiations of atan_d template:

static inline Vec2d atan2(Vec2d const & y, Vec2d const & x) {
    return atan_d<Vec2d, Vec2db, 1>(y, x);
}

static inline Vec4d atan2(Vec4d const & y, Vec4d const & x) {
    return atan_d<Vec4d, Vec4db, 1>(y, x);
}

static inline Vec2d atan(Vec2d const & y) {
    return atan_d<Vec2d, Vec2db, 0>(y, 0.);
}

static inline Vec4d atan(Vec4d const & y) {
    return atan_d<Vec4d, Vec4db, 0>(y, 0.);
}

// *************************************************************
//             atan template, single precision
// *************************************************************
// Template parameters:
// VTYPE:  f.p. vector type
// BTYPE:  boolean vector type
// T2:     0 = atan, 1 = atan2
// Paramterers:
// y, x. calculate tan(y/x)
// result is between -pi/2 and +pi/2 when x > 0
// result is between -pi and -pi/2 or between pi/2 and pi when x < 0 for atan2
// atan2(0,0) gives NAN. Future versions may give 0
template<class VTYPE, class BTYPE, int T2> 
static inline VTYPE atan_f(VTYPE const & y, VTYPE const & x) {

    // define constants
    static const float P3atanf =  8.05374449538E-2f;
    static const float P2atanf = -1.38776856032E-1f;
    static const float P1atanf =  1.99777106478E-1f;
    static const float P0atanf = -3.33329491539E-1f;

    VTYPE t, x1, x2, y1, y2, s, a, b, z, zz, re;   // data vectors
    BTYPE swapxy, notbig, notsmal;                 // boolean vectors

    if (T2) {  // atan2(y,x)
        // move in first octant
        x1 = abs(x);
        y1 = abs(y);
        swapxy = (y1 > x1);
        // swap x and y if y1 > x1
        x2 = select(swapxy, y1, x1);
        y2 = select(swapxy, x1, y1);

        // do we need to protect against x = y = 0? It will just produce NAN, probably without delay
        t  = y2 / x2;
    }
    else {    // atan(y)
        t = abs(y);
    }

    // small:  t < 0.4142
    // medium: 0.4142 <= t <= 2.4142
    // big:    t > 2.4142  (not for atan2)
    if (!T2) {  // atan(y)
        notsmal = t >= float(VM_SQRT2-1.);  // t >= tan  pi/8
        notbig  = t <= float(VM_SQRT2+1.);  // t <= tan 3pi/8

        s = select(notbig, VTYPE(float(VM_PI_4)), VTYPE(float(VM_PI_2)));
        s = notsmal & s;      // select(notsmal, s, 0.);

        // small:  z = t / 1.0;
        // medium: z = (t-1.0) / (t+1.0);
        // big:    z = -1.0 / t;
        a = notbig & t; // select(notbig, t, 0.);
        a = if_add(notsmal, a, -1.f);
        b = notbig & VTYPE(1.f); //  select(notbig, 1., 0.);
        b = if_add(notsmal, b, t);
        z = a / b;      // division by 0 will not occur unless x and y are both 0
    }
    else {  // atan2(y,x)
        // small:  z = t / 1.0;
        // medium: z = (t-1.0) / (t+1.0);
        notsmal = t >= float(VM_SQRT2-1.); 
        a = if_add(notsmal, t, -1.f);
        b = if_add(notsmal, 1.f, t);
        s = notsmal & VTYPE(float(VM_PI_4));
        z = a / b;
    }

    zz = z * z;

    // Taylor expansion
    re = polynomial_3(zz, P0atanf, P1atanf, P2atanf, P3atanf) * (zz * z) + z;

    re += s;

    if (T2) {  // atan2(y,x)
        // move back in place
        re = select(swapxy, float(VM_PI_2) - re, re);
        re = select(x < 0., float(VM_PI)   - re, re);
        re = select((x | y) == 0.f, 0.f, re);          // atan2(0,0) = 0 by convention
    }
    // get sign bit
    re = sign_combine(re, y);

    return re;
}

// instantiations of atan_f template:

static inline Vec4f atan2(Vec4f const & y, Vec4f const & x) {
    return atan_f<Vec4f, Vec4fb, 1>(y, x);
}

static inline Vec8f atan2(Vec8f const & y, Vec8f const & x) {
    return atan_f<Vec8f, Vec8fb, 1>(y, x);
}

static inline Vec4f atan(Vec4f const & y) {
    return atan_f<Vec4f, Vec4fb, 0>(y, 0.);
}

static inline Vec8f atan(Vec8f const & y) {
    return atan_f<Vec8f, Vec8fb, 0>(y, 0.);
}

#endif
