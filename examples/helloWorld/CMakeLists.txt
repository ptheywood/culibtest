# CMake for helloWorld culibtest example project

# Set the minimum cmake version to that which supports cuda natively.
cmake_minimum_required(VERSION VERSION 3.8 FATAL_ERROR)

# Name the project and set languages
project(helloWorld CUDA CXX)

# Include common rules.
include(${CMAKE_CURRENT_SOURCE_DIR}/../../cmake/common.cmake)

# Define output location of binary files
SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${helloWorld_SOURCE_DIR}/bin/${CMAKE_BUILD_TYPE}/)

# Define which source files are required for the target executable
add_executable(helloWorld 
    ${CMAKE_CURRENT_SOURCE_DIR}/src/main.cu
)

# Enable RDC
set_property(TARGET helloWorld PROPERTY CUDA_SEPARABLE_COMPILATION ON)

# Define include dirs
target_include_directories(helloWorld PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../../include)

# Add link libraries location
# link_directories(${CMAKE_CURRENT_SOURCE_DIR}/../../lib/${CMAKE_BUILD_TYPE})

# Define link libraries for the target
# target_link_libraries(helloWorld culibtest)
target_link_libraries(helloWorld ${CMAKE_CURRENT_SOURCE_DIR}/../../lib/${CMAKE_BUILD_TYPE}/libculibtest.so)
