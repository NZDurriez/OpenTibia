@echo off
setlocal EnableExtensions
cd /d "%~dp0"

where docker >nul 2>&1
if errorlevel 1 (
  echo Docker was not found on PATH.
  echo Open Docker Desktop, then try again.
  pause
  exit /b 1
)

docker info >nul 2>&1
if errorlevel 1 (
  echo Docker Desktop is installed but not running yet.
  echo Start Docker Desktop, wait until it says it is running, then try again.
  pause
  exit /b 1
)

echo Starting MariaDB in Docker...
docker compose up -d --wait db
if errorlevel 1 (
  echo.
  echo Docker Compose could not start the database.
  echo If port 3306 is already in use, stop local MySQL/XAMPP or change the port in docker-compose.yml.
  pause
  exit /b 1
)

if not exist "server\theforgottenserver-x64.exe" (
  echo Could not find server\theforgottenserver-x64.exe
  pause
  exit /b 1
)

echo.
echo Starting Open Tibia server (The Forgotten Server 1.6, protocol 13.10)...
echo Login: 127.0.0.1  ports 7171 / 7172 / HTTP 8080
echo Accounts:  1 / 1  (Player)    god / god  (God)
echo.
cd server
theforgottenserver-x64.exe
echo.
echo Server stopped. The database container is still running.
echo To stop it:  docker compose down
pause
