qemu-system-aarch64 \
    -machine 'virt' -cpu 'cortex-a57'  \
    -m 1G \
    -kernel /mnt/sdb/dev/linux/build/arch/arm64/boot/Image \
    -initrd initrd  \
    -nographic -append "root=LABEL=rootfs console=ttyAMA0"