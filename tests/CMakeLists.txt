# CMake for culibtest test suite 

# Set the minimum cmake version to that which supports cuda natively.
cmake_minimum_required(VERSION VERSION 3.8 FATAL_ERROR)

# Name the project and set languages
project(tests CUDA CXX)

# Include common rules.
include(${CMAKE_CURRENT_SOURCE_DIR}/../cmake/common.cmake)

# Tests require boost
find_package(Boost 1.56 REQUIRED)


# Define output location of binary files
SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${tests_SOURCE_DIR}/bin/${CMAKE_BUILD_TYPE}/)

# Define which source files are required for the target executable
add_executable(tests 
    ${CMAKE_CURRENT_SOURCE_DIR}/test_all.cu
)

# Enable RDC
set_property(TARGET tests PROPERTY CUDA_SEPARABLE_COMPILATION ON)

# Define include dirs
target_include_directories(tests PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../include)
target_include_directories(tests PRIVATE ${Boost_INCLUDE_DIRS})

# Define link libraries for the target
target_link_libraries(tests culibtest)
