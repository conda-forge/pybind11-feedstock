cd test_abi

# Debug env variables
env

# Cleanup the build folder
rm -rf ./build

# Configure the project
cmake -GNinja -S. -Bbuild -DCMAKE_BUILD_TYPE=Release

# Build the project and extract the line with PYBIND11_INTERNALS_VERSION=
line=$(cmake --build build  | grep 'PYBIND11_INTERNALS_VERSION=')

# Check if the line was found
if [ -z "$line" ]; then
    echo "Error: PYBIND11_INTERNALS_VERSION not found."
    exit 1
fi

# Extract the value after the equals sign
version=${line#PYBIND11_INTERNALS_VERSION=}

# Compare to the environment variable EXPECTED_PYBIND11_INTERNALS_VERSION
if [ "$version" = "$EXPECTED_PYBIND11_INTERNALS_VERSION" ]; then
    echo "Versions match - compilation: $version expected: $EXPECTED_PYBIND11_INTERNALS_VERSION"
else
    echo "Error: Version mismatch - compilation: $version expected: $EXPECTED_PYBIND11_INTERNALS_VERSION"
    exit 1
fi
