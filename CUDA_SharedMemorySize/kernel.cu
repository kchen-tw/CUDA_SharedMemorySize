#include <iostream>
#include <cuda_runtime.h>

int main() {
    int sharedMemorySize;
    cudaDeviceGetAttribute(&sharedMemorySize, cudaDevAttrMaxSharedMemoryPerBlock, 0);

    std::cout << "Maximum shared memory size per block: " << sharedMemorySize << " bytes" << std::endl;

    return 0;
}