cd test_abi

REM Cleanup the build folder
rmdir /s /q build
if errorlevel 1 exit 1

REM Configure the project
cmake -GNinja -S. -Bbuild -DCMAKE_BUILD_TYPE=Release
if errorlevel 1 exit 1

REM Build the project and extract the line with PYBIND11_INTERNALS_VERSION=
for /F "tokens=*" %%i in ('cmake --build build ^| findstr /R /C:"^PYBIND11_INTERNALS_VERSION="') do set "line=%%i"
if errorlevel 1 exit 1

REM Extract the value after the equals sign in the line PYBIND11_INTERNALS_VERSION=
for /F "tokens=2 delims==" %%a in ("%line%") do set "version=%%a"

REM Compare to the environment variable EXPECTED_PYBIND11_INTERNALS_VERSION
if "%version%"=="%EXPECTED_PYBIND11_INTERNALS_VERSION%" (
    echo Versions match, compilation: "%version%" expected: "%EXPECTED_PYBIND11_INTERNALS_VERSION%"
) else (
    echo Error: PYBIND11_INTERNALS_VERSION version mismatch, compilation: "%version%" expected: "%EXPECTED_PYBIND11_INTERNALS_VERSION%"
    exit 1
)
