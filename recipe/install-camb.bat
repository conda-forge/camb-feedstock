copy "%RECIPE_DIR%\install-camb.sh" .
set CHERE_INVOKING=1
bash -lc "./install-camb.sh"

# doing a test here since conda-build doesn't test properly for windows
# even when using a script!
set CHERE_INVOKING=1
camb params.ini

if errorlevel 1 exit 1
exit 0
