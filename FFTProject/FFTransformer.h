#ifndef FFTRANSFORMER_H
#define FFTRANSFORMER_H

#include <cmath>
#include "Complex.h"

typedef unsigned int uint;

template <class FLOAT>
class FFTransformer
{
    private:
        int length;
        int direction;
        Complex<FLOAT> *twiddles;
        uint *shuffle_ind;

        bool isPowerOfTwo(uint n);
        int getPowerOfTwo(uint n);
        uint bitReverseInt32(uint n);
        void arrayShuffle(Complex<FLOAT> *data, int length);

    public:
        FFTransformer();
        FFTransformer(int fftLength, int direction);
        virtual ~FFTransformer();

        bool FFTInit(int fftLength, int direction);
        bool FFTransform(Complex<FLOAT> *data);
};

#endif // FFTRANSFORMER_H
