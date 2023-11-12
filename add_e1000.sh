MOUNT_DIR=./mnt
CURR_DIR=`pwd`
image=disk_x86_64.ext4


sudo mount -o loop $image $MOUNT_DIR
mkdir -p $MOUNT_DIR/lib/module
cp /home/zhourui/learn/e1000-driver/src/e1000_for_linux.ko $MOUNT_DIR/lib/module

cd $CURR_DIR
sudo umount $MOUNT_DIR