REM @setlocal
@echo off

rem Set the code page to reduce the compilation warnings
chcp 65001

rem Export full current PATH from environment into MSYS2
set MSYS2_PATH_TYPE=inherit

rem Set the MSYS2 bash path
REM set MSYS2_BIN="C:\msys64\usr\bin\bash.exe"
REM set MSYS2_BIN=cmd.exe /c "C:\msys64\msys2_shell.cmd" -mingw64

set MSYS2_SHELL=C:\msys64\msys2_shell.cmd
set MSYS2_BIN="%MSYS2_SHELL%" -mingw64

rd /s /q "%~dp0Output"

REM call "%~dp0FFmpegUniversal\BuildFFmpegUniversalInternal.bat" x86
REM call "%~dp0FFmpegUniversal\BuildFFmpegUniversalInternal.bat" x64
REM call "%~dp0FFmpegUniversal\BuildFFmpegUniversalInternal.bat" ARM
call "%~dp0FFmpegUniversal\BuildFFmpegUniversalInternal.bat" ARM64

REM @endlocal