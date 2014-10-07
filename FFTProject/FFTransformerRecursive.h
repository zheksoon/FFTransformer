#ifndef FFTRANSFORMERRECURSIVE_H
#define FFTRANSFORMERRECURSIVE_H

#include <cmath>
#include "vectorclass.h"
#include "Complex.h"

typedef unsigned int uint;


template <class FLOAT>
class FFTransformerRecursive
{
    private:
        int length;
        int direction;
        Complex<FLOAT> *twiddles_unalign;
        Complex<FLOAT> *twiddles;
        uint *shuffle_ind_unalign;
        uint *shuffle_ind;

        static const int MIN_FFT_BRANCH = 4096 * 1;

        bool isPowerOfTwo(uint n);
        int getPowerOfTwo(uint n);
        uint bitReverseInt32(uint n);
        void arrayShuffle(Complex<FLOAT> *data, int length);

    public:
        FFTransformerRecursive();
        FFTransformerRecursive(int fftLength, int direction);
        virtual ~FFTransformerRecursive();

        bool FFTInit(int fftLength, int direction);
        bool FFTransform(Complex<FLOAT> *data);
        bool FFTransform(Complex<FLOAT> *data, int length);
        bool FFTransformNormal(Complex<FLOAT> *data, int length);
};

#endif // FFTRANSFORMERRECURSIVE_H
