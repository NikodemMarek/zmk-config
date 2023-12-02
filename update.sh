#!/bin/sh

unzip -o -q .tmp/firmware.zip -d .tmp/

mkdir .tmp/nicenano/
sudo mount /dev/sda .tmp/nicenano/

sudo rm -f .tmp/nicenano/CURRENT.UF2
sudo cp $(find .tmp -name *left*) .tmp/nicenano/CURRENT.UF2

sudo umount .tmp/nicenano/

rm -rf .tmp/*
