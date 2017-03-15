#!/bin/sh
# patch nginx objs/Makefile after configure for mips cross compile
# with module: ndk, lua and set-something
# needs environment variables: rootdir and package workdir
# pcre and lua51 should already be successfuly compiled 

# set | sed -n "/^[xXPpB]/p"
# read -p "PAUSED.." x
# set
# read -p "PAUSED.." x
# exit 1

objs_Makefile=objs/Makefile
[ -w "$objs_Makefile" ] || exit

XLLIBX="-lcrypt -lcrypto -lssl -lm -lz -lpcre -llua"
XLIBX="-L\$(SYSROOT) -L\$(SYSROOT)/lib -L\$(SYSROOT)/usr/lib -L\$(SYSROOT)/usr/local/lib -L\$(LIB_PCRE) -L\$(LIB_LUA)"
XLIBXX=`echo "${XLIBX}" | sed "s/ /,/g"`
XCCX="CC=LDFLAGS=--sysroot=\$(SYSROOT) ${X_PKG_CROSS_COMPILE}-gcc --sysroot=\$(SYSROOT)"
# echo XLIBXX="${XLIBXX}"

bak=.orig
if test -f "$objs_Makefile$bak"; then
	bak=1
	while test -f "$objs_Makefile-$bak"; do bak=$((bak+1)); done
	bak="-$bak"
fi

sed -i"$bak" \
  -e "1i\\
	HOME=${HOME}\\
	SYSROOT=${X_PKG_SYSROOT}\\
	PKG_DIR=${X_PACKAGE_BUILDROOT_DIR}\\
	SULI=staging/usr/local/include\\
	INC_PCRE=\$(PKG_DIR)/pcre/\$(SULI)\\
	INC_LUA=\$(PKG_DIR)/lua51/\$(SULI)\\
	LIB_PCRE=\$(INC_PCRE)/../lib\\
	LIB_LUA=\$(INC_LUA)/../lib\\
	\\
"\
  -e "\|^CC[ 	]*[?]*=.*$|s||${XCCX} ${XLIBX}|" \
  -e "\|^CFLAGS|s|$| ${X_PKG_CPU_ARGS} -I\$(SYSROOT)/usr/include -I\$(HOME)/local/include|" \
  -e "\|^CPP[ 	]*[?]*=.*$|s||CPP=${X_PKG_CROSS_COMPILE}-gpp|" \
  -e "\|^\([ 	]*\)-[Ll].*$|s||\1${XLLIBX} \\\\|" \
  -e "\|^[ 	]*-Wl,.*$|s|$|,${XLIBXX}|" \
"$objs_Makefile"

