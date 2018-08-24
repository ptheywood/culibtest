#include <stdio.h>

#include <culibtest.h>

__device__ unsigned int(*someDeviceFunction_ptr)(unsigned int);
__device__ unsigned int someDeviceFunction(unsigned int N) {
	printf("someDeviceFunction\n");
	//unsigned int idx = threadIdx.x + blockDim.x * blockIdx.x;
	//return idx;
	return 1;
}



int main(int argc, char * argv[]){
	printf("helloWorld Example:\n");
	
	culibtest::SomeClass obj = culibtest::SomeClass();
	
	obj.sayHello();
	obj.setPrivateInt(12);
	printf("privateInt %u\n", obj.getPrivateInt());

	someDeviceFunction_ptr = &someDeviceFunction;
	printf("%p\n", someDeviceFunction_ptr);
	unsigned int sum = obj.launchRandomKernal(someDeviceFunction_ptr, 1024);

	printf("sum: %u\n", sum);
	
	
}
