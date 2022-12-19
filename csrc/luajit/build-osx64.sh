[ `uname` = Linux ] && { export CROSS=x86_64-apple-darwin19-; export TARGET_SYS=Darwin; }
P=osx64 HOST_CC="gcc" CFLAGS="-fPIC" \
	TARGET_CFLAGS="-arch x86_64 -fPIC" \
	TARGET_LDFLAGS="-arch x86_64" ./build-osx.sh
