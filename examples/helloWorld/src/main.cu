#include <stdio.h>

#include <culibtest.h>

typedef unsigned int(*dfuncptr)(unsigned int);


__device__ unsigned int someDeviceFunction(unsigned int N) {
	printf("someDeviceFunction\n");
	//unsigned int idx = threadIdx.x + blockDim.x * blockIdx.x;
	//return idx;
	return 1;
}

__device__ dfuncptr someDeviceFunction_ptr = someDeviceFunction;



int main(int argc, char * argv[]){
	printf("helloWorld Example:\n");
	
	culibtest::SomeClass obj = culibtest::SomeClass();
	
	obj.sayHello();
	obj.setPrivateInt(12);
	printf("privateInt %u\n", obj.getPrivateInt());



	//someDeviceFunction_ptr = &someDeviceFunction; // bad
	dfuncptr h_someDeviceFunction_ptr;
	cudaError_t status = cudaSuccess;
	status = cudaMemcpyFromSymbol(&h_someDeviceFunction_ptr, someDeviceFunction_ptr, sizeof(dfuncptr));
	if (status != cudaSuccess) {
		printf("Error, could not get devidce pointer.\n");
		return 1;
	}

	printf("%p, %p\n", someDeviceFunction_ptr, h_someDeviceFunction_ptr);
	unsigned int sum = obj.launchRandomKernal(h_someDeviceFunction_ptr, 1024);

	printf("sum: %u\n", sum);
	
	
}
