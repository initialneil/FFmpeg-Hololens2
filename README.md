FFmpeg Libs for Hololens2
=========
- forked from https://github.com/M2Team/FFmpegUniversal


### Basics
- Hololens2 runs on UWP(Universal Windows Platform, or Windows Store standard) ARM64
- ffmpeg libs can be compiled against UWP ARM64 for Hololens2, and x64 for Hololens2 Emulator
- This repo used Msys2 and VS2019 to compile
- ffmpeg is free to use(LGPL license) but x264 is not

### Prebuilt
- UWP x64/ARM64/ARM was compiled with vs2019
	- [ARM64 Static .a](https://www.jianguoyun.com/p/Ddxq45kQ8b6SBhjs6aQD) Recommended for Hololens2
	- [x64 Shared .lib and .dll](https://www.jianguoyun.com/p/DRYo_2EQ8b6SBhi496ED)
	- [x64 Static .a](https://www.jianguoyun.com/p/DSg71E4Q8b6SBhi896ED) Recommended for Hololens2 Emulator
	- [ARM Static .a](https://www.jianguoyun.com/p/DeQ39C4Q8b6SBhjw6aQD) Recommended for Hololens1 (not tested)

- PS: Windows10 Home Edition doesn't support Hololens2 Emulator (Tested)

### Compile
#### 1. Install vs2019
- Enable C++
- Enable Universal Windows Platform

#### 2. Setup Msys2
- Download and install [Msys2](https://www.msys2.org/). [Download exe](https://github.com/msys2/msys2-installer/releases/download/2020-06-02/msys2-x86_64-20200602.exe)
- **[Important]** Edit msys2_shell.cmd to remove `rem` before `set MSYS2_PATH_TYPE=inherit`. So that msys cmd will inherit path when called.
- In cmd.exe, open x64 version of Msys2, and install tools
	````
	// In cmd.exe
	"C:\msys64\msys2_shell.cmd" -mingw64
	
	// In shell
	pacman -S mingw-w64-x86_64-toolchain nasm
	// Press return to select ALL
	````

#### 3. Confirm Compile Tools
- In cmd.exe, call vs2019's compile prompt tool `vcvarsall.bat`. For example:
	````
	// In cmd.exe
	"C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x86_amd64 uwp
	// vs environment will be setup

	// call shell
	"C:\msys64\msys2_shell.cmd" -mingw64 --login

	// In shell
	which cl link nasm cpp
	// all should be found
	// cl and link should come from vs2019
	
	````
	![](https://raw.githubusercontent.com/initialneil/FFmpeg-Hololens2/master/img-01-shell.png)

	
#### 4. Compile
- Edit `MSYS2_SHELL` in `BuildFFmpegUniversal.bat`, for example:
	````
	set MSYS2_SHELL=C:\msys64\msys2_shell.cmd
	````
- Open cmd.exe, goto this repo, run `BuildFFmpegUniversal.bat`
	![](https://raw.githubusercontent.com/initialneil/FFmpeg-Hololens2/master/img-02-compile.png)

- FYI:
	- `BuildFFmpegUniversal.bat` calls `FFmpegUniversal\BuildFFmpegUniversalInternal.bat`, which setup vs2019, call shell and runs `BuildFFmpeg.sh`.
	- If something fails in the middle, you can setup vs2019 and run BuildFFmpeg.sh in you own cmd.exe and shell (Section 5).
	- The old versions setup folder in FFmpeg (for example Output/Windows10/x64) and run `../../../../FFmpeg/configure`. It somehow generate 'src/libavdevice/alldevices.c` not found error. So I run `./configure` directly from FFmpeg's root folder.

#### 5. Compile step by step (if Section 4 failed)
- In cmd.exe, enable vs2019
	````
	"C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x86_amd64 uwp
	````
- call shell
	````
	"C:\msys64\msys2_shell.cmd" -mingw64 --login
	````
- run build.sh
	````
	// static ARM64
	./FFmpegUniversal/BuildFFmpeg.sh Static ARM64
	// or shared x64
	./FFmpegUniversal/BuildFFmpeg.sh Shared x64
	````

### Reference
- https://github.com/M2Team/FFmpegUniversal
- https://www.jianshu.com/p/5f175dec9109
- https://github.com/microsoft/FFmpegInterop
- https://github.com/ffmpeginteropx/FFmpegInteropX
