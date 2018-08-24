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


//BOOST_AUTO_TEST_CASE(launchRandomKernalCheck1024)
//{
//	BOOST_TEST_MESSAGE("\nTesting SomeClass::launchRandomKernal\n");
//	const unsigned int threads = 1024;
//	const unsigned int expectedAnswer = 524800;
//
//	culibtest::SomeClass instance = culibtest::SomeClass();
//
//	BOOST_CHECK(instance.launchRandomKernal(threads) == expectedAnswer);
//}


BOOST_AUTO_TEST_SUITE_END()
