#include <culibtest/SomeClass.h>
#include "../include/culibtest/SomeClass.h"
#include <stdio.h>
#include <cstdlib>
#include <cstring>

#include <cuda_runtime.h>

namespace culibtest {
	
	SomeClass::SomeClass() : 
		privateInt(0),
		publicInt(0)
	{
		
	}
	
	SomeClass::~SomeClass(){
		
	}
	
	bool SomeClass::sayHello(){
		printf("SomeClass says HelloWorld!\n");
		return true;
	}
	
	unsigned int SomeClass::getPrivateInt(){
		return this->privateInt;
	}
	
	bool SomeClass::setPrivateInt(unsigned int value){
		this->privateInt = value;
		return this->privateInt == value;
	}


	unsigned int SomeClass::launchRandomKernal(unsigned int(*device_function_ptr)(unsigned int), const unsigned int N) {
		cudaError_t status;


		unsigned int * h_values = (unsigned int *)std::malloc(N * sizeof(unsigned int));
		unsigned int * d_values = nullptr;
		status = cudaMalloc((void**)&d_values, N * sizeof(unsigned int));


		if (h_values == nullptr || d_values == nullptr) {
			free(h_values);
			cudaFree(d_values);
			return 0;
		}
		// Reset to 0
		std::memset(h_values, 0, N * sizeof(unsigned int));
		status = cudaMemset(d_values, 0, N * sizeof(unsigned int));

		// Calculate kernal launch parameters
		int minGridSize = 0;
		int blockSize = 0;
		int gridSize = 0;
		
		status = cudaOccupancyMaxPotentialBlockSize(&minGridSize, &blockSize,
			simple_kernal, 0, 0);
		gridSize = (N + blockSize - 1) / blockSize;


		// Call function
		simple_kernal << < gridSize, blockSize >> >(device_function_ptr, N, d_values);
		status = cudaDeviceSynchronize();
		status = cudaGetLastError();
		if (cudaSuccess != status) {
			printf("cuda error %s:%d!\n\t%d:%s\n", __FILE__, __LINE__, status, cudaGetErrorString(status));
		}


		// Copy data back to host.
		status = cudaMemcpy(h_values, d_values, N * sizeof(unsigned int), cudaMemcpyDeviceToHost);

		// Accumulate
		unsigned int sum = 0;
		for (unsigned int i = 0; i < N; i++) {
			sum += h_values[i];
		}

		// Free memory

		free(h_values);
		status = cudaFree(d_values);

		// Return the accumulated value.
		return sum;
	}

	// Not a class member
	__global__ void simple_kernal(unsigned int(*device_function_ptr)(unsigned int), unsigned int N, unsigned int * d_indices) {
		// Get global index
		unsigned int idx = threadIdx.x + blockDim.x * blockIdx.x;

		if (idx < N) {
			
			d_indices[idx] = device_function_ptr(N);
			if (idx < 16) {
				printf("tid %u: value %u\n", idx, d_indices[idx]);
			}
		}
	}
	
}
