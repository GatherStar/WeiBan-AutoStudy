@echo off
start call.bat

:testDependence
if not exist .\dependence (
echo 请下载好 Python3 依赖
) else (
goto start
)
goto end

:start
echo 是否需要打开日志记录错误，需要请按y按键：
set /p debug=
if "%debug%"=="y" (goto debug) else (goto standard)

:debug
if not exist logs mkdir logs
set "datetime=%date:~,4%-%date:~5,2%-%date:~8,2%-%time:~0,2%-%time:~3,2%-%time:~6,2%"
.\dependence\python.exe main.py 2> .\logs\%datetime%.txt
goto end

:standard
.\dependence\python.exe main.py
echo 执行结束
goto end

:end
pause > nul & exit
