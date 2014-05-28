@echo off
setlocal EnableDelayedExpansion
rem ***********************************************************************
rem  This bat file creates a run environment for mod2smp.exe
rem  See README.md for more deails
rem 
rem Author: Sholto Maud
rem Email: sholto.maud@gmail.com
rem Mobile: 0424094227
rem Date: 19-05-2014
rem 
rem ***********************************************************************

rem Get the array file folder and output directory from user
echo GW Modelling batch file
echo.
echo What is the full path for the output folder? 
echo (e.g. C:\temp\mod_output):
set /p output_dir=Output folder: 

rem Import configuration settings from config.json
for /f "tokens=1,2 delims=:, " %%a in (' find ":" ^< "config.json" ') do (
   set "%%~a=%%~b"
)

rem Normalise startTime, change delimiter from "_"  to ":" 
set startTime=%startTime:_=:%

rem File counter for Array Files
set arrayFileCount=0

rem Get the number of files. Not required 
rem for /f %%A in ('dir ^| find "File(s)"') do set cnt=%%A

rem Setup debug file
rem echo array_files %array_files% > debug.txt

rem Comment this out for production
rem set array_files=C:\Dev\batch_files\array_files
rem echo array_files %array_files% >> debug.txt

for /f %%f in ('dir /b %head1%.*') do (
  rem Increment file_count by 1
  set /a arrayFileCount+=1
  set arrayFile=%%f
  
  rem Get file name and folder from full file path 
  for %%A in ("%%f") do (
    set Folder=%%~dpA
    set FileName=%%~nxA
  )
  
  rem set inFile=%output_dir%\MOD2SMP_ !arrayFileCount! .in
  
  rem Normalise filename to sub periods for underscore & create inFile name and outFile name
  set FileName=!FileName:.=_!
  set inFile=!FileName!.in
  set outFile=!FileName!.txt
  
  rem Bit of debugging. 
  rem echo file %%f arrayFileCount [!arrayFileCount!] inFile [!inFile!] outFile [!outFile!] >> debug.txt
  
  rem Write parameter to IN file
  echo !arrayFile! >> %output_dir%\!inFile!
  echo !outFile! >> %output_dir%\!inFile! 
  
)

rem dir C:\Dev\batch_files\array_files\* /b /s >> test.txt rem MOD2SMP_B1HDS.in
echo.
echo Batch file and IN files created in [%output_dir%] 
pause




