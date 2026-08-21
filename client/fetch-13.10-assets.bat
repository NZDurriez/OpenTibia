@echo off
setlocal EnableExtensions EnableDelayedExpansion
cd /d "%~dp0"

set "DEST=%cd%\data\things\1310"
set "ZIP=%TEMP%\tibia-client-13.10.12892.zip"
set "EXTRACT=%TEMP%\tibia-client-13.10.12892-extract"
set "URL=https://github.com/dudantas/tibia-client/archive/refs/tags/13.10.12892.zip"

if exist "%DEST%\catalog-content.json" (
  echo 13.10 assets are already in data\things\1310
  pause
  exit /b 0
)

echo Downloading Tibia 13.10 appearances from GitHub.
echo This can take several minutes and needs internet access.
echo.

powershell -NoProfile -Command ^
  "$ErrorActionPreference='Stop';" ^
  "Invoke-WebRequest -Uri '%URL%' -OutFile '%ZIP%';" ^
  "if (Test-Path '%EXTRACT%') { Remove-Item -Recurse -Force '%EXTRACT%' };" ^
  "Expand-Archive -LiteralPath '%ZIP%' -DestinationPath '%EXTRACT%' -Force;" ^
  "$assets = Get-ChildItem -Path '%EXTRACT%' -Directory | ForEach-Object { Join-Path $_.FullName 'assets' } | Where-Object { Test-Path $_ } | Select-Object -First 1;" ^
  "if (-not $assets) { throw 'The downloaded zip did not contain an assets folder.' };" ^
  "New-Item -ItemType Directory -Force -Path '%DEST%' | Out-Null;" ^
  "Copy-Item -Path (Join-Path $assets '*') -Destination '%DEST%' -Recurse -Force;" ^
  "Set-Content -Path (Join-Path '%DEST%' 'assets.json.sha256') -Value 'generated-locally'"

if errorlevel 1 (
  echo.
  echo Download or extract failed.
  echo You can instead copy the assets folder from a Tibia 13.10 client you are allowed to use into:
  echo   %DEST%
  pause
  exit /b 1
)

echo.
echo Done. Start the client with start-client.bat
pause
