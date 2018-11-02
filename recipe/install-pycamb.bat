copy "%RECIPE_DIR%\install-pycamb.sh" .
set CHERE_INVOKING=1
bash -lc "./install-pycamb.sh"
if errorlevel 1 exit 1
exit 0
