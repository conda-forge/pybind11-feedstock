# make sure the internals version matches the package version
set -e
grep "define PYBIND11_INTERNALS_VERSION $1" include/pybind11/detail/internals.h
