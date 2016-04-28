#!/bin/sh

echo "Making directories"
mkdir -p /proc
mkdir -p /sys
mkdir -p /etc
mkdir -p /dev

echo "Mounting /proc filesystem"
mount -t proc proc /proc

echo "Mounting /sys"
mount -t sysfs sysfs /sys

echo "Mounting /dev"
mount -t devtmpfs dev /dev

echo "Mounting /dev/pts"
mkdir /dev/pts
mount -t devpts devpts /dev/pts

echo "Starting udhcpc"
udhcpc

echo "Starting telnetd"
telnetd -l /bin/sh

/bin/systeminfo

exec /bin/sh
