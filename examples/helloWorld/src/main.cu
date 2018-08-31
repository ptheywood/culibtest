#include <stdio.h>

#include <culibtest.h>

typedef unsigned int(*dfuncptr)(unsigned int);

// __constant__ unsigned int d_twelve = 0;

__device__ unsigned int someDeviceFunction(unsigned int N) {
	// printf("someDeviceFunction\n");
	//unsigned int idx = threadIdx.x + blockDim.x * blockIdx.x;
	//return idx;
	return d_twelve;
	// return 1;
}

__device__ dfuncptr someDeviceFunction_ptr = someDeviceFunction;



int main(int argc, char * argv[]){
	cudaError_t status = cudaSuccess;
	printf("helloWorld Example:\n");

	
	culibtest::SomeClass obj = culibtest::SomeClass();
	
	obj.sayHello();
	obj.setPrivateInt(12);
	printf("privateInt %u\n", obj.getPrivateInt());

	//someDeviceFunction_ptr = &someDeviceFunction; // bad
	dfuncptr h_someDeviceFunction_ptr;
	status = cudaMemcpyFromSymbol(&h_someDeviceFunction_ptr, someDeviceFunction_ptr, sizeof(dfuncptr));
	if (status != cudaSuccess) {
		printf("Error, could not get devidce pointer.\n");
		return 1;
	}

	printf("%p\n", h_someDeviceFunction_ptr);
	unsigned int sum = obj.launchRandomKernal(h_someDeviceFunction_ptr, 1024);

	status = cudaDeviceSynchronize();
	if (cudaSuccess != status) {
		printf("cuda error %s:%d!\n\t%d:%s\n", __FILE__, __LINE__, status, cudaGetErrorString(status));
	}
	status = cudaGetLastError();
	if (cudaSuccess != status) {
		printf("cuda error %s:%d!\n\t%d:%s\n", __FILE__, __LINE__, status, cudaGetErrorString(status));
	}

	printf("sum: %u\n", sum);


	unsigned int l_twelve = 0;
	status = cudaMemcpyFromSymbol(&l_twelve, d_twelve, sizeof(unsigned int));
	if (cudaSuccess != status) {
		printf("cuda error %s:%d!\n\t%d:%s\n", __FILE__, __LINE__, status, cudaGetErrorString(status));
	}
	printf("l_twelve %u\n", l_twelve);
	
	
}
