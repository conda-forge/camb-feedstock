#!/bin/bash

if [[ `uname` == "Linux" ]] && [[ "${GFORTRAN}" != "gfortran" ]]; then
    ln -s ${GFORTRAN} ${BUILD_PREFIX}/bin/gfortran
fi

rm -rf forutils

if [[ ${target_platform} == "osx-arm64" ]]; then
    # help it find the right compiler
    export F90C=${F90}
    rm -f ${BUILD_PREFIX}/bin/gfortran
    ln -s ${F90} ${BUILD_PREFIX}/bin/gfortran
    
    # we download by hand so we can patch the makefile of the submodule
    ${PYTHON} -c "import setup, os; os.chdir('fortran'); setup.get_forutils()"
    cp ${RECIPE_DIR}/Makefile_compiler forutils/.
fi

${PYTHON} setup.py build_cluster

${PYTHON} -m pip install . -vv --no-deps --install-option="--skip-build"
