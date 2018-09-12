// Definitions class, for macros and so on.

#pragma once

// If we are on windows
#if defined(_WIN32) || defined(_MSC_VER)

	// If building the library, 
	#if defined(CULIBTEST_DLL) // libculibtest
		//#define CULIBTEST_API __declspec(dllexport)
	#else 
		//#define CULIBTEST_API __declspec(dllimport)
	#endif

// Otherwise if not windows
#else 

	// Define the API macro as default visibility
	// #define CULIBTEST_API __attribute__((visibility("default")))

#endif

#define CULIBTEST_API
