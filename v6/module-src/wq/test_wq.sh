#!/bin/sh

MOD_NAME="wq"

echo
echo "** Module info"
modinfo $MOD_NAME.ko

echo
echo "** Loading module..."
modprobe $MOD_NAME
dmesg | grep -i $MOD_NAME | tail -1

echo
echo "** /proc/devices"
cat /proc/devices | grep -i $MOD_NAME

echo
echo "** Removing module..."
rmmod $MOD_NAME
dmesg | grep -i $MOD_NAME | tail -1
