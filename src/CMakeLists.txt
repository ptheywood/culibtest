cmake_minimum_required(VERSION VERSION 3.8 FATAL_ERROR)

project(culibtest CUDA CXX)

# Specify using C++11 standard
if(NOT DEFINED CMAKE_CXX_STANDARD)
    set(CMAKE_CXX_STANDARD 11)
    set(CMAKE_CXX_STANDARD_REQUIRED true)
endif()

# Tell CUDA to use C++11 standard
if(NOT DEFINED CMAKE_CUDA_STANDARD)
    set(CMAKE_CUDA_STANDARD 11)
    set(CMAKE_CUDA_STANDARD_REQUIRED True)
endif()

set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -gencode arch=compute_30,code=sm_30 -gencode arch=compute_35,code=sm_35 -gencode arch=compute_37,code=sm_37 -gencode arch=compute_50,code=sm_50 -gencode arch=compute_52,code=sm_52 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_61,code=sm_61 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_70,code=compute_70")

add_library(culibtest STATIC 
    ${CMAKE_CURRENT_SOURCE_DIR}/culibtest/SomeClass.cu
)
target_include_directories(culibtest PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../include)
set_property(TARGET culibtest PROPERTY CUDA_SEPARABLE_COMPILATION ON)
