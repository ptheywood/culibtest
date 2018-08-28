cmake_minimum_required(VERSION VERSION 3.8 FATAL_ERROR)

project(culibtest)

# Add the library building subdirectory
add_subdirectory(src) 

# Add the helloWorld example
add_subdirectory(examples/helloWorld)

# Add the tests directory (if required)

add_subdirectory(tests)
