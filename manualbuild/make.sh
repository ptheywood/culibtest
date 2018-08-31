#! /bin/bash

nvcc -gencode arch=compute_61,code=sm_61 -rdc=true -O3 -DNDEBUG -lineinfo -Xcompiler=-fPIC   -std=c++11 -I/home/ptheywood/code/ptheywood/culibtest/src/../include -dc /home/ptheywood/code/ptheywood/culibtest/src/culibtest/SomeClass.cu
nvcc -gencode arch=compute_61,code=sm_61 -lib SomeClass.o -o libculibtest.a


nvcc -gencode arch=compute_61,code=sm_61 -rdc=true -O3 -DNDEBUG -lineinfo -Xcompiler=-fPIE   -std=c++11 -I/home/ptheywood/code/ptheywood/culibtest/examples/helloWorld/../../include  -dc /home/ptheywood/code/ptheywood/culibtest/examples/helloWorld/src/main.cu

nvcc -gencode arch=compute_61,code=sm_61 -I/home/ptheywood/code/ptheywood/culibtest/src/../include -L. -lculibtest -dlink main.o -o main.link.o

g++ -L/usr/local/cuda/lib64 -L. main.o main.link.o -lcudadevrt -lcudart -lculibtest



# cd /home/ptheywood/code/ptheywood/culibtest/build/src && /usr/local/cuda-9.0/bin/nvcc   -I/home/ptheywood/code/ptheywood/culibtest/src/../include  -gencode arch=compute_61,code=sm_61 -gencode arch=compute_61,code=compute_61 -Xcompiler -Wall -rdc=true -O3 -DNDEBUG -lineinfo -Xcompiler=-fPIC   -std=c++11 -x cu -dc /home/ptheywood/code/ptheywood/culibtest/src/culibtest/SomeClass.cu -o CMakeFiles/culibtest.dir/culibtest/SomeClass.cu.o
# /usr/local/cuda-9.0/bin/nvcc     -gencode arch=compute_61,code=sm_61 -gencode arch=compute_61,code=compute_61 -Xcompiler -Wall -rdc=true -O3 -DNDEBUG -lineinfo -Xcompiler=-fPIC -Wno-deprecated-gpu-targets -shared -dlink CMakeFiles/culibtest.dir/culibtest/SomeClass.cu.o -o CMakeFiles/culibtest.dir/cmake_device_link.o 
# /usr/bin/ar qc ../../lib/Release/libculibtest.a  CMakeFiles/culibtest.dir/culibtest/SomeClass.cu.o
# /usr/bin/ar q  ../../lib/Release/libculibtest.a  CMakeFiles/culibtest.dir/cmake_device_link.o
# /usr/bin/ranlib ../../lib/Release/libculibtest.a
# cd /home/ptheywood/code/ptheywood/culibtest/build/examples/helloWorld && /usr/local/cuda-9.0/bin/nvcc   -I/home/ptheywood/code/ptheywood/culibtest/examples/helloWorld/../../include  -gencode arch=compute_61,code=sm_61 -gencode arch=compute_61,code=compute_61 -Xcompiler -Wall -rdc=true -O3 -DNDEBUG -lineinfo -Xcompiler=-fPIE   -std=c++11 -x cu -dc /home/ptheywood/code/ptheywood/culibtest/examples/helloWorld/src/main.cu -o CMakeFiles/helloWorld.dir/src/main.cu.o

# /usr/local/cuda-9.0/bin/nvcc    -gencode arch=compute_61,code=sm_61 -gencode arch=compute_61,code=compute_61 -Xcompiler -Wall -rdc=true -O3 -DNDEBUG -lineinfo  -Xcompiler=-fPIC -Wno-deprecated-gpu-targets -shared -dlink CMakeFiles/helloWorld.dir/src/main.cu.o -o CMakeFiles/helloWorld.dir/cmake_device_link.o 
