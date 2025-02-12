@echo off
cd /d "%~dp0"
:loop
echo Checking for updates...
for /f %%i in ('git ls-remote origin -h refs/heads/main') do set LATEST_COMMIT=%%i

if exist last_commit.txt (
    set /p LOCAL_COMMIT=<last_commit.txt
) else (
    echo No local commit hash found. Running pull...
    git pull
    echo %LATEST_COMMIT% > last_commit.txt
)

if not "%LOCAL_COMMIT%"=="%LATEST_COMMIT%" (
    echo New update detected! Local: %LOCAL_COMMIT% | Remote: %LATEST_COMMIT%
    echo Run "git pull" to update.
) else (
    echo No updates found.
)

timeout /t 5 /nobreak >nul
goto loop
