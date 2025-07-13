# Backup original pyproject.toml
cp ./pyproject.toml ./pyprojectpybind11.toml

# Create pyproject.toml for pybind11-global install
$PYTHON ./tools/make_global.py > ./pyprojectglobal.toml

# Build with generated pyprojectglobal.py
mv ./pyprojectglobal.toml ./pyproject.toml
# There are several required flags, like --no-deps, but conda-build nicely sets them for us
# https://github.com/conda/conda-build/blob/d75ef9c66dbcc832d8d96f33a2aecfe893266e8c/conda_build/build.py#L2517-L2527
$PYTHON -m pip install . -vv --no-build-isolation

# Restore original pyproject.toml
cp ./pyprojectpybind11.toml ./pyproject.toml

# Remove duplicated headers, see https://github.com/conda-forge/pybind11-feedstock/issues/107
rm -rf $PREFIX/include/python*/pybind11-global
