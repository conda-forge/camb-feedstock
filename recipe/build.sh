#!/bin/bash

EXTRA_FFLAGS=-ffast-math make camb

if [[ `uname` == "Linux" ]] && [[ "${GFORTRAN}" != "gfortran" ]]; then
    alias gfortran="${GFORTRAN}"
fi

make clean

cd pycamb
python setup.py build
