@echo off
setlocal
rem You should write a proper ANSI codepage for your Windows settings.
rem Unfortunately, vbs doesn't work with utf-8.
chcp 1251 >nul
rem #################################################################################################################################
rem
rem Run the script whose fullpath is passed as the first argument with admin privileges.
rem %1 must contain the full path of the calling script.
rem The script must be called as sudo "D:\Programs\one.cmd".
rem
rem #################################################################################################################################
if "%~1"=="" (
    echo There must be at least the first argument with the full pathname of the script to execute.
    exit /b
)

rem If a file is found by its name and extensions only, its folder is %cd%.
if exist "%~nx1" (
    set scriptToExecutFullPath=%cd%\%~nx1
    goto we_have_got_fullpath_name
)
rem If a file is found by its full name, we've got it.
rem After we check if it is found by its name and extensions only
if exist "%~1" (
    set scriptToExecutFullPath=%~1
    goto we_have_got_fullpath_name
)

rem Trying to get the fullpath name of the script to execute using the where command
FOR /f "usebackq tokens=* delims=" %%W in (`where "%~1" 2^>nul`) do set "scriptToExecutFullPath=%%W"
if "%scriptToExecutFullPath%"=="" (
     echo There is no "%~1" script  to execute.
     exit /b
)

:we_have_got_fullpath_name
rem Creating a command line with the main script and its arguments
set commandLine=""%scriptToExecutFullPath%""
SHIFT

:loop_to_form_command_line
    if "%~1" == "" goto end
    rem If there are double quotes, double them again
    rem Else add argument without quotes
    if "%~1" == %1 (
        set commandLine=%commandLine% ""%~1""
    ) else (
        set commandLine=%commandLine% %~1
    )
    SHIFT
    goto loop_to_form_command_line
:end

rem Check admin rights and create VBS script to elevate
net session>nul 2>&1 || (

    rem Create VBS script
    echo Set UAC = CreateObject^("Shell.Application"^)>"%TEMP%\elevate.vbs"
    echo UAC.ShellExecute "cmd.exe", " /c ""  cd /d ""%cd%"" &&  %commandLine% """, "", "runas", 1 >>"%TEMP%\elevate.vbs"
    if exist "%TEMP%\elevate.vbs" start /b /wait cscript /nologo "%TEMP%\elevate.vbs" 2>&1

    rem Delete elevation script if exist
    if exist "%TEMP%\elevate.vbs" >nul del /f "%TEMP%\elevate.vbs" 2>&1

    exit /b
)

rem If there was no need to elevate, then just execute
call %*