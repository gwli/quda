BMDir=`pwd`/..
cd $BMDir

#fix old mismatch version of automake
cd qmp
rm configure
rm aclocal.m4
aclocal
autoconf 

cd ..

mkdir qmp-build
cd qmp-build
CC=mpicc CXX=mpicxx CFLAGS="-std=gnu99" ../qmp/configure --prefix=$BMDir/qmp-install --with-qmp-comms-type=MPI --with-qmp-comms-cflags="" --with-qmp-comms-ldflags="" --with-qmp-comms-libs=""
make -j install


cd $BMDir
mkdir quda-build
cd   quda-build
export CFLAGS="-O3 -g -march=core2 -fargument-noalias-global -D_GNU_SOURCE"
export CXXFLAGS="-g -O3 -finline-limit=50000 -march=core2  -fargument-noalias-global -D_GNU_SOURCE " # We should probably fix the hardcoded core2
# Set $arch based on your GPU
# This example runs on a P100
export arch=52
cmake ../ -DQUDA_MPI=ON -DCMAKE_INSTALL_PREFIX=${BMDir}/quda-install -DQUDA_QMP=ON -DQUDA_QMPHOME=${BMDir}/qmp-install -DQUDA_GPU_ARCH=sm_$arch
make -j
