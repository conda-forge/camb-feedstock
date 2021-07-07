#!/bin/bash

if [[ `uname` == "Linux" ]] && [[ "${GFORTRAN}" != "gfortran" ]]; then
    ln -s ${GFORTRAN} ${BUILD_PREFIX}/bin/gfortran
fi

rm -rf forutils

gfortran -dumpversion

${PYTHON} setup.py build_cluster

${PYTHON} -m pip install . -vv --no-deps --install-option="--skip-build"
