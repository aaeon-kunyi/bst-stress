#!bin/bash

TARGET="imx8mm-bse"
OUTFOLDER="/root/test/${TARGET}/TESTOUT"
if [ ! -d $OUTFOLDER ]; then
	mkdir -p $OUTFOLDER
fi

ETH0_IP=`ifconfig eth0 | grep fe80 | head -n 1 | awk '{print $2}'`
PPP0_IP=`ifconfig ppp0 | grep inet | head -n 1 | awk '{print $2}'`
SDCARD_PATH="/media/SDCARD"
USBDISK_PATH="/media/USB"
