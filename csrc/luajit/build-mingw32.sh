export LUA_PATH_DEFAULT=".\\\\?.lua;!\\\\..\\\\..\\\\?.lua;!\\\\..\\\\..\\\\?\\\\init.lua"
export LUA_CPATH_DEFAULT=".\\\\?.dll;!\\\\clib\\\\?.dll;!\\\\loadall.dll"
[ `uname` = Linux ] && { export CROSS=i686-w64-mingw32-; export TARGET_SYS=Windows; }
[[ `uname` = *MINGW* ]] && { export MAKE=mingw32-make; }
P=mingw32 HOST_CC="gcc -m32" CFLAGS="-fPIC" LDFLAGS=-static-libgcc X=luajit.exe D=lua51.dll A=luajit.a ./build.sh
