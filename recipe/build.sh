#!/bin/bash

if [[ `uname` == "Linux" ]] && [[ "${GFORTRAN}" != "gfortran" ]]; then
    ln -s ${GFORTRAN} ${BUILD_PREFIX}/bin/gfortran
fi

rm -rf forutils

git clone --branch 1.0.3 --depth=1 https://github.com/cmbant/forutils
cp ${RECIPE_DIR}/Makefile_compiler forutils/.

${PYTHON} setup.py build_cluster

${PYTHON} -m pip install . -vv --no-deps --install-option="--skip-build"
