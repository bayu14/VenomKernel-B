# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() {
kernel.string=Welcome to the Rebirth package!
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=whyred
device.name2=Xiaomi
device.name3=Redmi Note 5/Pro
} # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;

android_ver=$(grep "^ro.build.version.release" /system/build.prop | cut -d= -f2);
case "$android_ver" in
  "8.0.0"|"8.1.0") support_status="supported";;
  *) support_status="unsupported";;
esac;
ui_print " ";
ui_print "Running Android $android_ver..."
ui_print "Rebirth is $support_status for this version!";

##########################################################################################
# Ramdisk Changes
##########################################################################################

chmod -R 750 $ramdisk/*;
chmod -R 755 $ramdisk/sbin/*;
chown -R root:root $ramdisk/*;

## AnyKernel install
dump_boot;

# Cumming
ui_print " ";
ui_print "Rebirth is installed on your whyred! ENJOY!";

# begin ramdisk changes
# end ramdisk changes

write_boot;

## end install

