set -e
cd src/src || exit 1
bindir=../../../../bin/$P

CFLAGS="$CFLAGS \
-DLUAPOWER_BUILD \
-DLUAJIT_ENABLE_LUA52COMPAT \
-DLUA_PATH_DEFAULT='\"$LUA_PATH_DEFAULT\"'  \
-DLUA_CPATH_DEFAULT='\"$LUA_CPATH_DEFAULT\"' \
"

[ "$CC" ] || CC=gcc
[ "$HOST_CC" ] || HOST_CC=gcc
[ "$MAKE" ] || MAKE=make

"$MAKE" VERBOSE=1 HOST_CC="$HOST_CC" CC="$CC" clean
"$MAKE" VERBOSE=1 HOST_CC="$HOST_CC" CC="$CC" amalg Q=" " CFLAGS="$CFLAGS"

mkdir -p $bindir

[ "$X0" ] || X0=$X; cp -f $X0 "$bindir/$X"
[ "$D0" ] || D0=$D; cp -f $D0 "$bindir/$D"

mkdir -p $bindir/../../jit
cp -f jit/*.lua $bindir/../../jit/
cp -f jit/vmdef.lua $bindir/../../jit/vmdef_$P.lua
cp -f ../../vmdef.lua $bindir/../../jit/vmdef.lua

[[ $P = *mingw* ]] && {
    "$MAKE" VERBOSE=1 HOST_CC="$HOST_CC" CC="$CC" clean
    "$MAKE" VERBOSE=1 HOST_CC="$HOST_CC" CC="$CC" amalg Q=" " BUILDMODE=static CFLAGS="$CFLAGS"
}

cp -f libluajit.a $bindir/$A

"$MAKE" HOST_CC="$HOST_CC" CC="$CC" clean
