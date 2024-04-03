#!/bin/sh

echo "put the nice!nano into bootloader, flashing in 5 seconds..."
sleep 5
echo "flashing..."

export GH_TOKEN=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 # Read-only access to artifacts
gh run download --dir .tmp/ --repo NikodemMarek/zmk-config -n firmware

mkdir .tmp/nicenano/
sudo mount /dev/sda .tmp/nicenano/

sudo rm -f .tmp/nicenano/CURRENT.UF2
sudo cp $(find .tmp -name *left*) .tmp/nicenano/CURRENT.UF2

sudo umount .tmp/nicenano/

rm -rf .tmp/*
