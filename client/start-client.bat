@echo off
setlocal EnableExtensions
cd /d "%~dp0"

if not exist "otclient.exe" (
  echo Could not find otclient.exe in this folder.
  pause
  exit /b 1
)

if not exist "mods\client_mods\mods.otmod" (
  echo Missing mods\client_mods\mods.otmod
  echo Re-download the latest files from the OpenTibia GitHub branch.
  pause
  exit /b 1
)

echo.
echo OTClient Redemption 4.1  -  protocol 13.10  -  HTTP login 127.0.0.1:8080
echo Start the server first (start-windows.bat in the repo root).
echo Login:  account 1 / password 1    or    god / god
echo.
echo The first launch may download 13.10 graphics. That can take a few minutes.
echo.

start "OTClient" /D "%~dp0" otclient.exe
