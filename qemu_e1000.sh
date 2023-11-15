# qemu-system-x86_64 \
#  -machine 'pc' -cpu 'Nehalem' -m 1G \
#  -drive file=dqib_amd64-pc/image.qcow2 \
#  -kernel /mnt/sdb/dev/linux-e1000/arch/x86_64/boot/bzImage \
#  -initrd dqib_amd64-pc/initrd -nographic -append "root=LABEL=rootfs console=ttyS0" \
#  -hda disk_x86.ext4
qemu-system-x86_64 \
 -m 2G \
 -kernel /mnt/sdb/dev/linux-e1000/arch/x86_64/boot/bzImage \
 -nographic \
 -append "nokaslr root=/dev/sda init=/linuxrc console=ttyAMA0 console=ttyS0" \
 -hda disk_x86_64.ext4 \
 -netdev user,id=n1,ipv6=off -device e1000,netdev=n1
