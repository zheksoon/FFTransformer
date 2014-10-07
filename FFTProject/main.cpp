#include <iostream>
#include <omp.h>
#include <cstdlib>
#include <cstring>

#include <Complex.h>
#include <FFTransformerVec.h>
#include <FFTransformerRecursive.h>
#include "fftw/fftw3.h"

using namespace std;

const int FFT_SIZE  = 1048576;
const int MAX_ITER  = 10;
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
    const int N = FFT_SIZE;
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
    //FFTransformerVec<float> FFT(N, 1);
    FFTransformerRecursive<float> FFT(N, 1);
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
    static const int fftSizesLenght = 14;
    static const int fftSizes[] = {256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536, 131072, 262144, 524288, 1048576, 2097152};
    static const int maxMemoryLimit = 16777216 * 1;
    Complex<T> *data = prepareData<T>(maxMemoryLimit);
    Complex<T> *dataTempUnaligned = new Complex<T>[maxMemoryLimit + 8];
    Complex<T> *dataTemp = (Complex<T>*)(((long)dataTempUnaligned | 15) + 1);

    for (int szInd = 0; szInd <  fftSizesLenght; szInd++)
    {
        int fftSize = fftSizes[szInd];
        int fftNumber = maxMemoryLimit / fftSize;
        double tStart, tEnd;

        cout << "Testing transform size " << fftSize << endl;
        cout << "Preparing transform...";
        tStart = omp_get_wtime();
        FFTransformerRecursive<T> *FFT = new FFTransformerRecursive<T>(fftSize, 1);
        tEnd = omp_get_wtime();
        cout << " Done in " << 1e6*(tEnd - tStart) << " us" << endl;
        memcpy(dataTemp, data, maxMemoryLimit * sizeof(Complex<T>));
        cout << "Testing FFTtransform.." << endl;
        tStart = omp_get_wtime();
        for (int i = 0; i < fftNumber; i++)
        {
            FFT->FFTransform(&dataTemp[i * fftSize]);
        }
        tEnd = omp_get_wtime();
        cout << "Data mean: " << dataTemp[0].re << endl;
        cout << "Transformation took " << 1e6*(tEnd - tStart)/fftNumber << " us" << endl;



        fftwf_complex *data_fftw_in = (fftwf_complex*)dataTemp,
                      *data_fftw_out = data_fftw_in;
        fftwf_plan p;
        cout << "Preparing transform...";
        tStart = omp_get_wtime();
        p = fftwf_plan_dft_1d(fftSize, data_fftw_in, data_fftw_out, FFTW_FORWARD, FFTW_ESTIMATE);
        tEnd = omp_get_wtime();
        cout << " Done in " << 1e6*(tEnd - tStart) << " us" << endl;
        memcpy(data_fftw_in, data, maxMemoryLimit * sizeof(Complex<T>));
        cout << "Testing FFTW..." << endl;
        tStart = omp_get_wtime();
        for (int i = 0; i < fftNumber; i++)
        {
            fftwf_execute_dft(p, &data_fftw_in[i * fftSize], &data_fftw_out[i * fftSize]);
        }
        tEnd = omp_get_wtime();
        cout << "Data mean: " << data_fftw_out[0][0] << endl;
        cout << "Transformation took " << 1e6*(tEnd - tStart)/fftNumber << " us" << endl;
        cout << "------------------------------------------" << endl;
        fftwf_destroy_plan(p);

    }
}

template <class T>
void testFFT_2()
{
    cout << "Preparing data..." << endl;
    FFTransformerRecursive<T> FFT(FFT_SIZE, 1);
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
    FFTransformerVec<float> fft(N, 1);
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
    getchar();
    return 0;
}
