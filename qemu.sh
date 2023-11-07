#!/bin/bash

qemu-system-aarch64 \
    -nographic \
    -M virt \
    -cpu cortex-a57 \
    -smp 2 \
    -m 4G \
    -kernel /mnt/sdb/dev/linux/build/arch/arm64/boot/Image \
    -append "nokaslr root=/dev/vda init=/linuxrc console=ttyAMA0 console=ttyS0" \
    -hda disk.ext3

