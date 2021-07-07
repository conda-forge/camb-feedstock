#!/bin/bash

if [[ `uname` == "Linux" ]] && [[ "${GFORTRAN}" != "gfortran" ]]; then
    ln -s ${GFORTRAN} ${BUILD_PREFIX}/bin/gfortran
fi

rm -rf forutils

if [[ "$CONDA_BUILD_CROSS_COMPILATION" == "1" ]]; then
  # workaround until cross-python is fixed
  rm $BUILD_PREFIX/bin/python
  ln -sf $PREFIX/bin/python $BUILD_PREFIX/bin/python
fi

${PYTHON} setup.py build_cluster

${PYTHON} -m pip install . -vv --no-deps --install-option="--skip-build"
