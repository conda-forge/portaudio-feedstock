#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* .
cp $BUILD_PREFIX/share/gnuconfig/config.* ./bindings/cpp/build/gnu

declare -a CONFIG_OPTS
CONFIG_OPTS+=(--prefix=${PREFIX})
CONFIG_OPTS+=(--with-pic)
if [[ -n "${CONDA_BUILD_SYSROOT}" ]]; then
  CONFIG_OPTS+=(--with-sysroot="${CONDA_BUILD_SYSROOT}")
fi
if [[ ${HOST} =~ .*darwin.* ]]; then
  # Overrides the sysroot with an old one.
  CONFIG_OPTS+=(--disable-mac-universal)
  export CFLAGS="${CFLAGS} -Wno-deprecated-declarations"
fi

./configure "${CONFIG_OPTS[@]}"
make -j$CPU_COUNT
make install -j$CPU_COUNT

if [[ ${HOST} =~ .*darwin.* ]]; then
  cp include/pa_mac_core.h ${PREFIX}/include
fi
