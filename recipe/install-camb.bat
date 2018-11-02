copy "%RECIPE_DIR%\install-camb.sh" .
set CHERE_INVOKING=1
bash -lc "./install-camb.sh"
if errorlevel 1 exit 1
exit 0
