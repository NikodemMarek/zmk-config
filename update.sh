#!/bin/sh

echo "put the nice!nano into bootloader, flashing in 5 seconds..."
sleep 5
echo "flashing..."

unzip -o -q $(find .tmp -name *.zip) -d .tmp/

mkdir .tmp/nicenano/
sudo mount /dev/sda .tmp/nicenano/

sudo rm -f .tmp/nicenano/CURRENT.UF2
sudo cp $(find .tmp -name *left*) .tmp/nicenano/CURRENT.UF2

sudo umount .tmp/nicenano/

rm -rf .tmp/*
