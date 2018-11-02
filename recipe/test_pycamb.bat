set CHERE_INVOKING=1
bash -lc "./test_pycamb.sh"
if errorlevel 1 exit 1
exit 0
