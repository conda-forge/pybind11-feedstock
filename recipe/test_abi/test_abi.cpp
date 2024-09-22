// Dummy module used only to print the PYBIND11_INTERNALS_VERSION version
// during the compilation process
#include <pybind11/detail/internals.h>

#define STRINGIFY(x) #x
#define TO_STRING(x) STRINGIFY(x)

#if defined(_MSC_VER)
    // MSVC specific pragma
    #pragma message ("PYBIND11_INTERNALS_VERSION=" TO_STRING(PYBIND11_INTERNALS_VERSION))
#else
    #pragma message "PYBIND11_INTERNALS_VERSION=" TO_STRING(PYBIND11_INTERNALS_VERSION)
#endif

// The rest is just a copy of https://github.com/pybind/cmake_example/blob/7a94877f581a14de4de1a096fb053a55fc2a66bf/src/main.cpp
// to get a valid pybind11 module

#include <pybind11/pybind11.h>

int add(int i, int j) {
    return i + j;
}

namespace py = pybind11;

PYBIND11_MODULE(cmake_example, m) {
    m.def("add", &add, R"pbdoc(
        Add two numbers

        Some other explanation about the add function.
    )pbdoc");
}
