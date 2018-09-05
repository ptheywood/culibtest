cmake_minimum_required(VERSION VERSION 3.8 FATAL_ERROR)

project(culibtest)

# Use options to control what is being built, rather than trying to use child subdirectories independently?

option(BUILD_LIBRARY "Enable building culibtest library" ON)
option(BUILD_ALL_EXAMPLES "Enable building examples" ON)
option(BUILD_EXAMPLE_HELLOWORLD "Enable building helloWorld Example" OFF)
option(BUILD_EXAMPLE_NOWTHEN "Enable building nowThen example" OFF)
option(BUILD_TESTS "Enable building tests" OFF)


# Add the library building subdirectory
if(BUILD_LIBRARY)
    add_subdirectory(src) 
endif()
# Add the helloWorld example
if(BUILD_ALL_EXAMPLES OR BUILD_EXAMPLE_HELLOWORLD)
    add_subdirectory(examples/helloWorld)
endif()
# Add the nowThen example
if(BUILD_ALL_EXAMPLES OR BUILD_EXAMPLE_NOWTHEN)
    add_subdirectory(examples/nowThen)
endif()

# Add the tests directory (if required)
if(BUILD_TESTS)
    add_subdirectory(tests)
endif()
