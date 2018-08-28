#pragma once

#include <culibtest/SomeClass.h>

BOOST_AUTO_TEST_SUITE(ModelDescTest) //name of the test suite is modelDescTest

BOOST_AUTO_TEST_CASE(sayHelloCheck)
{
	BOOST_TEST_MESSAGE("\nTesting SomeClass::sayHello\n");
	culibtest::SomeClass instance = culibtest::SomeClass();
	BOOST_CHECK(instance.sayHello() == true);
}

BOOST_AUTO_TEST_CASE(getPrivateIntCheck)
{
	BOOST_TEST_MESSAGE("\nTesting SomeClass::getPrivateInt\n");
	const unsigned int expected = 0;
	culibtest::SomeClass instance = culibtest::SomeClass();
	BOOST_CHECK(instance.getPrivateInt() == expected);
}

BOOST_AUTO_TEST_CASE(setPrivateIntCheck)
{
	BOOST_TEST_MESSAGE("\nTesting SomeClass::setPrivateInt\n");
	const unsigned int newValue = 12;
	culibtest::SomeClass instance = culibtest::SomeClass();

	instance.setPrivateInt(newValue);
	BOOST_CHECK(instance.getPrivateInt() == newValue);
}

typedef unsigned int(*dfuncptr)(unsigned int);

__device__ unsigned int someDeviceFunction(unsigned int N) {
	return 1;
}
__device__ dfuncptr someDeviceFunction_ptr = someDeviceFunction;


BOOST_AUTO_TEST_CASE(launchRandomKernalCheck1024)
{
	BOOST_TEST_MESSAGE("\nTesting SomeClass::launchRandomKernal\n");
	const unsigned int threads = 1024;
	const unsigned int expectedAnswer = 1024;

	dfuncptr h_deviceFunctionPointer = nullptr;
	cudaMemcpyFromSymbol(&h_deviceFunctionPointer, someDeviceFunction_ptr, sizeof(dfuncptr));

	culibtest::SomeClass instance = culibtest::SomeClass();
	unsigned int sum = instance.launchRandomKernal(h_deviceFunctionPointer, threads);

	BOOST_CHECK( sum == expectedAnswer);
}

__device__ unsigned int triangularNumberFunc(unsigned int N) {
	unsigned int idx = threadIdx.x + blockDim.x * blockIdx.x;
	return idx + 1;
}
__device__ dfuncptr triangularNumberFunc_ptr = triangularNumberFunc;


BOOST_AUTO_TEST_CASE(triangularNumberKernalCheck1024)
{
	BOOST_TEST_MESSAGE("\nTesting SomeClass::launchRandomKernal with traingular number\n");
	const unsigned int threads = 1024;
	const unsigned int expectedAnswer = 524800; // 1024th trianular number

	dfuncptr h_deviceFunctionPointer = nullptr;
	cudaMemcpyFromSymbol(&h_deviceFunctionPointer, triangularNumberFunc_ptr, sizeof(dfuncptr));



	culibtest::SomeClass instance = culibtest::SomeClass();
	unsigned int sum = instance.launchRandomKernal(h_deviceFunctionPointer, threads);

	BOOST_CHECK(sum == expectedAnswer);
}


BOOST_AUTO_TEST_SUITE_END()
