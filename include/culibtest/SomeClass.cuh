// Example class which belongs to the culibtest shared library. Should do some pointless cuda stuff really. 

#pragma once

#include <culibtest/defines.h>

#include <cuda_runtime.h>

extern __constant__ unsigned int d_twelve;
extern unsigned int h_twelve;

namespace culibtest {
	
	// Forward declare the class, which is publically visible
	class CULIBTEST_API SomeClass {
		private:
			unsigned int privateInt;
		public:
			unsigned int publicInt;
			
			SomeClass();
			~SomeClass();
			
			bool sayHello();
			unsigned int getPrivateInt();
			bool setPrivateInt(unsigned int value);

			unsigned int launchRandomKernal(unsigned int(*device_function_ptr)(unsigned int), const unsigned int N);
	};

	
	__global__ void simple_kernal(unsigned int(*device_function_ptr)(unsigned int), unsigned int N, unsigned int * d_indices);
	
}
