#! /bin/sh

set -e

. ./config.sh

if [ "$UID" -ne 0 ]
then
	echo "Please use sudo $0" >&2
	exit 1
fi

launchctl unload -w "$PLISTDIR/$MYPLIST"
rm "$SBIN/$MYSCRIPT"
