#!/bin/bash

qemu/build/aarch64-softmmu/qemu-system-aarch64 \
    -nographic \
    -M virt \
    -cpu cortex-a57 \
    -smp 2 \
    -m 4G \
    -kernel linux-6.0.9/build/arch/arm64/boot/Image \
    -append "nokaslr root=/dev/ram init=/linuxrc console=ttyAMA0 console=ttyS0" \
    -initrd initrd.ext4
