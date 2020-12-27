@echo off

REM ---Usage---
REM 1 - Set the necessary file paths in the options below.
REM 2 - Drag any PS2 .iso file onto this .bat file.
REM     The shortcut and config will be created.

REM ---User-Options---

REM Path to the executable of PCSX2.
SET PCSX2=P:\PCSX2\pcsx2.exe

REM Path to the folder where custom configs will be stored.
SET CONFIGS_FOLDER=D:\Documents\PCSX2\configs

REM Path to the folder where the general config is stored. This will be used as the base for any custom profiles.
SET STD_CONFIG_FOLDER=D:\Documents\PCSX2\inis

REM Path where the shortcut that launches the .iso with custom config will be saved.
SET SC_FOLDER=D:\ROMs\Playstation 2




REM ---CODE---

SET ISO_PATH=%1
for %%f in (%1) do set GAME_ISO=%%~nxf
SET GAME=%GAME_ISO:~0,-4%
SET ISO_PATH=%ISO_PATH:~1,-1%
SET ARG=~q%ISO_PATH%~q --cfgpath=~q%CONFIGS_FOLDER%\%GAME%~q

echo game:               %GAME%
echo path to game.iso:   %ISO_PATH%
echo configs-folder:     %CONFIGS_FOLDER%
echo shortcut-folder:    %SC_FOLDER%
echo:

pause

IF EXIST "%CONFIGS_FOLDER%\%GAME%\" GOTO NEUFRAGE

:NEU
IF EXIST "%SC_FOLDER%\%GAME%.lnk" DEL "%SC_FOLDER%\%GAME%.lnk"
robocopy "%STD_CONFIG_FOLDER%" "%CONFIGS_FOLDER%\%GAME%" /E
nircmd.exe shortcut "%PCSX2%" "%SC_FOLDER%" "%GAME%" "%ARG%"

GOTO ENDE

:NEUFRAGE
echo Custom config already created.
set /p "NEUWAHL=Delete config and create a new one? (y/n): "
IF %NEUWAHL%="y" GOTO NEU

:ENDE