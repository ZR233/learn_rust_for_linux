#!/bin/bash

MOUNT_DIR=./mnt
CURR_DIR=`pwd`
rm -rf $MOUNT_DIR
rm disk.ext3
dd if=/dev/zero of=./disk.ext3 bs=1M count=32
mkfs.ext3 disk.ext3

mkdir -p $MOUNT_DIR
sudo mount -o loop disk.ext3 $MOUNT_DIR

sudo cp -arf /mnt/sdb/dev/busybox-1.36.1/_install/* $MOUNT_DIR

cd $MOUNT_DIR
sudo mkdir -p etc dev mnt proc sys tmp mnt etc/init.d/ lib lib/module var var/run
echo "proc /proc proc defaults 0 0" > etc/fstab
echo "tmpfs /tmp tmpfs defaults 0 0" >> etc/fstab
echo "sysfs /sys sysfs defaults 0 0" >> etc/fstab

echo "#!/bin/sh" > etc/init.d/rcS
echo "mount -a" >> etc/init.d/rcS
echo "mount -o remount,rw /" >> etc/init.d/rcS
echo "echo -e \"Welcome to ARM64 Linux\"" >> etc/init.d/rcS
chmod 755 etc/init.d/rcS

echo "::sysinit:/etc/init.d/rcS" > etc/inittab
echo "::respawn:-/bin/sh" >> etc/inittab
echo "::askfirst:-/bin/sh" >> etc/inittab
chmod 755 etc/inittab

cd dev
mknod console c 5 1
mknod null c 1 3
mknod tty1 c 4 1


cd $CURR_DIR
sudo umount $MOUNT_DIR
echo "make initrd ok!"
chmod 777 disk.ext3