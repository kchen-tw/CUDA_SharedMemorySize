#include <iostream>
#include <cuda_runtime.h>

using namespace std;

__global__ void kernel() {
    // 這是一個簡單的 CUDA 核心，可以是你的實際計算
}

int main() {
    int sharedMemorySize;
    
    cudaDeviceGetAttribute(&sharedMemorySize, cudaDevAttrMaxSharedMemoryPerBlock, 0);

    cout << "Maximum shared memory size per block: " << sharedMemorySize << " bytes" << endl;

    int device;
    cudaGetDevice(&device);

    int blockSize, minGridSize, gridSize;
    cudaOccupancyMaxPotentialBlockSize(&minGridSize, &blockSize, kernel, 0, 0);

    int maxThreadsPerBlock;
    cudaDeviceGetAttribute(&maxThreadsPerBlock, cudaDevAttrMaxThreadsPerBlock, device);

    // 現在，你可以使用 minGridSize 和 blockSize 來計算 gridSize
    gridSize = (1 + (minGridSize - 1) / blockSize);

    cout << "Device: " << device << endl;
    cout << "Max Threads Per Block :" << maxThreadsPerBlock << endl;
    cout << "Maximum potential block size: " << blockSize << endl;
    cout << "Minimum grid size: " << minGridSize << endl;
    cout << "Computed grid size: " << gridSize << endl;


    return 0;
}