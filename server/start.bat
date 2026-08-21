@echo off
setlocal
cd /d "%~dp0"

if not exist "theforgottenserver-x64.exe" (
  echo Could not find theforgottenserver-x64.exe
  pause
  exit /b 1
)

echo Starting Open Tibia server (The Forgotten Server 1.6, protocol 13.10)...
echo Make sure MariaDB/MySQL is running and schema.sql has been imported.
echo.
theforgottenserver-x64.exe
echo.
echo Server stopped.
pause
