@echo off
echo Updating Repo...
call UpdateRepo.bat

echo Starting build...
call scons -j6 platform=windows target=release_debug use_mingw=yes


for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%"

set datestamp=%DD%-%MM%-%YYYY%
set timestamp=%HH%-%Min%
echo fullstamp: %datestamp%_%timestamp%
mkdir  D:\Programming\godot\Downlaods\FromSource\BUILDS\%datestamp%
copy D:\Programming\godot\Downlaods\FromSource\Myfork\bin\godot.windows.opt.tools.64.exe D:\Programming\godot\Downlaods\FromSource\BUILDS\%datestamp%\godette4.0-%timestamp%.exe

pause