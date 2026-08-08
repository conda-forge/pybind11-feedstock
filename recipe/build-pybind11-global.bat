:: Backup original pyproject.toml
copy /Y pyproject.toml pyprojectpybind11.toml
if errorlevel 1 exit 1

:: Create pyproject.toml for pybind11-global install
%PYTHON% tools\make_global.py > pyprojectglobal.toml
if errorlevel 1 exit 1

:: Build with generated pyprojectglobal.toml
move /Y pyprojectglobal.toml pyproject.toml
:: There are several required flags, like --no-deps, but conda-build nicely sets them for us
:: https://github.com/conda/conda-build/blob/d75ef9c66dbcc832d8d96f33a2aecfe893266e8c/conda_build/build.py#L2517-L2527
%PYTHON% -m pip install . -vv --no-build-isolation --config-settings=wheel.install-dir=/data/Library
if errorlevel 1 exit 1

:: Restore original pyproject.toml
copy /Y pyprojectpybind11.toml pyproject.toml
if errorlevel 1 exit 1

:: Remove duplicated headers, see https://github.com/conda-forge/pybind11-feedstock/issues/107
rmdir /s /q "%CONDA_PREFIX%\include\pybind11-global"
if errorlevel 1 exit 1
