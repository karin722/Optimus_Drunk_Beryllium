# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=UmiNico Kernel by karin722
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=polaris
device.name2=
device.name3=
device.name4=
device.name5=
supported.versions=
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;


## AnyKernel install
dump_boot;

# Begin Ramdisk Changes
. /tmp/anykernel/tools/fstab.sh;

# init.rc
backup_file init.rc;
insert_line init.rc "init.optimus.rc" after "import /init.usb.configfs.rc" "import /init.optimus.rc";

write_boot;
## end install

