@echo off
for /f "tokens=*" %%i in ('sc query state^= all ^| findstr /B /C:"SERVICE_NAME:"') do (
    setlocal enabledelayedexpansion
    set "srv=%%i"
    set srv=!srv:SERVICE_NAME: =!
    sc stop "!srv!" >nul 2>&1
    sc config "!srv!" start= demand >nul 2>&1
    sc start "!srv!" >nul 2>&1
    endlocal
)
echo All services reset to default start type (demand).
pause
