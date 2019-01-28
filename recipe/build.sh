#!/bin/bash

export LDFLAGS="${LDFLAGS} -L${PREFIX}/lib"
export CFLAGS="${CFLAGS} -I${PREFIX}/include -fPIC"
export CPPFLAGS="${CPPFLAGS} -I${PREFIX}/include"
export CXXFLAGS="${CXXFLAGS} -I${PREFIX}/include"

echo "C compiler: ${CC}"
echo "C++ compiler: ${CXX}"

./configure --prefix="${PREFIX}" CC="${CC}" CXX="${CXX}"

make -j$CPU_COUNT
make tests -j$CPU_COUNT
make install -j$CPU_COUNT

cd $PREFIX
find . -type f -name "*.la" -exec rm -rf '{}' \; -print
