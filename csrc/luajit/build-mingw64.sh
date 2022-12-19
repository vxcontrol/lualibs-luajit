export LUA_PATH_DEFAULT=".\\\\?.lua;!\\\\..\\\\..\\\\?.lua;!\\\\..\\\\..\\\\?\\\\init.lua"
export LUA_CPATH_DEFAULT=".\\\\?.dll;!\\\\clib\\\\?.dll;!\\\\loadall.dll"
[ `uname` = Linux ] && { export CROSS=x86_64-w64-mingw32-; export TARGET_SYS=Windows; }
[[ `uname` = *MINGW* ]] && { export MAKE=mingw32-make; }
P=mingw64 HOST_CC="gcc" CFLAGS="-fPIC" LDFLAGS=-static-libgcc X0=luajit.exe X=luajit-bin.exe D=lua51.dll A=luajit.a ./build.sh
