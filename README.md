# PCSX2-Custom-Config-Shortcut-Creator
Very simple batch script to create a custom config and corresponding shortcut for any PS2 .iso file to be launched with PCSX2.

This script requiers nircmd.exe (http://nircmd.nirsoft.net) to be installed in your C:\Windows\System32 folder (or any other folder in your PATH).

Usage:
1. Replace the paths in the .bat file with your own ones.

   PCSX2 -> The path to the executable of PCSX2, eg. P:\PCSX2\pcsx2.exe
   
   CONFIGS_FOLDER -> The path to the folder where custom configs will be stored, eg. D:\Documents\PCSX2\configs
   
   STD_CONFIG_FOLDER -> The path to the folder where the general config is stored, eg. D:\Documents\PCSX2\inis 
   
   This will be used as the base for any custom profiles.
   
   SC_FOLDER -> The path where the shortcut that launches the .iso with custom config will be saved, eg. D:\ROMs\Playstation 2
   
2. Drag and drop the game's .iso file onto the .bat file.

   The config and shortcut will be created for you. In case a custom config is already in use, it will ask if you want to overwrite.
