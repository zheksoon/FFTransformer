#include "FFTransformerVec.h"

template <class FLOAT>
bool FFTransformerVec<FLOAT>::isPowerOfTwo(uint n)
{
    return ((n - 1) & n) == 0;
}

template <class FLOAT>
int FFTransformerVec<FLOAT>::getPowerOfTwo(uint n)
{
    return 31 - __builtin_clz(n);
}

template <class FLOAT>
uint FFTransformerVec<FLOAT>::bitReverseInt32(uint v)
{
    static const unsigned char rev_byte[256] = {0, 128, 64, 192, 32, 160, 96, 224, 16, 144, 80, 208, 48, 176, 112, 240, 8, 136, 72, 200, 40, 168, 104, 232, 24, 152, 88, 216, 56, 184, 120, 248, 4, 132, 68, 196, 36, 164, 100, 228, 20, 148, 84, 212, 52, 180, 116, 244, 12, 140, 76, 204, 44, 172, 108, 236, 28, 156, 92, 220, 60, 188, 124, 252, 2, 130, 66, 194, 34, 162, 98, 226, 18, 146, 82, 210, 50, 178, 114, 242, 10, 138, 74, 202, 42, 170, 106, 234, 26, 154, 90, 218, 58, 186, 122, 250, 6, 134, 70, 198, 38, 166, 102, 230, 22, 150, 86, 214, 54, 182, 118, 246, 14, 142, 78, 206, 46, 174, 110, 238, 30, 158, 94, 222, 62, 190, 126, 254, 1, 129, 65, 193, 33, 161, 97, 225, 17, 145, 81, 209, 49, 177, 113, 241, 9, 137, 73, 201, 41, 169, 105, 233, 25, 153, 89, 217, 57, 185, 121, 249, 5, 133, 69, 197, 37, 165, 101, 229, 21, 149, 85, 213, 53, 181, 117, 245, 13, 141, 77, 205, 45, 173, 109, 237, 29, 157, 93, 221, 61, 189, 125, 253, 3, 131, 67, 195, 35, 163, 99, 227, 19, 147, 83, 211, 51, 179, 115, 243, 11, 139, 75, 203, 43, 171, 107, 235, 27, 155, 91, 219, 59, 187, 123, 251, 7, 135, 71, 199, 39, 167, 103, 231, 23, 151, 87, 215, 55, 183, 119, 247, 15, 143, 79, 207, 47, 175, 111, 239, 31, 159, 95, 223, 63, 191, 127, 255, };
	for (int i = 0; i < 4; i++)
    {
        uint t = v & 0xFF;
        v = (v ^ t) | rev_byte[t];
        v = (v >> 8) | (v << 24);
    }
	v = __builtin_bswap32(v);
	return v;
}

template <class FLOAT>
void FFTransformerVec<FLOAT>::arrayShuffle(Complex<FLOAT>* data, int length)
{
	for (int i = 0; i < length; i++)
	{
		int rev_ind = shuffle_ind[i];
		if (rev_ind > i)
        {
            Complex<FLOAT> t = data[i];
            data[i] = data[rev_ind];
            data[rev_ind] = t;
        }
	}
}

template <class FLOAT>
FFTransformerVec<FLOAT>::FFTransformerVec() : twiddles(0), shuffle_ind(0)
{
    //do nothing
}

template <class FLOAT>
FFTransformerVec<FLOAT>::FFTransformerVec(int fftLength, int direction) : twiddles(0)
{
    FFTInit(fftLength, direction);
}

template <class FLOAT>
FFTransformerVec<FLOAT>::~FFTransformerVec()
{
    if (this->twiddles != 0)
    {
        delete[] twiddles;
    }
    if (this->shuffle_ind != 0)
    {
        delete[] shuffle_ind;
    }
}

template <class FLOAT>
bool FFTransformerVec<FLOAT>::FFTInit(int fftLength, int direction)
{
    if (fftLength > 0 && isPowerOfTwo(fftLength))
    {
        this->length = fftLength;
        this->direction = direction > 0 ? 1 : 0;
        this->twiddles    = new Complex<FLOAT>[fftLength];
        this->shuffle_ind = new uint[fftLength];
        for (int twSteep = 1; twSteep < fftLength; twSteep *= 2)
        {
            for (int i = 0; i < twSteep; i++)
            {
                FLOAT twAngle = -M_PI * direction * i / twSteep;
                twiddles[twSteep + i - 1].re = cos(twAngle);
                twiddles[twSteep + i - 1].im = sin(twAngle);
            }
        }
        int bit_cnt = 32 - getPowerOfTwo(length);
        for (int i = 0; i < length; i++)
        {
            shuffle_ind[i] = bitReverseInt32(i) >> bit_cnt;
        }
        return true;
    }
    else
        return false;
}

template <class FLOAT>
bool FFTransformerVec<FLOAT>::FFTransform(Complex<FLOAT>* data)
{
    if (length <= 0 || !isPowerOfTwo(length)) return false;
    if (length == 1) return true;
	arrayShuffle(data, length);
	int stages = getPowerOfTwo(length);
	//explicit first steep with singular twiddles
	int steep = 4;
	for (int butterfly = 0; butterfly < length; butterfly += steep)
    {
        Complex<FLOAT> &a = data[butterfly + 0];
        Complex<FLOAT> &b = data[butterfly + 1];
        Complex<FLOAT> &c = data[butterfly + 2];
        Complex<FLOAT> &d = data[butterfly + 3];

        Vec4f ab, cd;
        ab.load_a((float*)&a);
        cd.load_a((float*)&c);
        Vec4f sign_1 = reinterpret_f(Vec4i(0, 0, 1<<31, 1<<31));
        Vec4f sign_2 = reinterpret_f(Vec4i(0, 0, 0, 1<<31));

        Vec4f ab_shuf = permute4f<2,3,0,1>(ab);
        ab = (ab ^ sign_1) + ab_shuf;

        Vec4f cd_shuf = permute4f<2,3,0,1>(cd) ;
        cd = (cd ^ sign_1) + cd_shuf;

        Vec4f ab_fin = ab + (permute4f<0,1,3,2>(cd) ^ sign_2);
        Vec4f cd_fin = ab - (permute4f<0,1,3,2>(cd) ^ sign_2);

        ab_fin.store_a((float*)&a);
        cd_fin.store_a((float*)&c);
/*
        FLOAT ua = a.re + b.re;
        FLOAT va = a.im + b.im;
        FLOAT ub = a.re - b.re;
        FLOAT vb = a.im - b.im;

        FLOAT uc = c.re + d.re;
        FLOAT vc = c.im + d.im;
        FLOAT ud = c.re - d.re;
        FLOAT vd = c.im - d.im;

        a.re = ua + uc;
        a.im = va + vc;
        b.re = ub + vd;
        b.im = vb - ud;

        c.re = ua - uc;
        c.im = va - vc;
        d.re = ub - vd;
        d.im = vb + ud;
        */
    }
    if (length == 2) return true;

	for (int stage = 2; stage < stages; stage++)
	{
		int twiddle_number = steep;
		steep *= 2;
		for (int twiddle = 0; twiddle < twiddle_number; twiddle++)
		{
			FLOAT c = twiddles[twiddle_number + twiddle - 1].re;
			FLOAT s = twiddles[twiddle_number + twiddle - 1].im;
			for (int butterfly = twiddle; butterfly < length; butterfly += steep)
			{
				Complex<FLOAT> &a = data[butterfly];
				Complex<FLOAT> &b = data[butterfly + twiddle_number];
				FLOAT u = b.re * c - b.im * s;
				FLOAT v = b.re * s + b.im * c;

				b.re = a.re - u;
				b.im = a.im - v;
				a.re = a.re + u;
				a.im = a.im + v;
			}
		}
	}
	/*
	FLOAT rLength = 1.0 / length;
	for (int i = 0; i < length; i++)
    {
        data[i].re *= rLength;
        data[i].im *= rLength;
    }
    */
	return true;
}

template class FFTransformerVec<float>;
//template class FFTransformerVec<double>;
//template class FFTransformerVec<long double>;
