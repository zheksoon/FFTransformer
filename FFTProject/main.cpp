#include <iostream>
#include <omp.h>
#include <cstdlib>

#include <Complex.h>
#include <FFTransformer.h>
#include <FFTransformerVec.h>
#include "fftw/fftw3.h"

using namespace std;

const int FFT_SIZE  = 4096;
const int MAX_ITER  = 1000;
const int DATA_SIZE = FFT_SIZE * MAX_ITER;

template <class T>
Complex<T>* prepareData(int dSize)
{
    Complex<T> *data = new Complex<T>[dSize];
    for (int i = 0; i < dSize; i++)
    {
        data[i].re = static_cast<T>(rand()) / RAND_MAX;
        data[i].im = static_cast<T>(rand()) / RAND_MAX;
    }
    return data;
}

void compareFFTW3()
{
    const int N = 65536;
    fftwf_complex *in, *out;
    fftwf_plan p;
    in  = (fftwf_complex*)fftwf_malloc(sizeof(fftwf_complex) * N);
    out = (fftwf_complex*)fftwf_malloc(sizeof(fftwf_complex) * N);
    srand(100500);
    for (int i = 0; i < N; i++)
    {
        in[i][0] = 100*(float)rand() / RAND_MAX;
        in[i][1] = 100*(float)rand() / RAND_MAX;
    }
    p = fftwf_plan_dft_1d(N, in, out, FFTW_FORWARD, FFTW_ESTIMATE);
    fftwf_execute(p);

    Complex<float>* data = new Complex<float>[N];
    srand(100500);
    for (int i = 0; i < N; i++)
    {
        data[i].re = 100*(float)rand() / RAND_MAX;
        data[i].im = 100*(float)rand() / RAND_MAX;
    }
    FFTransformerVec<float> FFT(N, 1);
    FFT.FFTransform(data);

    float acc = 0;
    for (int i = 0; i < N; i++)
    {
        acc += (out[i][0] - data[i].re)*(out[i][0] - data[i].re) +
               (out[i][1] - data[i].im)*(out[i][1] - data[i].im);
    }
    acc /= N;

    cout << "Mean square error: " << acc << endl;

    fftwf_destroy_plan(p);

    fftwf_free(in);
    fftwf_free(out);
}

template <class T>
void testFFT()
{
    cout << "Preparing data..." << endl;
    FFTransformerVec<T> FFT(FFT_SIZE, 1);
    Complex<T> *data = prepareData<T>(DATA_SIZE);
    cout << "Starting testing..." << endl;
    double tStart = omp_get_wtime();
    for (int i = 0; i < MAX_ITER; i++)
    {
        FFT.FFTransform(&data[i * FFT_SIZE]);
    }
    double tEnd = omp_get_wtime();
    cout << "Data mean: " << data[0].re << endl;
    cout << "Transformation took " << 1e6*(tEnd - tStart)/MAX_ITER << " us" << endl;
    delete[] data;
}

void testSin()
{
    int N = 16;
    FFTransformer<float> fft(N, 1);
    Complex<float>* data = new Complex<float>[N];
    for (int i = 0; i < N; i++)
    {
        data[i].re = 10 * sin(4 * 2 * M_PI * i / N);
        data[i].im = 0;
    }
    fft.FFTransform(data);
    return;
}

int main()
{
    cout << "Comparing to FFTW3..." << endl;
    compareFFTW3();
    cout << "-----------------" << endl;
    //testSin();

    cout << "Testing float..." << endl;
    testFFT<float>();
    /*
    cout << "-----------------" << endl;
    cout << "Testing double..." << endl;
    testFFT<double>();
    cout << "-----------------" << endl;
    cout << "Testing long double..." << endl;
    testFFT<long double>();
    */
    return 0;
}
