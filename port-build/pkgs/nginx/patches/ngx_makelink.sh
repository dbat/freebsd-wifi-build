#!/bin/sh

# check whether environment variables are set
[ -n "${X_PACKAGE_BUILDROOT_DIR}" -a -n "${X_PORTBUILD_PORT}" -a -n "${PKGWORKSUBDIR}" ] || return

# check whether environment variables are correctly set
[ "`realpath "$PWD"`" = "`realpath "${X_PACKAGE_BUILDROOT_DIR}/${X_PORTBUILD_PORT}/work/${PKGWORKSUBDIR}" 2>/dev/null`" ] || return

# make link with name excluding vrsion number

# # makedir
# [ -d ../../../work ] || mkdir ../../../work
# OK: ln -shfv "../${X_PORTBUILD_PORT##*/}/work/${PKGWORKSUBDIR}" "../../../work/${PKGWORKSUBDIR%%-[0-9]*}"
# 
#
# OK: ln -shfv "${X_PORTBUILD_PORT##*/}/work/${PKGWORKSUBDIR}" "../../../${PKGWORKSUBDIR%%-[0-9]*}"

# just on direct parent only # so it will be cleaned-up automatically
ln -shfv "${PKGWORKSUBDIR}" "../${PKGWORKSUBDIR%%-[0-9]*}"
