# CMake for culibtest project

# Set the minimum cmake version to that which supports cuda natively.
cmake_minimum_required(VERSION VERSION 3.8 FATAL_ERROR)

# Name the project and set languages
project(culibtest CUDA CXX)

# Include common rules.
include(${CMAKE_CURRENT_SOURCE_DIR}/../cmake/common.cmake)


# Define output location of binary files
SET(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${culibtest_SOURCE_DIR}/../lib/${CMAKE_BUILD_TYPE}/)

# Define which source files are required for the target executable
add_library(culibtest STATIC
    ${CMAKE_CURRENT_SOURCE_DIR}/culibtest/SomeClass.cu
)

set_property(TARGET culibtest PROPERTY CUDA_RESOLVE_DEVICE_SYMBOLS ON)
# Enable RDC
set_property(TARGET culibtest PROPERTY CUDA_SEPARABLE_COMPILATION ON)
set_target_properties(culibtest PROPERTIES POSITION_INDEPENDENT_CODE ON)

# Define include dirs
target_include_directories(culibtest PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../include)
