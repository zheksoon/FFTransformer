#include "Complex.h"

template <class T>
Complex<T>::Complex() : re(0), im(0)
{

}

template <class T>
Complex<T>::Complex(T re, T im) : re(re), im(im)
{

}

template class Complex<float>;
template class Complex<double>;
template class Complex<long double>;

