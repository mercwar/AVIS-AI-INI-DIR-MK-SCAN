@echo off
setlocal EnableExtensions EnableDelayedExpansion
:BEGINCVBGOD
set "CVBGOD_VERSION=2.0"
:: ============================================================================
:: AVIS PROJECT SCAN — CYBERNETIC SYSTEM BOOTSTRAP
:: ============================================================================
::  FFF • CVBGOD • MERCWAR • DEMONIZER • AVIS SHINE ARCHITECTURE
::  COPYRIGHT © 2026 — ALL RIGHTS RESERVED — UNAUTHORIZED USE PROHIBITED
:: ============================================================================

:: ============================================================
::  DYNAMIC INI IMPORT SYSTEM — [UMSK] VARIABLE LOADER
:: ============================================================
set "INI_DIR=%~dp0AVIS_PRJ_SCAN"
set "INI_FILE=%INI_DIR%\AVIS_PRJ_SCAN.INI"

if not exist "%INI_FILE%" (
    echo [AVIS] CRITICAL ERROR: AVIS_PRJ_SCAN.INI NOT FOUND AT %INI_DIR%
    pause
    exit /b 1
)

set "current_section="

for /f "usebackq tokens=1,* delims==" %%A in ("%INI_FILE%") do (
    set "raw_key=%%A"
    set "raw_val=%%B"

    :: Identify [Section] headers
    echo !raw_key! | findstr /R "^\[.*\]" >nul
    if !errorlevel! equ 0 (
        set "temp_sec=!raw_key:~1!"
        set "current_section=!temp_sec:]=!"
    ) else (
        :: Process Keys: Filter comments (;) and handle the UMSK section
        if not "!raw_key:~0,1!"==";" if not "!raw_val!"=="" (
            :: Trim quotes and set variable
            set "clean_val=!raw_val:"=!"
            
            :: Load into global namespace if in UMSK or specifically handle mapping
            if /i "!current_section!"=="UMSK" (
                set "UMSK.!raw_key!=!clean_val!"
                :: Also set standard variable names for your export list
                set "!raw_key!=!clean_val!"
            )
        )
    )
)
:: ============================================================================
::  VALIDATE UMSK — ENSURE NO BLANKS
:: ============================================================================
set "INVALID_UMSK="
if not defined PRJ_DRV_KEY  set "INVALID_UMSK=1"
if not defined PRJ_DIR_KEY  set "INVALID_UMSK=1"
if not defined PRJ_ROOT_KEY set "INVALID_UMSK=1"
if not defined PRJ_APP_KEY  set "INVALID_UMSK=1"
:: Improved if/else syntax for readability
if defined INVALID_UMSK (goto ERRUMSK) else (goto foundUMSK)

:ERRUMSK
    :: ANSI INIT (Ensures !e! or %e% is available for colors)
    for /f %%A in ('echo prompt $E^| cmd') do set "e=%%A"
    chcp 65001 >nul

    title ROBO-KNIGHT / AVIS Intro Control
    cls

    :: TOP PADDING
    echo.
    echo.
    echo.

    :: =========================
    :: ROBO-KNIGHT BANNER
    :: =========================
    echo !e![38;5;39m
    echo        ██████╗  ██████╗ ██████╗  ██████╗       ██╗  ██╗███╗   ██╗██╗ ██████╗ ██╗  ██╗████████╗
    echo        ██╔══██╗██╔═══██╗██╔══██╗██╔═══██╗      ██║ ██╔╝████╗  ██║██║██╔════╝██║  ██║╚══██╔══╝
    echo        ██████╔╝██║   ██║██████╔╝██║   ██║      █████╔╝ ██╔██╗ ██║██║██║  ███╗███████║   ██║
    echo        ██╔══██╗██║   ██║██╔══██╗██║   ██║      ██╔═██╗ ██║╚██╗██║██║██║   ██║██╔══██║   ██║
    echo        ██║  ██║╚██████╔╝██████╔╝╚██████╔╝      ██║  ██╗██║ ╚████║██║╚██████╔╝██║  ██║   ██║
    echo        ╚═╝  ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝       ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝
    echo !e![0m

    echo.
    echo   !e![38;5;244m                [AVIS] INTRO / MUSIC CONTROL PANEL!e![0m
    echo   !e![38;5;214m                [AI] ROBO-KNIGHT STARTUP OPTIONS!e![0m
    echo.
    echo      [CVBGOD] [FFF] [DEMONIZER] [MERCWAR]   APPLICATION VERSION %CVBGOD_VERSION%
    echo.
    echo        * CHECK OUT THE NEW 'SCAN CREATE SOURCE' 
    echo        * UPLOAD YOUR PROJECT IN A TEXT FILE TO AI NOW^!
    echo   !e![38;5;239m----------------------------------------------------------------------------!e![0m
    echo.

    echo 			[AVIS] UMSK BLOCK IS NEW OR INCOMPLETE.
	echo.
    set /p "CHOICE=OPEN INI IN NOTEPAD TO BEGIN? (Y/N): "
    
    if /i "!CHOICE!"=="Y" (
        if exist "%INI_FILE%" (
            start notepad "%INI_FILE%"
        ) else (
            echo [AVIS] ERROR: %INI_FILE% not found.
            pause
        )
    )
    
    goto BEGINCVBGOD

:foundUMSK
:: Logic continues here if UMSK is valid...

:: ANSI INIT
for /f %%A in ('echo prompt $E^| cmd') do set "e=%%A"
chcp 65001 >nul

title ROBO-KNIGHT / AVIS Intro Control

set selection=1

:INTROMENU
cls

:: TOP PADDING
echo.
echo.
echo.



:: =========================
:: ROBO-KNIGHT BANNER
:: =========================
echo %e%[38;5;39m
echo        ██████╗  ██████╗ ██████╗  ██████╗       ██╗  ██╗███╗   ██╗██╗ ██████╗ ██╗  ██╗████████╗
echo        ██╔══██╗██╔═══██╗██╔══██╗██╔═══██╗      ██║ ██╔╝████╗  ██║██║██╔════╝██║  ██║╚══██╔══╝
echo        ██████╔╝██║   ██║██████╔╝██║   ██║      █████╔╝ ██╔██╗ ██║██║██║  ███╗███████║   ██║
echo        ██╔══██╗██║   ██║██╔══██╗██║   ██║      ██╔═██╗ ██║╚██╗██║██║██║   ██║██╔══██║   ██║
echo        ██║  ██║╚██████╔╝██████╔╝╚██████╔╝      ██║  ██╗██║ ╚████║██║╚██████╔╝██║  ██║   ██║
echo        ╚═╝  ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝       ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝
echo %e%[0m

echo.
echo   %e%[38;5;244m                [AVIS] INTRO / MUSIC CONTROL PANEL%e%[0m
echo   %e%[38;5;214m                [AI] ROBO-KNIGHT STARTUP OPTIONS%e%[0m
echo.
echo      [CVBGOD] [FFF] [DEMONIZER] [MERCWAR]   APPLICATION VERSION %CVBGOD_VERSION%
echo.
echo        * CHECK OUT THE NEW 'SCAN CREATE SOURCE' 
echo        * UPLOAD YOUR PROJECT IN A TEXT FILE TO AI NOW!
echo   %e%[38;5;239m----------------------------------------------------------------------------%e%[0m
echo.

:: =========================
:: MENU OPTIONS (PROTOCOL)
:: =========================

echo.
if "%selection%"=="1" (
    echo        %e%[93m^>  1. SKIP ALL FAST START %e%[0m
) else (
    echo                1. SKIP ALL FAST START
)

if "%selection%"=="2" (
    echo        %e%[93m^>  2. SKIP MUSIC %e%[0m
) else (
    echo                2. SKIP MUSIC
)

if "%selection%"=="3" (
    echo        %e%[93m^>  3. SKIP INTRO VIDEO %e%[0m
) else (
    echo                3. SKIP INTRO VIDEO
)


if "%selection%"=="4" (
    echo        %e%[93m^>  4. PLAY INTRO VIDEO + MUSIC %e%[0m
) else (
    echo                4. PLAY INTRO VIDEO + MUSIC
)


if "%selection%"=="5" (
    echo        %e%[93m^>  5. EXIT %e%[0m
) else (
    echo                5. EXIT
)

echo.
echo   %e%[38;5;239m----------------------------------------------------------------------------%e%[0m

:: =========================
:: KEY LISTENER
:: =========================
for /f "usebackq delims=" %%K in (`powershell -NoProfile -Command ^
  "$k = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');" ^
  "if ($k.VirtualKeyCode -eq 38) { '38' }" ^
  "elseif ($k.VirtualKeyCode -eq 40) { '40' }" ^
  "elseif ($k.VirtualKeyCode -eq 13) { '13' }"`) do (
    set "key=%%K"
)

set "KEY_CODE=%key%"

if "%KEY_CODE%"=="13" goto ROBO_ACTION

if "%KEY_CODE%"=="38" (
    set /a selection-=1
    if !selection! lss 1 set selection=5
    goto INTROMENU
)

if "%KEY_CODE%"=="40" (
    set /a selection+=1
    if !selection! gtr 5 set selection=4
    goto INTROMENU
)

goto INTROMENU


:: =========================
:: ACTION HANDLER
:: =========================
:ROBO_ACTION
cls

if "%selection%"=="5" exit /b

if "%selection%"=="1" (
    echo [ROBO-KNIGHT] FAST START no intro/music
    goto BEGINPRJ
)


if "%selection%"=="2" (
    echo [ROBO-KNIGHT] Skipping MUSIC...
    call "%~dp0AVIS_PRJ_SCAN\INTRO.BAT"
    goto BEGINPRJ
)

if "%selection%"=="3" (
    echo [ROBO-KNIGHT] Skipping INTRO video...
    call "%~dp0AVIS_PRJ_SCAN\MUSIC.BAT"
    goto BEGINPRJ
)

if "%selection%"=="4" (
    echo [ROBO-KNIGHT] Launching INTRO + MUSIC...
    call "%~dp0AVIS_PRJ_SCAN\MUSIC.BAT"
    call "%~dp0AVIS_PRJ_SCAN\INTRO.BAT"
    goto BEGINPRJ
)

echo.

pause
:BEGINPRJ

rem ----------------------------------------------------------------------------
rem STEP 2: PROJECT ANCHORING
rem ----------------------------------------------------------------------------
set "PROJECT_ROOT=%REMDRV%\%PRJ_DRV_KEY%\%PRJ_DIR_KEY%%PRJ_ROOT_KEY%"
set "PROJECT_PATH=%PROJECT_ROOT%\%PRJ_APP_KEY%\"
cd /d "%PROJECT_ROOT%"

:: Put your banner here if needed
set "CVBGOD="

:MENU_START
set "selection=3"

:REDRAW
cls

:: ANSI INIT (DO NOT MOVE THIS BELOW)
for /f %%A in ('echo prompt $E^| cmd') do set "e=%%A"
chcp 65001 >nul

:: TOP PADDING
echo.
echo.
echo.
:: OPTIONAL CVBGOD DISPLAY
if defined CVBGOD echo %e%[38;5;214m%CVBGOD%%e%[0m

echo %e%[38;5;39m
echo        ██████╗  ██████╗ ██████╗  ██████╗       ██╗  ██╗███╗   ██╗██╗ ██████╗ ██╗  ██╗████████╗
echo        ██╔══██╗██╔═══██╗██╔══██╗██╔═══██╗      ██║ ██╔╝████╗  ██║██║██╔════╝██║  ██║╚══██╔══╝
echo        ██████╔╝██║   ██║██████╔╝██║   ██║      █████╔╝ ██╔██╗ ██║██║██║  ███╗███████║   ██║
echo        ██╔══██╗██║   ██║██╔══██╗██║   ██║      ██╔═██╗ ██║╚██╗██║██║██║   ██║██╔══██║   ██║
echo        ██║  ██║╚██████╔╝██████╔╝╚██████╔╝      ██║  ██╗██║ ╚████║██║╚██████╔╝██║  ██║   ██║
echo        ╚═╝  ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝       ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝
echo %e%[0m

echo.
echo   %e%[38;5;244m                [AVIS] SELECT MODE (Use ARROW KEYS, ENTER to select):%e%[0m
echo.
echo   %e%[38;5;214m                [AI]   I AM COPILOT — I ADDED A TOOL PANEL FOR YOU.%e%[0m
echo.
echo   %e%[38;5;214m                                    [AVIS] SCANNER VERSION %CVBGOD_VERSION%
echo   %e%[38;5;239m----------------------------------------------------------------------------%e%[0m
echo.

:: MENU ITEMS (1–8)
if "%selection%"=="1" (echo        %e%[93m^>  1. RUN PROJECT SCAN 'NORMAL' %e%[0m) else (echo                1. RUN PROJECT SCAN 'NORMAL')
if "%selection%"=="2" (echo        %e%[93m^>  2. RUN SCAN OMIT 'KEY' DIR FILES %e%[0m) else (echo                2. RUN SCAN OMIT 'KEY' DIR FILES)
if "%selection%"=="3" (echo        %e%[93m^>  3. FULL SCAN OMIT 'KEY/BUILD' DIR FILES %e%[0m) else (echo                3. FULL SCAN OMIT 'KEY/BUILD' DIR FILES)
if "%selection%"=="4" (echo        %e%[93m^>  4. RUN SCAN CREATE SOURCE *New TRY %CVBGOD_VERSION% %e%[0m) else (echo                4. RUN SCAN CREATE SOURCE *New in %CVBGOD_VERSION%)
if "%selection%"=="5" (echo        %e%[93m^>  5. EDIT 'INI' FILE %e%[0m) else (echo                5. EDIT 'INI' FILE)
if "%selection%"=="6" (echo        %e%[93m^>  6. READ 'LOG' FILE %e%[0m) else (echo                6. READ 'LOG' FILE)
if "%selection%"=="7" (echo        %e%[93m^>  7. AI 'TOOLS / UTILITIES' %e%[0m) else (echo                7. AI 'TOOLS / UTILITIES')
if "%selection%"=="8" (echo        %e%[93m^>  8. EXIT %e%[0m) else (echo                8. EXIT)

echo.
echo   %e%[38;5;239m----------------------------------------------------------------------------%e%[0m

:: PHYSICAL KEY LISTENER
for /f "usebackq delims=" %%K in (`powershell -NoProfile -Command ^
  "$k = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');" ^
  "if ($k.VirtualKeyCode -eq 38) { '38' }" ^
  "elseif ($k.VirtualKeyCode -eq 40) { '40' }" ^
  "elseif ($k.VirtualKeyCode -eq 13) { '13' }"`) do (
    set "key=%%K"
)

set "KEY_CODE=%key%"

:: ENTER
if "%KEY_CODE%"=="13" goto DO_ACTION

:: UP
if "%KEY_CODE%"=="38" (
    set /a selection-=1
    if !selection! lss 1 set selection=8
    goto REDRAW
)

:: DOWN
if "%KEY_CODE%"=="40" (
    set /a selection+=1
    if !selection! gtr 8 set selection=1
    goto REDRAW
)

goto REDRAW

:DO_ACTION
cls

:: EXIT
if "%selection%"=="8" exit /b 0

:: AI TOOLS
if "%selection%"=="7" goto AI_TOOLS

:: CREATE SOURCE
if "%selection%"=="4" goto RUN_COPY

:: READ LOG
if "%selection%"=="6" (
    echo.
    echo    [AVIS] OPENING LOG...
    start notepad "%PROJECT_PATH%LOG\ACK_AI_OP.LOG"
    goto FIRE_END
)

:: EDIT INI
if "%selection%"=="5" (
    echo.
    echo    [AVIS] OPENING INI...
    start notepad "%PROJECT_PATH%AVIS_PRJ_SCAN.INI"
    goto FIRE_END
)

:: FULL SCAN OMIT KEY/BUILD
if "%selection%"=="3" (
    set "AVIS_OMIT_KEYDIR_AND_BUILD=1"
    set "AVIS_OMIT_KEYDIR=1"
    goto RUN_SCAN
)

:: SCAN OMIT KEY DIR
if "%selection%"=="2" (
    set "AVIS_OMIT_KEYDIR=1"
    set "AVIS_OMIT_KEYDIR_AND_BUILD=0"
    goto RUN_SCAN
)

:: NORMAL SCAN
if "%selection%"=="1" (
    set "AVIS_OMIT_KEYDIR=0"
    set "AVIS_OMIT_KEYDIR_AND_BUILD=0"
    goto RUN_SCAN
)

:RUN_COPY

call "%PROJECT_PATH%RKB.BAT"
    call "%PROJECT_PATH%AVIS_PRJ_SCAN_REC.BAT
	
goto FIRE_END

:RUN_SCAN
echo    [AVIS] EXECUTING CORE SCAN...
echo.
if exist "%PROJECT_PATH%AVIS_PRJ_SCAN_EXEC.BAT" (
    call "%PROJECT_PATH%AVIS_PRJ_SCAN_EXEC.BAT"
	call "%PROJECT_PATH%RKB.BAT"
) else (
    echo    [SHINE_ERROR] Executor core missing at %PROJECT_PATH%
    pause
)

:FIRE_END

echo.
echo ----------------------------------------------------------------------
echo.
echo        [CVBGOD] CONTINUE BACK TO THE MENU OR CLOSE THE WINDOW
echo        [CVBGOD] [FFF] [MERCWAR]  -  APPLICATION VERSION %CVBGOD_VERSION%
echo.
echo ----------------------------------------------------------------------
pause 
set "CVBGOD=                               [CVBGOD] I have given it to you ..."
goto MENU_START


:AI_TOOLS

call "%PROJECT_PATH%RKB.BAT"


echo   %e%[38;5;239m----------------------------------------------------------------------------%e%[0m

echo.
echo   [AI] COPILOT UTILITY PANEL — I ADDED THIS FOR YOU.
echo.
echo   1. CMD
echo   2. PowerShell
echo   3. Notepad
echo   4. Explorer
echo   5. Task Manager
echo   6. System Info
echo   7. Return to Menu
echo.
echo   %e%[38;5;239m----------------------------------------------------------------------------%e%[0m

set /p "tool=Select: "

if "%tool%"=="1" start cmd
if "%tool%"=="2" start powershell
if "%tool%"=="3" start notepad
if "%tool%"=="4" start explorer
if "%tool%"=="5" start taskmgr
if "%tool%"=="6" start msinfo32
set "CVBGOD=                             [CVBGOD] Copilot has given it to you ..."
goto MENU_START
