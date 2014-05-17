#include <iostream>
#include <omp.h>
#include <cstdlib>

#include <Complex.h>
#include <FFTransformer.h>

using namespace std;

const int FFT_SIZE  = 1 << 12;
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

template <class T>
void testFFT()
{
    cout << "Preparing data..." << endl;
    FFTransformer<T> FFT(FFT_SIZE, 1);
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

int main()
{
    cout << "Testing float..." << endl;
    testFFT<float>();
    cout << "-----------------" << endl;
    cout << "Testing double..." << endl;
    testFFT<double>();
    cout << "-----------------" << endl;
    cout << "Testing long double..." << endl;
    testFFT<long double>();
    return 0;
}
