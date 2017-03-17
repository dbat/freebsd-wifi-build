#!/bin/sh
# it shoul have been fixed with Makefile patch

# cwd=`pwd`
local=../../staging/usr/local
drop=dropbearmulti
bear=dropbear

for f in $local/bin/*; do
  test -L "$f" && ln -sf "$drop" "$f"
done

ln -sf "../bin/$drop" "$local/sbin/$bear"
