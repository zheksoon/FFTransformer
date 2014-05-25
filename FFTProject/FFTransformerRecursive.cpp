#include "FFTransformerRecursive.h"

template <class FLOAT>
bool FFTransformerRecursive<FLOAT>::isPowerOfTwo(uint n)
{
    return ((n - 1) & n) == 0;
}

template <class FLOAT>
int FFTransformerRecursive<FLOAT>::getPowerOfTwo(uint n)
{
    return 31 - __builtin_clz(n);
}

template <class FLOAT>
uint FFTransformerRecursive<FLOAT>::bitReverseInt32(uint v)
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
void FFTransformerRecursive<FLOAT>::arrayShuffle(Complex<FLOAT>* data, int length)
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
FFTransformerRecursive<FLOAT>::FFTransformerRecursive() : twiddles(0), shuffle_ind(0)
{
    //do nothing
}

template <class FLOAT>
FFTransformerRecursive<FLOAT>::FFTransformerRecursive(int fftLength, int direction) : twiddles(0)
{
    FFTInit(fftLength, direction);
}

template <class FLOAT>
FFTransformerRecursive<FLOAT>::~FFTransformerRecursive()
{
    if (this->twiddles_unalign != 0)
    {
        delete[] twiddles_unalign;
    }
    if (this->shuffle_ind_unalign != 0)
    {
        delete[] shuffle_ind_unalign;
    }
}

template <class FLOAT>
bool FFTransformerRecursive<FLOAT>::FFTInit(int fftLength, int direction)
{
    if (fftLength > 0 && isPowerOfTwo(fftLength))
    {
        this->length = fftLength;
        this->direction = direction > 0 ? 1 : 0;
        this->twiddles_unalign    = new Complex<FLOAT>[fftLength + 16 / sizeof(Complex<FLOAT>)];
        this->shuffle_ind_unalign = new uint[fftLength + 16 / sizeof(uint)];
        this->twiddles = (Complex<FLOAT>*)((int)twiddles_unalign & (~15));
        this->shuffle_ind = (uint*)((int)shuffle_ind_unalign & (~15));
        for (int twSteep = 4; twSteep < fftLength; twSteep *= 2)
        {
            for (int i = 0; i < twSteep; i++)
            {
                FLOAT twAngle = -M_PI * direction * i / twSteep;
                twiddles[twSteep + i - 4].re = cos(twAngle);
                twiddles[twSteep + i - 4].im = sin(twAngle);
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
bool FFTransformerRecursive<FLOAT>::FFTransform(Complex<FLOAT>* data)
{
    arrayShuffle(data, length);
    return FFTransform(data, length);
}

template <class FLOAT>
bool FFTransformerRecursive<FLOAT>::FFTransform(Complex<FLOAT>* data, int length)
{
    if (length <= MIN_FFT_BRANCH)
    {
        return FFTransformNormal(data, length);
    }
    int steep = length / 2;
    #pragma omp parallel sections
    {
        #pragma omp section
        {
            FFTransform(data, steep);
        }
        #pragma omp section
        {
            FFTransform(data + steep, steep);
        }
    }
    {
        for (int butterfly = 0; butterfly < steep; butterfly += 4)
        {
            Vec4f sign_1 = reinterpret_f(Vec4i(1<<31, 0, 1<<31, 0));
            float *tw = (float*)&twiddles[steep + butterfly - 4];
            Vec4f tw_norm_1, tw_perm_1, tw_norm_2, tw_perm_2;
            tw_norm_1.load_a(tw);
            tw_perm_1 = permute4f<1,1,3,3>(tw_norm_1) ^ sign_1;
            tw_norm_1 = permute4f<0,0,2,2>(tw_norm_1);

            tw_norm_2.load_a(tw + 4);
            tw_perm_2 = permute4f<1,1,3,3>(tw_norm_2) ^ sign_1;
            tw_norm_2 = permute4f<0,0,2,2>(tw_norm_2);

            Complex<FLOAT> &a = data[butterfly];
            Complex<FLOAT> &b = data[butterfly + steep];
            Complex<FLOAT> &e = data[butterfly + 2];
            Complex<FLOAT> &g = data[butterfly + 2 + steep];

            Vec4f ac, bd, ef, gh;
            ac.load_a((float*)&a);
            bd.load_a((float*)&b);
            ef.load_a((float*)&e);
            gh.load_a((float*)&g);

            Vec4f bd_perm = permute4f<1,0,3,2>(bd);
            Vec4f uv_bd = bd * tw_norm_1 + bd_perm * tw_perm_1;
            bd = ac - uv_bd;
            ac = ac + uv_bd;

            Vec4f gh_perm = permute4f<1,0,3,2>(gh);
            Vec4f uv_gh = gh * tw_norm_2 + gh_perm * tw_perm_2;
            gh = ef - uv_gh;
            ef = ef + uv_gh;

            ac.store_a((float*)&a);
            bd.store_a((float*)&b);
            ef.store_a((float*)&e);
            gh.store_a((float*)&g);
        }
    }
    return true;
}

template <class FLOAT>
bool FFTransformerRecursive<FLOAT>::FFTransformNormal(Complex<FLOAT>* data, int length)
{
    if (length <= 0 || !isPowerOfTwo(length)) return false;
    if (length == 1) return true;
	//arrayShuffle(data, length);
	int stages = getPowerOfTwo(length);
	//explicit first steep with singular twiddles
	int steep = 8;
	const FLOAT SQRT2_2 = 0.70710678118654752440084436210485;
	for (int butterfly = 0; butterfly < length; butterfly += steep)
    {
        Complex<FLOAT> &a = data[butterfly + 0];
        Complex<FLOAT> &c = data[butterfly + 2];
        Complex<FLOAT> &e = data[butterfly + 4];
        Complex<FLOAT> &g = data[butterfly + 6];

        Vec4f ab, cd, ef, gh;
        ab.load_a((float*)&a);
        cd.load_a((float*)&c);
        ef.load_a((float*)&e);
        gh.load_a((float*)&g);
        Vec4f sign_1 = reinterpret_f(Vec4i(0, 0, 1<<31, 1<<31));
        Vec4f sign_2 = reinterpret_f(Vec4i(0, 0, 0,     1<<31));
        Vec4f sign_3 = reinterpret_f(Vec4i(0, 0, 1<<31, 0));
        Vec4f sqrt2_4f_1(0.5,  0.5,  SQRT2_2,  SQRT2_2);
        Vec4f sqrt2_4f_2(-0.5, 0.5, -SQRT2_2, -SQRT2_2);
        Vec4f sqrt2_4f(SQRT2_2,-SQRT2_2,SQRT2_2,-SQRT2_2);

        Vec4f ab_shuf = permute4f<2,3,0,1>(ab);
        ab = (ab ^ sign_1) + ab_shuf;
        Vec4f cd_shuf = permute4f<2,3,0,1>(cd) ;
        cd = (cd ^ sign_1) + cd_shuf;
        Vec4f ab_fin = ab + (permute4f<0,1,3,2>(cd) ^ sign_2);
        Vec4f cd_fin = ab - (permute4f<0,1,3,2>(cd) ^ sign_2);

        Vec4f ef_shuf = permute4f<2,3,0,1>(ef);
        ef = (ef ^ sign_1) + ef_shuf;
        Vec4f gh_shuf = permute4f<2,3,0,1>(gh) ;
        gh = (gh ^ sign_1) + gh_shuf;
        Vec4f ef_fin = ef + (permute4f<0,1,3,2>(gh) ^ sign_2);
        Vec4f gh_fin = ef - (permute4f<0,1,3,2>(gh) ^ sign_2);


        Vec4f ef_fin_shuf = permute4f<0,1,3,2>(ef_fin) ^ sign_2;
        ef_shuf = (ef_fin + ef_fin_shuf) * sqrt2_4f_1;

        Vec4f gh_fin_shuf = permute4f<0,1,3,2>(gh_fin) ^ sign_3;
        gh_fin_shuf = (gh_fin + gh_fin_shuf) * sqrt2_4f_2;
        gh_shuf = permute4f<1,0,2,3>(gh_fin_shuf);

/*
        Vec4f fh = blend4f<2,6,3,7>(ef_fin, gh_fin);
        Vec4f fh_shuf = permute4f<2,3,0,1>(fh) ^ sign_4;
        fh = (fh + fh_shuf) * sqrt2_4f;
        ef_shuf = blend4f<0,1,4,6>(ef_fin, fh);
        gh_shuf = blend4f<1,0,5,7>(gh_fin, fh) ^ sign_5;
*/
        ef_fin = ab_fin - ef_shuf;
        ab_fin = ab_fin + ef_shuf;

        gh_fin = cd_fin - gh_shuf;
        cd_fin = cd_fin + gh_shuf;

        ab_fin.store_a((float*)&a);
        cd_fin.store_a((float*)&c);
        ef_fin.store_a((float*)&e);
        gh_fin.store_a((float*)&g);
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

	for (int stage = 3; stage < stages; stage++)
	{
		int twiddle_number = steep;
		steep *= 2;
        for (int twiddle = 0; twiddle < twiddle_number; twiddle+=4)
        {
            Vec4f sign_1 = reinterpret_f(Vec4i(1<<31, 0, 1<<31, 0));
            float *tw = (float*)&twiddles[twiddle_number + twiddle - 4];
            Vec4f tw_norm_1, tw_perm_1, tw_norm_2, tw_perm_2;
            tw_norm_1.load_a(tw);
            tw_perm_1 = permute4f<1,1,3,3>(tw_norm_1) ^ sign_1;
            tw_norm_1 = permute4f<0,0,2,2>(tw_norm_1);
            tw_norm_2.load_a(tw + 4);
            tw_perm_2 = permute4f<1,1,3,3>(tw_norm_2) ^ sign_1;
            tw_norm_2 = permute4f<0,0,2,2>(tw_norm_2);

            for (int butterfly = twiddle; butterfly < length; butterfly += steep)
            {
                Complex<FLOAT> &a = data[butterfly];
                Complex<FLOAT> &b = data[butterfly + twiddle_number];
                Complex<FLOAT> &e = data[butterfly + 2];
                Complex<FLOAT> &g = data[butterfly + 2 + twiddle_number];

                Vec4f ac, bd, ef, gh;
                ac.load_a((float*)&a);
                bd.load_a((float*)&b);
                ef.load_a((float*)&e);
                gh.load_a((float*)&g);

                Vec4f bd_perm = permute4f<1,0,3,2>(bd);
                Vec4f uv_bd = bd * tw_norm_1 + bd_perm * tw_perm_1;
                bd = ac - uv_bd;
                ac = ac + uv_bd;

                Vec4f gh_perm = permute4f<1,0,3,2>(gh);
                Vec4f uv_gh = gh * tw_norm_2 + gh_perm * tw_perm_2;
                gh = ef - uv_gh;
                ef = ef + uv_gh;

                ac.store_a((float*)&a);
                bd.store_a((float*)&b);
                ef.store_a((float*)&e);
                gh.store_a((float*)&g);
                /*
                FLOAT ub = b.re * cb - b.im * sb;
                FLOAT vb = b.re * sb + b.im * cb;

                FLOAT ud = d.re * cd - d.im * sd;
                FLOAT vd = d.re * sd + d.im * cd;

                b.re = a.re - ub;
                b.im = a.im - vb;
                d.re = c.re - ud;
                d.im = c.im - vd;

                a.re = a.re + ub;
                a.im = a.im + vb;
                c.re = c.re + ud;
                c.im = c.im + vd;
                continue;
                */
            }
        }
	}
	return true;
}

template class FFTransformerRecursive<float>;
//template class FFTransformerRecursive<double>;
//template class FFTransformerRecursive<long double>;
