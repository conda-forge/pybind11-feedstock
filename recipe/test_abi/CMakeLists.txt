cmake_minimum_required (VERSION 3.25)

project(pybind11testabi)

find_package(pybind11 REQUIRED)

pybind11_add_module(test_abi_module test_abi.cpp)
