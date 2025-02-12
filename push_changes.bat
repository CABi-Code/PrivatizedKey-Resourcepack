@echo off
cd /d "%~dp0"
git checkout main
git add .
for /f %%i in ('git rev-parse HEAD') do set COMMIT_HASH=%%i
git commit -am "%COMMIT_HASH%"
git push
echo %COMMIT_HASH% > last_commit.txt
echo Commit %COMMIT_HASH% pushed!
echo Press Enter...
pause