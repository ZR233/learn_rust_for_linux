qemu-system-aarch64 \
    -machine virt -m 2G \
    -kernel  /mnt/sdb/dev/linux-rust/arch/arm64/boot/Image.gz\
    -initrd dqib_amd64-pc/initrd  \
    -nographic -append "root=LABEL=rootfs console=ttyAMA0" 