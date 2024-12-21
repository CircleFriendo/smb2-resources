@echo off
echo Apply xkas patch
echo xkas-plus: https://github.com/devinacker/xkas-plus
set /p patch="Enter patch name: "
set /p rom="Enter ROM name: "
set dirxkas=%~dp0
for %%a in (%patch%) do ( set dirpatch=%%~dpa )
cd %dirpatch%
"%dirxkas%xkas.exe" -o %rom% %patch%
pause