oscheck=$(uname)
option=$1
bootchain=$2
BUILD=$(grep "BUILD" verinfo | cut -d':' -f2)
VERSION=$(grep "VERSION" verinfo | cut -d':' -f2)
#Spironolactone-10.1
BRANCH=$(git branch --show-current)

echo "Welcome to Spironolactone v"$VERSION" (Build: "$BUILD-$BRANCH")!"

if [ "$option" = boot ]; then
    if [ -n "$bootchain" ]; then
        sleep 3
        echo "Loading iBoot!"
        "$oscheck"/usbliter8_boot bootchain/"$bootchain"/iBoot.patched.bin
        sleep 4
      #  "$oscheck"/irecovery -f bootchain/"$bootchain"/logo.img4
      #  "$oscheck"/irecovery -c "setpicture 0x1"
      # SEP loading is disabled until further work
      #  if [[ -e bootchain/$bootchain/sep-firmware.img4 ]]; then
      #      echo "Loading SEP"
     #       "$oscheck"/irecovery -f bootchain/"$bootchain"/sep-firmware.img4
     #       "$oscheck"/irecovery -c sepfirmware
     #   fi
        echo "Loading Devicetree!"
        "$oscheck"/irecovery -f bootchain/"$bootchain"/devicetree.img4
        "$oscheck"/irecovery -c "devicetree"
        if [[ "$bootchain" == *"ramdisk" ]]; then
            echo "Loading Ramdisk!"
            "$oscheck"/irecovery -f bootchain/"$bootchain"/ramdisk.img4
            sleep 2
            irecovery -c ramdisk
        fi
        echo "Loading trustcache!"
        "$oscheck"/irecovery -f bootchain/"$bootchain"/trustcache.img4
        "$oscheck"/irecovery -c "firmware"
        echo "Loading AOP!"
        "$oscheck"/irecovery -f bootchain/"$bootchain"/AOP.img4
        "$oscheck"/irecovery -c "firmware"
        echo "Loading ANE!"
        "$oscheck"/irecovery -f bootchain/"$bootchain"/ANE.img4
        "$oscheck"/irecovery -c "firmware"
        echo "Loading AVE!"
        "$oscheck"/irecovery -f bootchain/"$bootchain"/AVE.img4
        "$oscheck"/irecovery -c "firmware"
        echo "Loading ISP!"
        "$oscheck"/irecovery -f bootchain/"$bootchain"/ISP.img4
        "$oscheck"/irecovery -c "firmware"
        echo "Loading GFX!"
        "$oscheck"/irecovery -f bootchain/"$bootchain"/GFX.img4
        "$oscheck"/irecovery -c "firmware"
        echo "Loading SIO!"
        "$oscheck"/irecovery -f bootchain/"$bootchain"/SIO.img4
        "$oscheck"/irecovery -c "firmware"
        echo "Loading and Booting Kernel!"
        "$oscheck"/irecovery -f bootchain/"$bootchain"/kernelcache.img4
        "$oscheck"/irecovery -c "bootx"
        if [[ "$bootchain" == *"ramdisk" ]]; then
            echo 'In a few seconds, you can SSH via ./ssh.sh'
        fi
else
        echo 'To boot, you need to provide a "boardconfig-version-build" combination with your "./spiro.sh boot" commnad'
    fi
else
    echo 'To boot, run the script as "./spiro.sh boot boardconfig-version-build"'
fi
