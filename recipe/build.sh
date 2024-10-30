#!/bin/sh

mkdir build && cd build

cmake ${CMAKE_ARGS} -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DBUILD_SHARED_LIBS=ON \
      -DPA_LIBNAME_ADD_SUFFIX:BOOL=OFF \
      -DPA_BUILD_STATIC:BOOL=OFF \
      $SRC_DIR

make -j${CPU_COUNT}
make install
