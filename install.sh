#! /bin/sh

set -e

. ./config.sh

if [ "$UID" -ne 0 ]
then
	echo "Please use sudo $0" >&2
	exit 1
fi

[ -d "$SBIN" ] || mkdir -p "$SBIN"

cp "$MYSCRIPT" "$SBIN"
sed "s!#sbin#!$SBIN!" < "$MYPLIST" > "$PLISTDIR/$MYPLIST"

launchctl load -w "$PLISTDIR/$MYPLIST"
