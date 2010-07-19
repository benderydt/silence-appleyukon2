package: silence-appleyukon2
author: Ben De Rydt
site: http://benderydt.com/tech/silence-appleyukon2/
license: Public domain

This package installs as script to stop annoying AppleYukon2 deadman_reset
messages in /var/log/kernel.log .

The script pings the default gateway once every minute.  It will be launched by
launchd, whenever the network configuration changes.

You can install the script by 

$ cd <path of this package>
$ sudo ./install.sh

You need to uninstall it by using

$ cd <path of this package>
$ sudo ./uninstall.sh


