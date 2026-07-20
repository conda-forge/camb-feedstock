#!/bin/bash

# The GitHub source archive doesn't include the forutils git submodule, and setup.py's
# own CONDA_BUILD default tag is stale until the next CAMB release; pin explicitly.
export FORUTILSBRANCH=1.1.0

if [[ `uname` == "Linux" ]] && [[ "${GFORTRAN}" != "gfortran" ]]; then
    ln -s ${GFORTRAN} ${BUILD_PREFIX}/bin/gfortran
fi

rm -rf forutils

if [[ ${target_platform} == "osx-arm64" ]] || [[ ${target_platform} == "osx-64" ]]; then
    # help it find the right compiler
    export F90C=${F90}
    rm -f ${BUILD_PREFIX}/bin/gfortran
    ln -s ${F90} ${BUILD_PREFIX}/bin/gfortran
fi

${PYTHON} setup.py build_cluster

${PYTHON} -m pip install . -vv --no-deps --config-setting="--build-option=--skip-build"
