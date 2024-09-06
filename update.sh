#!/usr/bin/env bash

if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

FIRMWARE_ZIP=$1
if [ ! -f $FIRMWARE_ZIP ]; then
    echo "please provide a firmware zip file"
    exit 1
fi

FIRMWARE_DIR=$(mktemp -d)
echo "unpacking firmware to: $FIRMWARE_DIR"
unzip $FIRMWARE_ZIP -d $FIRMWARE_DIR

FIRMWARE_FILE=$(find $FIRMWARE_DIR -name *left*)
if [ ! -f $FIRMWARE_FILE ]; then
    echo "could not find firmware file"
    exit 1
fi
echo "found firmware file: $FIRMWARE_FILE"

echo "put the nice!nano into bootloader, flashing in 5 seconds..."
sleep 5

echo "mounting nice!nano..."
MOUNT_DIR=$(mktemp -d)
sudo mount /dev/sda $MOUNT_DIR

echo "flashing firmware..."
sudo cp -f $FIRMWARE_FILE $MOUNT_DIR/CURRENT.UF2
sleep 5

echo "unmounting nice!nano..."
sudo umount $MOUNT_DIR
