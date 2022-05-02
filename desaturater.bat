@echo off
setlocal enabledelayedexpansion 

FOR %%i IN (*.jpg *.png) DO ffmpeg -i "%%i" -vf hue=s=0 "%~dp0/imagepath/%%i.jpg"

exit