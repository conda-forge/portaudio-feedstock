cmake -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DTARGET_POSTFIX= ^
      .
if errorlevel 1 exit 1

cmake --build . --target ALL_BUILD --config Release
if errorlevel 1 exit 1

copy /y Release\*.dll %LIBRARY_BIN%
copy /y Release\*.lib %LIBRARY_LIB%
copy /y include\*.h %LIBRARY_INC%
