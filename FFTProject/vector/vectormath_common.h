/***************************  vectormath_common.h   ****************************
* Author:        Agner Fog
* Date created:  2014-04-18
* Last modified: 2014-05-02
* Version:       1.12
* Project:       vector classes
* Description:
* Header file containing common code for inline version of mathematical functions.
*
* Theory:
* Moshier, Stephen Lloyd Baluk: Methods and programs for mathematical functions.
* Ellis Horwood Chichester, 1989.
* Inspired by VDT library developed on CERN by Danilo Piparo, Thomas Hauth and
* Vincenzo Innocente, 2012, https://svnweb.cern.ch/trac/vdt
* and by the Cephes math library by Stephen L. Moshier 1992,
* http://www.netlib.org/cephes/
*
* Calculation methods:
* Some functions are using Padé approximations f(x) = P(x)/Q(x)
* Most single precision functions are using Taylor expansions
*
* For detailed instructions, see VectorClass.pdf
*
* (c) Copyright 2014 GNU General Public License http://www.gnu.org/licenses
******************************************************************************/

#ifndef VECTORMATH_COMMON_H
#define VECTORMATH_COMMON_H  1

#ifdef VECTORMATH_LIB_H
#error conflicting header files: vectormath_lib.h for external math functions, other vectormath_xxx.h for inline math functions
#endif

#include <math.h>
#include "vectorclass.h"

// define constants
#define VM_PI       3.14159265358979323846           // pi
#define VM_PI_2     1.57079632679489661923           // pi / 2
#define VM_PI_4     0.785398163397448309616          // pi / 4
#define VM_SQRT2    1.41421356237309504880           // sqrt(2)
#define VM_LOG2E    1.44269504088896340736           // 1/log(2)
#define VM_LOG10E   0.434294481903251827651          // 1/log(10)
#define VM_LN2      0.693147180559945309417          // log(2)
#define VM_LN10     2.30258509299404568402           // log(10)
#define VM_SMALLEST_NORMAL  2.2250738585072014E-308  // smallest normal number, double
#define VM_SMALLEST_NORMALF 1.17549435E-38f          // smallest normal number, float


// template for producing infinite in desired vector type
template <class VTYPE>
static inline VTYPE infinite_vec();

template <>
inline Vec2d infinite_vec<Vec2d>() {
    return infinite2d();
}

template <>
inline Vec4d infinite_vec<Vec4d>() {
    return infinite4d();
}

template <>
inline Vec4f infinite_vec<Vec4f>() {
    return infinite4f();
}
template <>
inline Vec8f infinite_vec<Vec8f>() {
    return infinite8f();
}

// template for producing quiet NAN in desired vector type
template <class VTYPE>
static inline VTYPE nan_vec(int n = 0x100);

template <>
inline Vec2d nan_vec<Vec2d>(int n) {
    return nan2d(n);
}

template <>
inline Vec4d nan_vec<Vec4d>(int n) {
    return nan4d(n);
}

template <>
inline Vec4f nan_vec<Vec4f>(int n) {
    return nan4f(n);
}
template <>
inline Vec8f nan_vec<Vec8f>(int n) {
    return nan8f(n);
}
// Define NAN trace values
#define NAN_LOG 0x102


// Templates for polynomials

// template <typedef VECTYPE, typedef CTYPE> 
template <class VTYPE, class CTYPE> 
static inline VTYPE polynomial_2(VTYPE const & x, CTYPE c0, CTYPE c1, CTYPE c2) {
    // calculates polynomial c2*x^2 + c1*x + c0
    // VTYPE may be a vector type, CTYPE is a scalar type
    VTYPE x2 = x * x;
    VTYPE y = x2 * c2 + (x * c1 + c0);
    return y;
}

template<class VTYPE, class CTYPE> 
static inline VTYPE polynomial_3(VTYPE const & x, CTYPE c0, CTYPE c1, CTYPE c2, CTYPE c3) {
    // calculates polynomial c3*x^3 + c2*x^2 + c1*x + c0
    // VTYPE may be a vector type, CTYPE is a scalar type
    VTYPE x2 = x * x;
    VTYPE x3 = x2 * x;
    VTYPE y = x3 * c3;
    y +=  x2 * c2 + (x * c1 + c0);
    return y;
}

template<class VTYPE, class CTYPE> 
static inline VTYPE polynomial_4(VTYPE const & x, CTYPE c0, CTYPE c1, CTYPE c2, CTYPE c3, CTYPE c4) {
    // calculates polynomial c4*x^4 + c3*x^3 + c2*x^2 + c1*x + c0
    // VTYPE may be a vector type, CTYPE is a scalar type
    VTYPE x2 = x * x;
    VTYPE x4 = x2 * x2;
    VTYPE x3 = x2 * x;
    VTYPE y = x3 * c3 + x4 * c4;
    y +=  x2 * c2 + (x * c1 + c0);
    return y;
}

template<class VTYPE, class CTYPE> 
static inline VTYPE polynomial_4n(VTYPE const & x, CTYPE c0, CTYPE c1, CTYPE c2, CTYPE c3) {
    // calculates polynomial 1*x^4 + c3*x^3 + c2*x^2 + c1*x + c0
    // VTYPE may be a vector type, CTYPE is a scalar type
    VTYPE x2 = x * x;
    VTYPE x4 = x2 * x2;
    VTYPE x3 = x2 * x;
    VTYPE y = x3 * c3 + x4;
    y +=  x2 * c2 + (x * c1 + c0);
    return y;
}

template<class VTYPE, class CTYPE> 
static inline VTYPE polynomial_5(VTYPE const & x, CTYPE c0, CTYPE c1, CTYPE c2, CTYPE c3, CTYPE c4, CTYPE c5) {
    // calculates polynomial c5*x^5 + c4*x^4 + c3*x^3 + c2*x^2 + c1*x + c0
    // VTYPE may be a vector type, CTYPE is a scalar type
    VTYPE x2 = x * x;
    VTYPE x4 = x2 * x2;
    VTYPE x5 = x4 * x;
    VTYPE x3 = x2 * x;
    VTYPE y = x4*c4+x3*c3;
    y += x2*c2+x*c1+c0;
    y += x5*c5;
    return y;
}

template<class VTYPE, class CTYPE> 
static inline VTYPE polynomial_5n(VTYPE const & x, CTYPE c0, CTYPE c1, CTYPE c2, CTYPE c3, CTYPE c4) {
    // calculates polynomial 1*x^5 + c4*x^4 + c3*x^3 + c2*x^2 + c1*x + c0
    // VTYPE may be a vector type, CTYPE is a scalar type
    VTYPE x2 = x * x;
    VTYPE x4 = x2 * x2;
    VTYPE x5 = x4 * x;
    VTYPE x3 = x2 * x;
    VTYPE y = x4*c4+x3*c3;
    y += (x2*c2+x*c1)+(c0+x5);
    return y;
}

template<class VTYPE, class CTYPE> 
static inline VTYPE polynomial_6(VTYPE const & x, CTYPE c0, CTYPE c1, CTYPE c2, CTYPE c3, CTYPE c4, CTYPE c5, CTYPE c6) {
    // calculates polynomial c6*x^6 + c5*x^5 + c4*x^4 + c3*x^3 + c2*x^2 + c1*x + c0
    // VTYPE may be a vector type, CTYPE is a scalar type
    VTYPE x2 = x * x;
    VTYPE x4 = x2 * x2;
    VTYPE x6 = x4 * x2;
    VTYPE x5 = x4 * x;
    VTYPE x3 = x2 * x;
    VTYPE y = x4*c4+x3*c3;
    y += x2*c2+x*c1+c0;
    y += x5*c5+x6*c6;
    return y;
}

template<class VTYPE, class CTYPE> 
static inline VTYPE polynomial_7(VTYPE const & x, CTYPE c0, CTYPE c1, CTYPE c2, CTYPE c3, CTYPE c4, CTYPE c5, CTYPE c6, CTYPE c7) {
    // calculates polynomial c7*x^7 + c6*x^6 + c5*x^5 + c4*x^4 + c3*x^3 + c2*x^2 + c1*x + c0
    // VTYPE may be a vector type, CTYPE is a scalar type
    VTYPE x2 = x * x;
    VTYPE x4 = x2 * x2;
    VTYPE x6 = x4 * x2;
    VTYPE x7 = x6 * x;
    VTYPE x5 = x4 * x;
    VTYPE x3 = x2 * x;
    VTYPE y = x6*c6+x5*c5;
    y += (x4*c4+x3*c3)+(x2*c2+x*c1+c0);
    y += x7*c7;
    return y;
}

template<class VTYPE, class CTYPE> 
static inline VTYPE polynomial_8(VTYPE const & x, CTYPE c0, CTYPE c1, CTYPE c2, CTYPE c3, CTYPE c4, CTYPE c5, CTYPE c6, CTYPE c7, CTYPE c8) {
    // calculates polynomial c7*x^7 + c6*x^6 + c5*x^5 + c4*x^4 + c3*x^3 + c2*x^2 + c1*x + c0
    // VTYPE may be a vector type, CTYPE is a scalar type
    VTYPE x2 = x  * x;
    VTYPE x4 = x2 * x2;
    VTYPE x6 = x4 * x2;
    VTYPE x7 = x6 * x;
    VTYPE x8 = x4 * x4;
    VTYPE x5 = x4 * x;
    VTYPE x3 = x2 * x;
    VTYPE y = x6*c6+x5*c5+x8*c8;
    y += (x4*c4+x3*c3)+(x2*c2+x*c1+c0);
    y += x7*c7;
    return y;
}

template<class VTYPE, class CTYPE> 
static inline VTYPE polynomial_9(VTYPE const & x, CTYPE c0, CTYPE c1, CTYPE c2, CTYPE c3, CTYPE c4, CTYPE c5, CTYPE c6, CTYPE c7, CTYPE c8, CTYPE c9) {
    // calculates polynomial c7*x^7 + c6*x^6 + c5*x^5 + c4*x^4 + c3*x^3 + c2*x^2 + c1*x + c0
    // VTYPE may be a vector type, CTYPE is a scalar type
    VTYPE x2 = x  * x;
    VTYPE x4 = x2 * x2;
    VTYPE x6 = x4 * x2;
    VTYPE x7 = x6 * x;
    VTYPE x8 = x4 * x4;
    VTYPE x9 = x8 * x;
    VTYPE x5 = x4 * x;
    VTYPE x3 = x2 * x;
    VTYPE y = x6*c6+x5*c5+x8*c8;
    y += (x4*c4+x3*c3)+(x2*c2+x*c1+c0);
    y += x7*c7+x9*c9;
    return y;
}

template<class VTYPE, class CTYPE> 
static inline VTYPE polynomial_10(VTYPE const & x, CTYPE c0, CTYPE c1, CTYPE c2, CTYPE c3, CTYPE c4, CTYPE c5, CTYPE c6, CTYPE c7, CTYPE c8, CTYPE c9, CTYPE c10) {
    // calculates polynomial c7*x^7 + c6*x^6 + c5*x^5 + c4*x^4 + c3*x^3 + c2*x^2 + c1*x + c0
    // VTYPE may be a vector type, CTYPE is a scalar type
    VTYPE x2 = x  * x;
    VTYPE x4 = x2 * x2;
    VTYPE x6 = x4 * x2;
    VTYPE x7 = x6 * x;
    VTYPE x8 = x4 * x4;
    VTYPE x9 = x8 * x;
    VTYPE x10 = x8 * x2;
    VTYPE x5 = x4 * x;
    VTYPE x3 = x2 * x;
    VTYPE y = x6*c6+x5*c5+x8*c8;
    y += (x4*c4+x3*c3)+(x2*c2+x*c1+c0);
    y += x7*c7+x9*c9+x10*c10;
    return y;
}

#endif
