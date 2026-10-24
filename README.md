# FuckSetupApp
A shell script used to remove Setup.app on firmware version 6.0 - 12.4.4 / 13.0 - 13.2.3

From 3.0 I will not provide sshrd folders (sshrd, sshrd-u8) in my repository, they'll only be released in Releases

Please read the tutorial.txt in my repo to learn how to use it.

I'm currently attempting to implement it on Windows, but NO ETAs. For now, only macOS and Linux is supported. You may use the Linux Mint/Ubuntu's LiveCD to use this script

## "$Me" != "A_Greedy_Man"

This script will neither connect to any servers, requires registering ECID nor paying mulas, The only thing you need is to download it, run the executable "fsa" to complete the removal

## About the usbliter8 BootROM PoC
Due to the existence of usbliter8, IF A12/A13 device's ramdisk is obtainable, you can even use this script on A12+ devices

This issue is solved by dev orangera1n, original repo at https://github.com/Orangera1n/spironolactone

Initial support for usbliter8 vulnerable devices is in v2.0, however it's VERY EXPERIMENTAL, and have a high chance that might NOT success.

If you found any bug during extracting and booting the ramdisk, please report the issue to the repo mentioned above!

## The Principle
Thanks for "setupapp" at bilibili for providing the principle of bypass activation, original video at (https://www.bilibili.com/video/BV1NjJn6QE97/?spm_id_from=333.337.search-card.all.click&vd_source=3a81f8c290a79fce7b128695ba73b6cd), please support him if you could!

1. Create device's ramdisk by using SSH ramdisk

2. Boot ramdisk when device is in pwnDFU mode

3. Mount system partition under ramdisk environment

4. Execute Setup.app deletion command (that's why it's called FuckSetupApp)

5. Rename, or delete and rebuild system snapshot (Differs from different versions)

6. Execute DFU erase (Differs from different versions)

7. Perfect-o.

## Post-bypassing
Only renaming the system snapshot will cause Hello Screen to appear again when you restore rootFS. This script only contains commands deleting and rebuilding system snapshot, so anything related to restoring rootFS won't cause the Hello Screen to appear again.

## Special Thanks to

A12/A13 ramdisk: github.com/Orangera1n/spironolactone

A7-A11 ramdisk: github.com/verygenericname/SSHRD_Script

32bit devices' ramdisk: github.com/LukeZGD/Legacy-iOS-Kit
