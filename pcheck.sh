#!/bin/bash

source env.sh

readonly LOG_FILE="/root/test/${TARGET}/TESTOUT/log.log"
readonly REL_TARGET_DIR="./${TARGET}"
touch $LOG_FILE
echo "porgram starting"

sleep 2
while [ true ]
do
	c=0
	if [ "$(ps aux | grep /bin/bash | grep /root/test/${TARGET}/lan_ping.sh | awk '{print $12}')" != "/root/test/SRG3352_stress/lan_ping.sh" ]; then
		echo "lan_ping.sh isn't working "`date` >> $LOG_FILE
		c=1
	fi
	if [ "$(ps aux | grep /bin/bash | grep sdcard.sh | awk '{print $12}')" != "${REL_TARGET_DIR}/sdcard.sh" ]; then
		echo "sdcard.sh isn't working "`date` >> $LOG_FILE
		c=1
	fi
	if [ "$(ps aux | grep /bin/bash | grep sdcard.sh | awk '{print $12}')" != "${REL_TARGET_DIR}/sdcard.sh" ]; then
		echo "sdcard.sh isn't working "`date` >> $LOG_FILE
		c=1
	fi
	if [ "$(ps aux | grep /bin/bash | grep -e "usb.sh 1" | awk  '{ print $12,$13 }' )" != "${REL_TARGET_DIR}/usb.sh 1" ]; then
		echo "usb.sh 1 isn't working "`date` >> $LOG_FILE
		c=1
	fi
	if [ "$(ps aux | grep /bin/bash | grep -e "usb.sh 2" | awk  '{ print $12,$13 }' )" != "${REL_TARGET_DIR}/usb.sh 2" ]; then
		echo "usb.sh 2 isn't working "`date` >> $LOG_FILE
		c=1
	fi
	if [ "$(ps aux | grep /bin/bash | grep -e "usb.sh 3" | awk  '{ print $12,$13 }' )" != "${REL_TARGET_DIR}/usb.sh 3" ]; then
		echo "usb.sh 3 isn't working "`date` >> $LOG_FILE
		c=1
	fi
	if [ "$(ps aux | grep /bin/bash | grep -e "usb.sh 4" | awk  '{ print $12,$13 }' )" != "${REL_TARGET_DIR}/usb.sh 4" ]; then
		echo "usb.sh 4 isn't working "`date` >> $LOG_FILE
		c=1
	fi
	if [ "$(ps aux | grep /bin/bash | grep -e "usb.sh 5" | awk  '{ print $12,$13 }' )" != "${REL_TARGET_DIR}/usb.sh 5" ]; then
		echo "usb.sh 5 isn't working "`date` >> $LOG_FILE
		c=1
	fi
	if [ "$(ps aux | grep /bin/bash | grep -e "usb.sh 6" | awk  '{ print $12,$13 }' )" != "${REL_TARGET_DIR}/usb.sh 6" ]; then
		echo "usb.sh 6 isn't working "`date` >> $LOG_FILE
		c=1
	fi
	fi
	if [ "$(ps aux | grep /bin/bash | grep lan_ping.sh | awk '{print $12}')" != "${REL_TARGET_DIR}/lan_ping.sh" ]; then
		echo "lan_ping.sh isn't working "`date` >> $LOG_FILE
		c=1
	fi	

	if [ $c == 0 ]; then
		echo "program still running...`date +%T`"
	fi
	sleep 2
done
