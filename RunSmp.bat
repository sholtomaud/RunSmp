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

rem run through the files matching head1 prefix
for %%f in (%head1%*) do (
  rem Increment file_count by 1
  
  set fullFileName=%%f
  set fileName=%%~nf
  set fileExt=%%~xf
  rem set fileNumber=!fileExt:.=_!
  echo fileName [!fileName!]
  
    
  for /F "tokens=5 delims=_" %%a in ("%%~nf") do (
    rem set "%%~a=%%~b"
    set fileNumber=%%a
  )
  rem echo fullFileName [!fullFileName!] 
  rem echo f [%%f] 
  rem echo fileNumber [!fileNumber!] 
  rem echo fileNumber [%fileNumber%] 
  rem echo fileExt [!fileExt!] 
   
  rem Write parameter to output file from config.json
  echo %head1%!fileNumber!.txt >> %output_dir%\%inFile%!fileNumber!.in
  echo %head2%!fileNumber!.txt >> %output_dir%\%inFile%!fileNumber!.in
  echo %outputFile%!fileNumber!.txt >> %output_dir%\%inFile%!fileNumber!.in
  
)

rem dir C:\Dev\batch_files\array_files\* /b /s >> test.txt rem MOD2SMP_B1HDS.in
echo.
echo Output files created in [%output_dir%] 
pause




