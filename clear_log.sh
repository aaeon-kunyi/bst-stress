#!/bin/bash
source env.sh

LOG_PREFIX_PATH="/root/test/${TARGET}/TESTOUT"

if [ -f ${LOG_PREFIX_PATH}/sdwrite.log ]; then
echo `tail -n 1 ${LOG_PREFIX_PATH}/sdwrite.log` > ${LOG_PREFIX_PATH}/sdwrite.log
fi

if [ -f ${LOG_PREFIX_PATH}/usb1_read.log ]; then
echo `tail -n 1 ${LOG_PREFIX_PATH}/usb1_read.log` > ${LOG_PREFIX_PATH}/usb1_read.log
fi
if [ -f ${LOG_PREFIX_PATH}/usb2_read.log ]; then
echo `tail -n 1 ${LOG_PREFIX_PATH}/usb2_read.log` > ${LOG_PREFIX_PATH}/usb2_read.log
fi

if [ -f ${LOG_PREFIX_PATH}/usb3_read.log ]; then
echo `tail -n 1 ${LOG_PREFIX_PATH}/usb3_read.log` > ${LOG_PREFIX_PATH}/usb3_read.log
fi

if [ -f ${LOG_PREFIX_PATH}/usb4_read.log ]; then
echo `tail -n 1 ${LOG_PREFIX_PATH}/usb4_read.log` > ${LOG_PREFIX_PATH}/usb4_read.log
fi

if [ -f ${LOG_PREFIX_PATH}/usb5_read.log ]; then
echo `tail -n 1 ${LOG_PREFIX_PATH}/usb5_read.log` > ${LOG_PREFIX_PATH}/usb5_read.log
fi

if [ -f ${LOG_PREFIX_PATH}/usb6_read.log ]; then
echo `tail -n 1 ${LOG_PREFIX_PATH}/usb6_read.log` > ${LOG_PREFIX_PATH}/usb6_read.log
fi

if [ -f ${LOG_PREFIX_PATH}/eth0.log ]; then
echo `tail -n 1 ${LOG_PREFIX_PATH}/eth0.log` > ${LOG_PREFIX_PATH}/eth0.log
fi

if [ -f ${LOG_PREFIX_PATH}/ppp0.log ]; then
echo `tail -n 1 ${LOG_PREFIX_PATH}/ppp0.log` > ${LOG_PREFIX_PATH}/ppp0.log
fi

chmod 0664 ${LOG_PREFIX_PATH}/*
