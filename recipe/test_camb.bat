copy "%RECIPE_DIR%\test_camb.sh" .
set CHERE_INVOKING=1
bash -lc "./test_camb.sh"
if errorlevel 1 exit 1
exit 0
