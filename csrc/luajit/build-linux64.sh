export LUA_PATH_DEFAULT="./?.lua;!/../../?.lua;!/../../?/init.lua"
export LUA_CPATH_DEFAULT="./?.so;!/clib/?.so;!/loadall.so"
MAKE=make P=linux64 CFLAGS="-pthread -fPIC" \
	LDFLAGS="-pthread -s -static-libgcc -Wl,-rpath,'\$\$ORIGIN'" \
	X0=luajit X=luajit-bin D=libluajit.so A=libluajit.a ./build.sh
