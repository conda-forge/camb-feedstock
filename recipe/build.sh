#!/bin/bash

if [[ `uname` == "Linux" ]] && [[ "${GFORTRAN}" != "gfortran" ]]; then
    ln -s ${GFORTRAN} ${BUILD_PREFIX}/bin/gfortran
fi

EXTRA_FFLAGS=-ffast-math make camb

make clean

cd pycamb
python setup.py build
