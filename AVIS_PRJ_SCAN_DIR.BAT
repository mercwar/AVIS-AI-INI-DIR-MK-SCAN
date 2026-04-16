@echo off
setlocal EnableDelayedExpansion

set "ROOT=%~dp0"
set "OUT=%ROOT%AVIS_DIR_SCAN.LOG"

:: Safely generate a Carriage Return (CR) character
for /f %%a in ('copy /Z "%~dpf0" nul') do set "CR=%%a"
:: If copy /Z failed, this fallback creates it using a temporary certutil call
if "!CR!"=="" (
    for /f %%a in ('"prompt $H&for %%b in (1) do rem"') do set "CR=%%a"
)

echo Counting directories...
set "TOTAL=0"
for /f "delims=" %%D in ('dir "%ROOT%" /ad /b /s 2^>nul') do set /a TOTAL+=1

:: Prevent "Divide by Zero" crash if TOTAL is 0
if %TOTAL% EQU 0 (
    echo [ERROR] No directories found.
    exit /b
)

set "COUNT=0"
echo === DIRECTORY SCAN LOG === > "%OUT%"

for /f "delims=" %%D in ('dir "%ROOT%" /ad /b /s 2^>nul') do (
    set /a COUNT+=1
    
    :: Logic: PCT must be calculated before BARLEN to avoid errors
    set /a "PCT=(COUNT*100)/TOTAL"
    set /a "BARLEN=PCT/4"
    set /a "EMPTY=25-BARLEN"

    set "BAR=["
    for /L %%i in (1,1,!BARLEN!) do set "BAR=!BAR!#"
    if !EMPTY! GTR 0 (
        for /L %%i in (1,1,!EMPTY!) do set "BAR=!BAR! "
    )
    set "BAR=!BAR!]"

    :: Print progress and return cursor to start of line
    <nul set /p "=!BAR! !PCT!%% (!COUNT!/!TOTAL!)!CR!"

    echo %%D>>"%OUT%"
)

echo.
echo Scan complete.
pause

pause
