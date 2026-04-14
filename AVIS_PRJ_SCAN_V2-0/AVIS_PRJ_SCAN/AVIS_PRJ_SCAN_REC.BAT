@echo off
setlocal EnableExtensions EnableDelayedExpansion

:: ============================================================================
::  AVIS SOURCE SCANNER — RECURSIVE ROOT SCAN (OMITTING SPECIFIC DIR)
:: ============================================================================



:: OMIT THE DIRECTORY (Using the existing PROJECT_PATH)
set "OMIT_DIR=%PROJECT_ROOT%\%PRJ_APP_KEY%"

:: OUTPUT TARGET
set "LOG_DIR=%PROJECT_PATH%LOG"
set "output_file=%LOG_DIR%\AVIS_PRJ_SCAN.txt"

if not exist "%LOG_DIR%" mkdir "%LOG_DIR%"
if exist "%output_file%" del "%output_file%"

set EXT_LIST=*.c *.h *.cpp *.hpp *.cc *.hh *.cxx *.hxx *.asm *.s *.js *.mjs *.cjs *.ts *.tsx *.py *.java *.rs *.go *.sh *.bat *.cmd *.ini *.cfg *.conf *.json *.toml *.yaml *.yml *.mk *.cmake *.idl *.inc

pushd "%PROJECT_ROOT%" || (echo [AVIS] ERROR: FAILED TO ENTER ROOT DIRECTORY & pause & exit /b 1)

:: --- STEP 1: ACCURATE FILE DISCOVERY (EXCLUDING OMIT_DIR) ---
echo [AVIS] CALCULATING TOTAL FILES...
set "total_files=0"
for /f "delims=" %%f in ('dir /b /s %EXT_LIST% 2^>nul ^| findstr /V /I /C:"%OMIT_DIR%"') do (
    set /a total_files+=1
)

echo [AVIS] SCANNING %total_files% FILES...
echo.

:: --- STEP 2: PROCESSING WITH PROGRESS BAR ---
set "current_count=0"
for /f "delims=" %%f in ('dir /b /s %EXT_LIST% 2^>nul ^| findstr /V /I /C:"%OMIT_DIR%"') do (
    if exist "%%f" (
        echo --- File: %%f --- >> "%output_file%"
        type "%%f" >> "%output_file%"
        echo. >> "%output_file%"
        echo. >> "%output_file%"

        :: Update Progress
        set /a current_count+=1
        set /a "percentage=(current_count * 100) / total_files"
        set /a "bar_filled=percentage / 4"
        set /a "bar_empty=25 - bar_filled"
        
        set "bar=["
        for /L %%i in (1,1,!bar_filled!) do set "bar=!bar!#"
        if !bar_empty! GTR 0 (
            for /L %%i in (1,1,!bar_empty!) do set "bar=!bar! "
        )
        set "bar=!bar!]"

        :: VT100: [1G (Start of line), [K (Clear to end of line)
        <nul set /p "=[1G[K!bar! !percentage!%% (!current_count!/%total_files%)"
    )
)

echo.
echo.
popd

echo [AVIS] SCAN COMPLETE
echo [AVIS] Output saved to: %output_file%
echo.

:: ============================================================================
::  EXPORT BACK TO CALLER — PRJ_APP_KEY OMITTED
:: ============================================================================
endlocal ^
    & set "AVIS_OMIT_KEYDIR_AND_BUILD=%AVIS_OMIT_KEYDIR_AND_BUILD%" ^
    & set "AVIS_OMIT_KEYDIR=%AVIS_OMIT_KEYDIR%" ^
    & set "PRJ_DRV_KEY=%PRJ_DRV_KEY%" ^
    & set "PRJ_DIR_KEY=%PRJ_DIR_KEY%" ^
    & set "PRJ_ROOT_KEY=%PRJ_ROOT_KEY%" ^
    & set "REMDRV=%REMDRV%" ^
    & set "PROJECT_ROOT=%PROJECT_ROOT%" ^
    & set "PROJECT_APPROOT=%PROJECT_APPROOT%" ^
    & set "CONFIG_FILE=%CONFIG_FILE%" ^
    & set "LOG_FILE=%LOG_FILE%" ^
    & set "PROJECT_PATH=%PROJECT_PATH%" ^
    & set "PROJ_PATH=%PROJ_PATH%" ^
    & set "LOG_PATH=%LOG_PATH%" ^
    & set "LOG_AI=%LOG_AI%"

exit /b 0
