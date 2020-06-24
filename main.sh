#!/bin/bash
source env.sh
./${TARGET}/led.sh &
./${TARGET}/usb.sh 1 &
./${TARGET}/usb.sh 2 &
./${TARGET}/usb.sh 3 &
./${TARGET}/usb.sh 4 &
./${TARGET}/usb.sh 5 &
./${TARGET}/usb.sh 6 &
./${TARGET}/sdcard.sh &
./${TARGET}/lan_ping.sh &
