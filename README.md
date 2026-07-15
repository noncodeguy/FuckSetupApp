## FuckSetupApp
A python-based script used to bypass iCloud Hello Activation on firmware version 6.0 - 12.4.4 / 13.0 - 13.2.3

使用方法：
Instruction:
`` git clone https://github.com/noncodeguy/FuckSetupApp.git && cd FuckSetupApp && chmod +x ./fsa && ./fsa ``
对于中国用户：
`` git clone https://gh-proxy.com/https://github.com/noncodeguy/FuckSetupApp.git && cd FuckSetupApp && chmod +x ./fsa && ./fsa ``

# 中文

一只基于python的iCloud激活锁绕过脚本，支持系统版本6.0 - 12.4.4 / 13.0 - 13.2.3

# 注意

目前仅支持A11及以下

本脚本不链接任何服务器，不需要注册ID，更不需要花钱，只需要下载到本地并运行fsa即可完成绕过

基于verygenericname的SSHRD_Script项目

本脚本 ###不支持### Windows，仅支持macOS和Linux，你可以使用Linux的LiveCD来使用本脚本


关于usbliter8的BootROM漏洞

由于usbliter8漏洞的存在，只要可以获得A12/A13设备的ramdisk并引导，你甚至可以在A12+的设备上使用此脚本

但是由于usbliter8目前漏洞利用并不成熟且需要开发板（30元），所以暂不适配

# 原理

感谢setupapp大大在b站提供的绕ID思路，原视频在 https://www.bilibili.com/video/BV1NjJn6QE97/?spm_id_from=333.337.search-card.all.click&vd_source=3a81f8c290a79fce7b128695ba73b6cd，有能力的请一定去支持他！

1. 使用SSHRD_Script创建设备的ramdisk
   
2. 进入破解DFU（pwnDFU）来引导ramdisk
   
3. 在ramdisk环境下挂载系统分区
   
4. 执行删除Setup.app命令（所以项目叫FuckSetupApp）
   
5. （因版本而异）删除并重新创建，或是重命名系统快照
    
6. （因版本而异）执行一次DFU抹除
  
7. 完美。

# 绕后须知事项

若是重命名系统快照，则刷机，升级或恢复rootFS则会再次跳激活。建议选择删除并重建系统快照，这样涉及到刷机和恢复rootFS等操作也不会跳激活锁，更彻底。

# English
A python-based iCloud Hello Activation Bypass script, supports firmware version 6.0 - 12.4.4 / 13.0 - 13.2.3

# Caution
Currently supports only A11 an below

This script will neither link to any servers, need registering ECID nor paying mulas, The only thing you need is to download it, run the fsa.sh to complete the bypass

Based on verygenericname's SSHRD_Script project

Windows is ### NOT ### capable of running this script, only macOS and Linux is supported. You may use the Linux's LiveCD to use this script

# About the usbliter8 BootROM PoC
Due to the existence of usbliter8, IF A12/A13 device's ramdisk is obtainable, you can even use this script on A12+ devices

But the exploit is still in early development and needs a Waveshare / Raspberry Pi board, so currently there will be no support for A12+

# The Principle
Thanks for "setupapp" at bilibili for providing the of bypass activation, original video source at (https://www.bilibili.com/video/BV1NjJn6QE97/?spm_id_from=333.337.search-card.all.click&vd_source=3a81f8c290a79fce7b128695ba73b6cd), please support him if you could!

1. Create device's ramdisk by using SSHRD_Script

2. Boot ramdisk when device is in pwnDFU mode

3. Mount system partition under ramdisk environment

4. Execute Setup.app deletion command (that's why it's called FuckSetupApp)

5. Rename, or delete and rebuild system snapshot (Differs from different versions)

6. Execute DFU erase (Differs from different versions)

7. Perfect-o.

# Post-bypassing
Only renaming the system snapshot will cause Hello Screen to appear again when you restore/upgrade/restore rootFS. I recommend deleting and rebuilding system snapshot, so anything related to restoring rootFS won't cause the Hello Screen to appear again.
