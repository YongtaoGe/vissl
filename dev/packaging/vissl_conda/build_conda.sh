#!/bin/bash
# Copyright (c) Facebook, Inc. and its affiliates. All rights reserved.
set -ex

packaging=dev/packaging/vissl_conda

mkdir -p "$packaging/out"

version=$(python -c "exec(open('vissl/__init__.py').read()); print(__version__)")
build_version=$version

export BUILD_VERSION=$build_version

# We allow the vissl channel to get the apex package.
# We specify it with a full url to avoid a name clash with a local directory called vissl.
conda build -c https://conda.anaconda.org/vissl -c iopath -c conda-forge -c pytorch -c defaults --no-anaconda-upload --python "$PYTHON_VERSION" --output-folder "$packaging/out" "$packaging/vissl"
