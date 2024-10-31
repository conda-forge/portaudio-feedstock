cmake %CMAKE_ARGS% -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DPA_LIBNAME_ADD_SUFFIX:BOOL=OFF ^
      -DPA_BUILD_STATIC:BOOL=OFF ^
      .
if errorlevel 1 exit 1

cmake --build . --config Release
if errorlevel 1 exit 1

cmake --install . --config Release
if errorlevel 1 exit 1
