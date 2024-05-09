@echo off
echo Apply xkas patch
echo xkas-plus: https://github.com/devinacker/xkas-plus
set /p patch="Enter patch name: "
set /p rom="Enter ROM name: "
xkas -o %rom% %patch%
pause