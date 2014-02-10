#!/system/bin/sh
log -t PackageManager "Start to remove /system/preinstall"
mount -o rw,remount -t ext4 /dev/block/platform/msm_sdcc.1/by-name/system /system 
rm -r system/preinstall
mount -o ro,remount -t ext4 /dev/block/platform/msm_sdcc.1/by-name/system /system
