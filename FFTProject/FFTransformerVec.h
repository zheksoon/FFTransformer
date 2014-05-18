#ifndef FFTRANSFORMERVEC_H
#define FFTRANSFORMERVEC_H

#include <cmath>
#include "vectorclass.h"
#include "Complex.h"

typedef unsigned int uint;


template <class FLOAT>
class FFTransformerVec
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
        FFTransformerVec();
        FFTransformerVec(int fftLength, int direction);
        virtual ~FFTransformerVec();

        bool FFTInit(int fftLength, int direction);
        bool FFTransform(Complex<FLOAT> *data);
};

#endif // FFTRANSFORMER_H
