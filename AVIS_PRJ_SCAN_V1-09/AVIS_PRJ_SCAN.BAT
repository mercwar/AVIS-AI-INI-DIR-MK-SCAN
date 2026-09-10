@echo off
setlocal EnableExtensions EnableDelayedExpansion

:: ============================================================================
:: AVIS PROJECT SCAN — DYNAMIC INI IMPORT SYSTEM
:: ============================================================
:: This block searches for the INI and imports all vars under [UMSK]
:: ============================================================

set "INI_FILE=%~dp0AVIS_PRJ_SCAN\AVIS_PRJ_SCAN.INI"

if exist "%INI_FILE%" (
    for /f "usebackq tokens=1,2 delims==" %%A in ("%INI_FILE%") do (
        set "raw_key=%%A"
        set "raw_val=%%B"
        
        :: Clean the keys and values of extra spaces
        set "clean_key=!raw_key: =!"
        set "clean_val=!raw_val: =!"
        
        :: Inject as a Batch variable (ignoring INI headers like [UMSK])
        if not "!clean_key:~0,1!"=="[" if not "!clean_key:~0,1!"==";" (
            set "!clean_key!=!clean_val!"
        )
    )
) else (
    echo [AVIS] CRITICAL ERROR: AVIS_PRJ_SCAN.INI NOT FOUND AT %~dp0
    pause
    exit /b 1
)
:: ============================================================
::  CLEAN AUDIO ENGINE (NO POWERSHELL - MCI/VBS BRIDGE)
:: ============================================================
set "MIDI_PATH=%~dp0AVIS_PRJ_SCAN\midi\JP-YGATC.mid"

if exist "%MIDI_PATH%" (
    :: Create a temporary hidden script to play the MIDI
    echo Set o = CreateObject^("WMPlayer.OCX"^) > "%temp%\avis_snd.vbs"
    echo o.URL = "%MIDI_PATH%" >> "%temp%\avis_snd.vbs"
    echo o.settings.setMode "loop", True >> "%temp%\avis_snd.vbs"
    echo o.controls.play >> "%temp%\avis_snd.vbs"
    echo Do While o.playState ^<^> 1: WScript.Sleep 1000: Loop >> "%temp%\avis_snd.vbs"
    
    :: Launch it silently
    start /b wscript.exe "%temp%\avis_snd.vbs"
)
:BEGIN

:: ============================================================
::  FIXED + STABLE ESCAPE SEQUENCE INITIALIZATION
:: ============================================================
for /f %%A in ('echo prompt $E^| cmd') do set "e=%%A"

chcp 65001 >nul

:: ============================================================
::  AVIS AUDIO ENGINE (Embedded)
:: ============================================================
reg add "HKCU\Console" /v FaceName /t REG_SZ /d "" /f >nul 2>&1
reg add "HKCU\Console" /v FontFamily /t REG_DWORD /d 0x00000000 /f >nul 2>&1
reg add "HKCU\Console" /v FontSize /t REG_DWORD /d 0x00100000 /f >nul 2>&1

cls
echo.
echo   %e%[38;5;239m┌────────────────────────────────────────────────────────────┐
echo   │                                                            │
echo   │           %e%[38;5;255mS H I N E   A R C H I T E C T U R E%e%[38;5;239m              │
echo   │                                                            │
echo   └────────────────────────────────────────────────────────────┘%e%[0m
echo.
echo       %e%[38;5;244m ██████╗ ██╗   ██╗██████╗  ██████╗  ██████╗ ██████╗
echo        ██╔════╝ ██║   ██║██╔══██╗██╔════╝ ██╔═══██╗██╔══██╗
echo        ██║      ██║   ██║██████╔╝██║  ███╗██║   ██║██║  ██║
echo        ██║      ╚██╗ ██╔╝██╔══██╗██║   ██║██║   ██║██║  ██║
echo        ╚██████╗  ╚████╔╝ ██████╔╝╚██████╔╝╚██████╔╝██████╔╝
echo         ╚═════╝   ╚═══╝  ╚═════╝  ╚═════╝  ╚═════╝ ╚═════╝ %e%[0m
echo.
echo   %e%[38;5;239m┌────────────────────────────────────────────────────────────┐
echo   │                       %e%[38;5;255mDESIGNED BY CVBGOD%e%[38;5;239m                   │
echo   └────────────────────────────────────────────────────────────┘%e%[0m
echo  © 2026 CVBGOD
echo.
echo   [ THIS VERSION HAS NO INI SUPPORT FOR 'UMSK * INI' ]
echo.
echo    :: {APPLY YOUR CHANGES TO 'USER MODE SELECTION KEYS'} ::
echo          :: {OPEN AVIS_PRJ_SCAN.BAT SCROLL DOWN TO UMSK} ::
echo            :: {REMOVABLE DRIVES HANG AT TIMES, IT ISN'T DOS} ::
echo.          
echo.
echo                    [ WaReZ bY m3rCw4r FFF D3M0N1z3r TH3 CV8G0D ]
echo.
PAUSE
cls

rem ----------------------------------------------------------------------------
rem STEP 1: HARDWARE DETECTION
rem ----------------------------------------------------------------------------
echo.
echo   %e%[38;5;244m╔══════════════════════════════════════════════════════════════╗
echo   ║                                                              ║
echo   ║    %e%[38;5;255mPROJ: AVIS PROJECT SCAN                                   %e%[38;5;244m║
echo   ║    %e%[38;5;255mARCH: SHINE ARCHITECTURE                                  %e%[38;5;244m║
echo   ║    %e%[38;5;255mAUTH: CVBGOD                                              %e%[38;5;244m║
echo   ║    %e%[38;5;255mCORE: VER 1.08                                            %e%[38;5;244m║
echo   ║    %e%[38;5;255mDATE: 01/27/2026                                          %e%[38;5;244m║
echo   ║                                                              ║
echo   ║    %e%[38;5;240mCOPY: © MERCWAR FFF * ALL RIGHTS RESERVED * %e%[38;5;244m              ║
echo   ╚══════════════════════════════════════════════════════════════╝%e%[0m

call "%~dp0AVIS_PRJ_SCAN\AVIS_REM_DRV.BAT"
if errorlevel 1 (
    echo [AVIS] CRITICAL ERROR: Removable drive detection failed.
    echo.
    PAUSE
    exit /b 1
)
echo.
echo   %e%[38;5;244m╔══════════════════════════════════════════════════════════════╗
echo   ║                                                              ║
echo   ║    %e%[38;5;239m   [::::::::::::::::::::::::::::::::::::::]               %e%[38;5;244m║
echo   ║                                                              ║
echo   ║         %e%[38;5;255m[AVIS] INITIALIZING HARDWARE DETECTION               %e%[38;5;244m║
echo   ╚══════════════════════════════════════════════════════════════╝%e%[0m
echo.
REM timeout /t 1 >nul
PAUSE
cls
echo.
echo   %e%[38;5;244m╔══════════════════════════════════════════════════════════════╗
echo   %e%[38;5;244m║                                                              ║
echo   %e%[38;5;244m║    %e%[38;5;255mPROJ: AVIS PROJECT SCAN                                   %e%[38;5;244m║
echo   %e%[38;5;244m║    %e%[38;5;255mARCH: SHINE ARCHITECTURE                                  %e%[38;5;244m║
echo   %e%[38;5;244m║    %e%[38;5;255mAUTH: CVBGOD                                              %e%[38;5;244m║
echo   %e%[38;5;244m║    %e%[38;5;255mCORE: VER 1.08                                            %e%[38;5;244m║
echo   %e%[38;5;244m║    %e%[38;5;255mDATE: 01/27/2026                                          %e%[38;5;244m║
echo   %e%[38;5;244m║                                                              ║
echo   %e%[38;5;244m║    %e%[38;5;240mCOPY: © MERCWAR FFF * ALL RIGHTS RESERVED *               %e%[38;5;244m║
echo   %e%[38;5;244m║                                                              ║
echo   %e%[38;5;244m║    %e%[38;5;239m   [::::::::::::::::::::::::::::::::::::::]               %e%[38;5;244m║
echo   %e%[38;5;244m║                                                              ║
echo   %e%[38;5;244m║            %e%[38;5;255mINITIALIZING AI SCAN MENU...                      %e%[38;5;244m║
echo   %e%[38;5;244m╚══════════════════════════════════════════════════════════════╝%e%[0m
echo.
echo   [  Welcome AVIS Project Scan DEV, in CVBGOD's World  ]
echo.
echo     :: {CHECK YOUR SPELLING IN YOUR INI FOR THROWS 'n HIDES} ::
echo        :: {APPLY YOUR CHANGES TO 'USER MODE SELECTION KEYS'}::
echo.
echo                                         [ Revised by MS Copilot! ]
echo.
REM timeout /t 1 >nul
PAUSE

rem ----------------------------------------------------------------------------
rem STEP 2: PROJECT ANCHORING
rem ----------------------------------------------------------------------------
set "PROJECT_ROOT=%REMDRV%\%PRJ_DRV_KEY%\%PRJ_DIR_KEY%%PRJ_ROOT_KEY%"
set "PROJECT_PATH=%PROJECT_ROOT%\%PRJ_APP_KEY%\"
cd /d "%PROJECT_ROOT%"
set "CVBGOD=                        [CVBGOD] AI DEV SCAN!"
:MENU_START
set "selection=1"
:REDRAW
cls
echo.
echo %CVBGOD%
echo.
echo        [AVIS] SELECT MODE (Use ARROW KEYS, ENTER to select):
echo ----------------------------------------------------------------------------
echo.
if "%selection%"=="1" (echo        %e%[93m^> [ 1. RUN PROJECT SCAN ]%e%[0m) else (echo                1. RUN PROJECT SCAN)
if "%selection%"=="2" (echo        %e%[93m^> [ 2. EDIT INI FILE    ]%e%[0m) else (echo                2. EDIT INI FILE)
if "%selection%"=="3" (echo        %e%[93m^> [ 3. READ LOG FILE    ]%e%[0m) else (echo                3. READ LOG FILE)
if "%selection%"=="4" (echo        %e%[93m^> [ 4. EXIT             ]%e%[0m) else (echo                4. EXIT)
echo.
echo ----------------------------------------------------------------------------

:: PHYSICAL KEY LISTENER (PowerShell Bridge)
for /f "delims=" %%K in ('powershell -Command "$k = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown'); if ($k.VirtualKeyCode -eq 38) {38} elseif ($k.VirtualKeyCode -eq 40) {40} elseif ($k.VirtualKeyCode -eq 13) {13}"') do (
    set "key=%%K"
)

if "%key%"=="13" goto DO_ACTION
if "%key%"=="38" (
    set /a selection-=1
    if !selection! lss 1 set selection=4
    goto REDRAW
)
if "%key%"=="40" (
    set /a selection+=1
    if !selection! gtr 4 set selection=1
    goto REDRAW
)
goto REDRAW

:DO_ACTION
cls
if "%selection%"=="4" exit /b 0

if "%selection%"=="3" (
    echo.
    echo    [AVIS] OPENING LOG...
    start notepad "%PROJECT_PATH%LOG\ACK_AI_OP.LOG"
    goto FIRE_END
)
if "%selection%"=="2" (
    echo.
    echo    [AVIS] OPENING INI...
    start notepad "%PROJECT_PATH%AVIS_PRJ_SCAN.INI"
    goto FIRE_END
)

:: Option 1: Execution
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
echo        [CVBGOD] [FFF] [MERCWAR]  -  APPLICATION VERSION 1.08
echo.
echo ----------------------------------------------------------------------
pause 
set "CVBGOD=                    [CVBGOD] I have given it to you!"
goto MENU_START