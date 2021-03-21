#!/bin/bash

mkdir /rescue
mount -o nouuid /dev/sdc4 /rescue
mount -o nouuid /dev/sdc3 /rescue/boot/
mount /dev/sdc2 /rescue/boot/efi
cd /rescue
mount -t proc proc proc
mount -t sysfs sys sys/
mount -o bind /dev dev/
mount -o bind /dev/pts dev/pts/
mount -o bind /run run/
chroot /rescue /bin/bash -c "/usr/sbin/shim-install"