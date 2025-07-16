#!/usr/bin/env python3

import re
import sys
import argparse
from pathlib import Path

INTERNALS = re.compile(r"#\s*define\s+PYBIND11_INTERNALS_VERSION\s+(\d+)")


def check_abi(abi_version: str) -> None:
    text = Path("include/pybind11/detail/internals.h").read_text()
    mat = INTERNALS.search(text)

    if not mat:
        print("Could not find PYBIND11_INTERNALS_VERSION!", file=sys.stderr)
        raise SystemExit(1)

    found = mat.group(1)
    if found != abi_version:
        print(
            f"ABI version mismatch: found {found}, expected {abi_version}",
            file=sys.stderr,
        )
        sys.exit(2)

    print("ABI matched!", file=sys.stderr)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("abi_version", help="Expected ABI version")
    args = parser.parse_args()

    check_abi(args.abi_version)
