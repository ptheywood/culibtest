# Cuda Dynamic Lib Test

This repo is a simple test for creating a CUDA dynamic library, with one (or more) example use of the dynamic library, and a (mock) test suite.


## Building with Cmake

Do an out of tree build.

```
    mkdir build && cd build
    cmake ..
    make
```

### Specifying Device architectures

Specifying non-default device archtectures using `-DSMS`. The following examples enables SM_61 and SM_70.

```
    cmake .. -DSMS="61;70"
```

As this value is cached by cmake, if you wish to revert to the default values, specify no argument. I.e. 

```
    cmake .. -DSMS=
```

### Build mode

Different modes can be build by passing the relevant flags. i.e. for a `debug` build:

```
    cmake .. -DCMAKE_BUILD_TYPE=Debug
```

possible options: 
+ `Release` (default)
+ `Debug`
+ `Profile`



## Building with visual studio

1. Open the visual studio solution file `culibtest.sln`
2. Build the desired executables/shared library files
3. Run the relevant code

## Generating visual studio project files via cmake

Via a bash prompt, with relevant path variables set (cl.exe, rc.exe, nvcc.exe must all be on your path).



```
mkdir build && cd build
cmake .. -A x64

```

Currently this has several issuse:

1. `-rdc=true` is specified both as a cuda command line option **and** as the ticked box in the visual studio project files, causing an nvcc error. 
2. culibtest.lib is not placed in the correct directory, but rather within the build directory, so subsequent links fail. The choice of paths between generators and makefile based scripts does seem to differ unfortunately.


