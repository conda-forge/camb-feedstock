copy "%RECIPE_DIR%\params.ini" .
copy "%SRC_DIR%\camb" .
copy "%RECIPE_DIR%\test_camb.sh" .
copy "%SRC_DIR%\HighLExtrapTemplate_lenspotentialCls.dat" .
set CHERE_INVOKING=1
bash -lc "./test_camb.sh"
if errorlevel 1 exit 1
exit 0
