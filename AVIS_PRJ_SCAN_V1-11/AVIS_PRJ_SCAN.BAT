@echo off
chcp 65001 >nul

:BEGIN_AVIS
:: This clears all variables defined inside the previous session

setlocal EnableExtensions EnableDelayedExpansion

:: Initialize / Re-initialize your variables here
set "CVBGOD_VERSION=1.11"

:: Define Escape Character for Colors
for /F %%a in ('echo prompt $E ^| cmd') do set "e=%%a"

:: Initialize Selection for the Menu
set "selection=1"


:: ============================================================================
:: AVIS PROJECT SCAN — CYBERNETIC SYSTEM BOOTSTRAP
:: ============================================================================
set "PRJ_DRV_KEY="
set "PRJ_DIR_KEY="
set "PRJ_ROOT_KEY="
set "PRJ_APP_KEY="

set "INI_FILE=%~dp0AVIS_PRJ_SCAN\AVIS_PRJ_SCAN.INI"

if exist "%INI_FILE%" (
    for /f "usebackq tokens=1,* delims==" %%A in ("%INI_FILE%") do (
        set "raw_key=%%A"
        set "raw_val=%%B"

        for /f "tokens=* delims= " %%K in ("!raw_key!") do set "clean_key=%%K"
        for /f "tokens=* delims= " %%V in ("!raw_val!") do set "clean_val=%%V"

        :: Use CALL to subroutines at the bottom
        call :do_trim_key
        call :do_trim_val

        if not "!clean_key:~0,1!"=="[" if not "!clean_key:~0,1!"==";" (
            set "!clean_key!=!clean_val!"
        ) 
    )
) else (
    goto :UMSK_ERROR_MENU
)


:: ============================================================
::  VALIDATION LOGIC — FORCED ERROR REDIRECT
:: ============================================================
set "MISSING="

:: Check existence and content using delayed expansion for safety
if not defined PRJ_DRV_KEY  set "MISSING=1"
if not defined PRJ_DIR_KEY  set "MISSING=1"
if not defined PRJ_ROOT_KEY set "MISSING=1"
if not defined PRJ_APP_KEY  set "MISSING=1"

if "!PRJ_DRV_KEY!"==""  set "MISSING=1"
if "!PRJ_DIR_KEY!"==""  set "MISSING=1"
if "!PRJ_ROOT_KEY!"=="" set "MISSING=1"
if "!PRJ_APP_KEY!"==""  set "MISSING=1"

if defined MISSING goto :UMSK_ERROR_MENU

:: If everything is valid, proceed to your label
goto :INTROMENU


:UMSK_ERROR_MENU
cls
:: ANSI INIT
for /f %%A in ('echo prompt $E^| cmd') do set "e=%%A"
chcp 65001 >nul

:: =========================
:: ROBO-KNIGHT BANNER
:: =========================
:: RK (banner + color)
:: =========================
:: RK JOE TRON BANNER
:: =========================
echo.
echo %e%[38;5;39m
echo        ██████╗ ██╗ ██╔╝          ██╗ ██████╗ ███████╗    ████████╗██████╗  ██████╗ ███╗   ██╗
echo        ██╔══██╗██║██╔╝           ██║██╔═══██╗██╔════╝    ╚══██╔══╝██╔══██╗██╔═══██╗████╗  ██║
echo        ██████╔╝█████╔╝           ██║██║   ██║█████╗         ██║   ██████╔╝██║   ██║██╔██╗ ██║
echo        ██╔══██╗██╔═██╗     ██╗   ██║██║   ██║██╔══╝         ██║   ██╔══██╗██║   ██║██║╚██╗██║
echo        ██║  ██║██║  ██╗    ╚██████╔╝╚██████╔╝███████╗       ██║   ██║  ██║╚██████╔╝██║ ╚████║
echo        ╚═╝  ╚═╝╚═╝  ╚═╝  by ╚═════╝  ╚═════╝ ╚══════╝       ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
echo %e%[0m

echo.
echo   %e%[38;5;244m                [AVIS] INTRO / MUSIC CONTROL PANEL%e%[0m
echo   %e%[38;5;214m                [AI] ROBO-KNIGHT STARTUP OPTIONS%e%[0m
echo.
echo      [CVBGOD] [FFF] [DEMONIZER] [MERCWAR]   APPLICATION VERSION %CVBGOD_VERSION%
echo   %e%[38;5;239m----------------------------------------------------------------------------%e%[0m
echo.
echo.
echo.
echo.

echo.
echo   %e%[91m [AVIS] CRITICAL: UMSK CONFIGURATION ERROR %e%[0m
echo   %e%[38;5;239m ---------------------------------------------------------------------------- %e%[0m
echo    One or more UMSK values are MISSING or EMPTY in:
echo    !INI_FILE!
echo.

if "%selection%"=="1" ( echo        %e%[93m^>  1. OPEN INI IN NOTEPAD %e%[0m ) else ( echo                1. OPEN INI IN NOTEPAD )
if "%selection%"=="2" ( echo        %e%[93m^>  2. RESTART BOOTSTRAP RESCAN %e%[0m ) else ( echo                2. RESTART BOOTSTRAP RESCAN )
if "%selection%"=="3" ( echo        %e%[93m^>  3. EXIT %e%[0m ) else ( echo                3. EXIT )

echo.
echo   %e%[38;5;239m ---------------------------------------------------------------------------- %e%[0m


:: =========================
:: KEY LISTENER (NO FLUSH HERE)
:: =========================
set "key="

for /f "usebackq delims=" %%K in (`powershell -NoProfile -Command ^
  "$k = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');" ^
  "if ($k.VirtualKeyCode -eq 38) { '38' }" ^
  "elseif ($k.VirtualKeyCode -eq 40) { '40' }" ^
  "elseif ($k.VirtualKeyCode -eq 13) { '13' }"`) do (
    set "key=%%K"
)

set "KEY_CODE=%key%"

:: ENTER
if "%KEY_CODE%"=="13" goto UMSK_ACTION

:: UP
if "%KEY_CODE%"=="38" (
    set /a selection-=1
    if !selection! lss 1 set selection=3
    goto UMSK_ERROR_MENU
)

:: DOWN
if "%KEY_CODE%"=="40" (
    set /a selection+=1
    if !selection! gtr 3 set selection=1
    goto UMSK_ERROR_MENU
)

goto UMSK_ERROR_MENU


:: =========================
:: ACTION HANDLER
:: =========================
:UMSK_ACTION

if "%selection%"=="1" (
    start notepad "!INI_FILE!"
	goto UMSK_ERROR_MENU
    
)

if "%selection%"=="2" (
	endlocal 2>nul
    goto BEGIN_AVIS
)

if "%selection%"=="3" exit /b



:: =========================
:: SUBROUTINES
:: =========================
:do_trim_key
if "!clean_key:~-1!"==" " (
    set "clean_key=!clean_key:~0,-1!"
    goto do_trim_key
)
exit /b

:do_trim_val
if "!clean_val:~-1!"==" " (
    set "clean_val=!clean_val:~0,-1!"
    goto do_trim_val
)

exit /b


:INTROMENU
cls

:: ANSI INIT
for /f %%A in ('echo prompt $E^| cmd') do set "e=%%A"
chcp 65001 >nul

title ROBO-KNIGHT / AVIS Intro Control

if not defined selection set selection=1


echo.
echo.
echo.

echo.
echo %e%[38;5;39m
echo        ██████╗  ██████╗ ██████╗  ██████╗       ██╗  ██╗███╗   ██╗██╗ ██████╗ ██╗  ██╗████████╗
echo        ██╔══██╗██╔═══██╗██╔══██╗██╔═══██╗      ██║ ██╔╝████╗  ██║██║██╔════╝ ██║  ██║╚══██╔══╝
echo        ██████╔╝██║   ██║██████╔╝██║   ██║      █████╔╝ ██╔██╗ ██║██║██║  ███╗███████║   ██║
echo        ██╔══██╗██║   ██║██╔══██╗██║   ██║      ██╔═██╗ ██║╚██╗██║██║██║   ██║██╔══██║   ██║
echo        ██║  ██║╚██████╔╝██████╔╝╚██████╔╝      ██║  ██╗██║ ╚████║██║╚██████╔╝██║  ██║   ██║
echo        ╚═╝  ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝       ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝
echo %e%[0m


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
echo        ██╔══██╗██╔═══██╗██╔══██╗██╔═══██╗      ██║ ██╔╝████╗  ██║██║██╔════╝ ██║  ██║╚══██╔══╝
echo        ██████╔╝██║   ██║██████╔╝██║   ██║      █████╔╝ ██╔██╗ ██║██║██║  ███╗███████║   ██║
echo        ██╔══██╗██║   ██║██╔══██╗██║   ██║      ██╔═██╗ ██║╚██╗██║██║██║   ██║██╔══██║   ██║
echo        ██║  ██║╚██████╔╝██████╔╝╚██████╔╝      ██║  ██╗██║ ╚████║██║╚██████╔╝██║  ██║   ██║
echo        ╚═╝  ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝       ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝
echo %e%[0m
echo.
echo.
echo   %e%[38;5;244m                [AVIS] SELECT MODE (Use ARROW KEYS, ENTER to select):%e%[0m
echo.
echo   %e%[38;5;214m                [AI]   I AM COPILOT — I ADDED A TOOL PANEL FOR YOU.%e%[0m
echo   %e%[38;5;239m----------------------------------------------------------------------------%e%[0m
echo.
echo.
echo.

echo.
if "%selection%"=="1" (
    echo        %e%[93m^>  1. FULL SCAN - BUILD DIR STRUCT, FULL PROJECT DIR SCAN %e%[0m
) else (
    echo                1. FULL SCAN - BUILD DIR STRUCT, FULL PROJECT DIR SCAN
)

if "%selection%"=="2" (
    echo        %e%[93m^>  2. FULL SCAN - BUILD DIR STRUCT, NO AVIS_PRJ_SCAN ITEMS %e%[0m
) else (
    echo                2. FULL SCAN - BUILD DIR STRUCT, NO AVIS_PRJ_SCAN ITEMS
)

if "%selection%"=="3" (
    echo        %e%[93m^>  3. SCAN PROJECT ONLY - NO BUILD DIR STRUCT, NO AVIS_PRJ_SCAN ITEMS %e%[0m
) else (
    echo                3. SCAN PROJECT ONLY - NO BUILD DIR STRUCT, NO AVIS_PRJ_SCAN ITEMS
)

if "%selection%"=="4" (
    echo        %e%[93m^>  4. EDIT 'INI' FILE %e%[0m
) else (
    echo                4. EDIT 'INI' FILE
)

if "%selection%"=="5" (
    echo        %e%[93m^>  5. READ 'LOG' FILE %e%[0m
) else (
    echo                5. READ 'LOG' FILE
)

if "%selection%"=="6" (
    echo        %e%[93m^>  6. AI 'TOOLS / UTILITIES' %e%[0m
) else (
    echo                6. AI 'TOOLS / UTILITIES'
)

if "%selection%"=="7" (
    echo        %e%[93m^>  7. EXIT %e%[0m
) else (
    echo                7. EXIT
)

echo.
echo   %e%[38;5;239m----------------------------------------------------------------------------%e%[0m

:: PHYSICAL KEY LISTENER (PowerShell Bridge)
for /f "usebackq delims=" %%K in (`powershell -NoProfile -Command ^
  "$k = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');" ^
  "if ($k.VirtualKeyCode -eq 38) { '38' }" ^
  "elseif ($k.VirtualKeyCode -eq 40) { '40' }" ^
  "elseif ($k.VirtualKeyCode -eq 13) { '13' }"`) do (
    set "key=%%K"
)



set "KEY_CODE=%key%"

if "%KEY_CODE%"=="13" goto DO_ACTION

if "%KEY_CODE%"=="38" (
    set /a selection-=1
    if !selection! lss 1 set selection=7
    goto REDRAW
)

if "%KEY_CODE%"=="40" (
    set /a selection+=1
    if !selection! gtr 7 set selection=1
    goto REDRAW
)

goto REDRAW

:DO_ACTION
cls

:: EXIT
if "%selection%"=="7" exit /b 0

:: AI TOOLS PANEL
if "%selection%"=="6" goto AI_TOOLS

:: READ LOG
if "%selection%"=="5" (
    echo.
    echo    [AVIS] OPENING LOG...
    start notepad "%PROJECT_PATH%LOG\ACK_AI_OP.LOG"
    goto FIRE_END
)

:: EDIT INI
if "%selection%"=="4" (
    echo.
    echo    [AVIS] OPENING INI...
    start notepad "%PROJECT_PATH%AVIS_PRJ_SCAN.INI"
    goto FIRE_END
)

:: FULL SCAN (OMIT KEY/BUILD)
if "%selection%"=="3" (
    set "AVIS_OMIT_KEYDIR_AND_BUILD=1"
    set "AVIS_OMIT_KEYDIR=1"
    goto RUN_SCAN
)

:: SCAN (OMIT KEY DIR)
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

:RUN_SCAN
echo    [AVIS] EXECUTING CORE SCAN...
echo.
if exist "%PROJECT_PATH%AVIS_PRJ_SCAN_EXEC.BAT" (
    call "%PROJECT_PATH%AVIS_PRJ_SCAN_EXEC.BAT"
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
cls
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
