#! /bin/bash

# A script to stop annoying AppleYukon2 deadman_reset messages
# by pinging the default gateway once every minute.
# To be launched by launchd.
# 
# author: Ben De Rydt
# site: http://benderydt.com/tech/silence-appleyukon2/
# license: Public domain

set -e

echo "Starting up..."

while true
do
	# sleep first
	# launchd launches too fast, we may not have gotten a DHCP address yet
	sleep 60

	# bail out if the ethernet card is inactive
	# we're called by launchd on any network configuration change
	if ifconfig en0 | grep 'status: *inactive' >/dev/null 2>&1
	then
		echo "Ethernet card inactive. Exiting..." >&2
		exit 1
	fi

	# find our gateway
	gateway=$(route get default | grep gateway | sed 's/ *gateway: *\([0-9.][0-9.]*\) */\1/g')

	# ping every minute with a custom payload
	# the custom payload makes it easy to distinguish this ping in ps(1)'s output.
	if ! ping -c 1 -q -p 'bddefa' "$gateway" >/dev/null 2>&1
	then
		echo "Ping failed. Exiting..." >&2
		exit 2
	fi
done
