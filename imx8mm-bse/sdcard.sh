#!/bin/bash
source env.sh

# test sdcard disk read/write
function test_sdcard() {
	readonly local LOG_FILE="${OUTFOLDER}/sdcard_write.log"
	readonly local TEST_DISK="${SDCARD_PATH}"
	readonly local TEST_FILE="${TEST_DISK}/sdcard_write.bin"
	readonly local READ_DEV=`df | grep ${TEST_DISK} | awk '{ print $1 }'`

	function write_disk() {
		echo -e "\nwrite testing for ${TEST_DISK}\n" >> ${LOG_FILE}
		dd if=/dev/zero of=${TEST_FILE} bs=1M count=50 oflag=direct 2>> ${LOG_FILE}
		sync
		sleep 1	
		local write_size=$(du -m ${TEST_FILE} | awk '{ print $1 }')
		if [ "$write_size" -eq "50" ]; then
			echo -e "`date`, write ${write_size}Mbyte to ${TEST_FILE} success" >> ${LOG_FILE}
		else
			echo -e "`date`, Failed, only write ${write_size}MByte to ${TEST_FILE}" >> ${LOG_FILE}
		fi
	}

	function read_disk() {
		echo -e "\nread testing for ${READ_DEV}" >> ${LOG_FILE}
		hdparm -Tt ${READ_DEV} >> ${LOG_FILE}
		if [ $? -ne 0 ]; then
			echo -e "\n***\n***\n***\n`date`, SD card read error" >> ${LOG_FILE}
		else
			echo -e "`date`, SD card read success" >> ${LOG_FILE}
		fi
	}
	
	touch ${LOG_FILE}
	while :
	do
		if [ -d ${TEST_DISK} ]; then
			write_disk
			sync
			sleep 1
			read_disk
		else
			echo -e "SD card isn't plug in" >> ${LOG_FILE}
		fi
		sync
		sleep 1
	done	
}

test_sdcard