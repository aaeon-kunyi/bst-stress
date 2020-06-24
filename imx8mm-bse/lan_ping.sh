#!/bin/bash
source env.sh

touch $OUTFOLDER/eth0.log
touch $OUTFOLDER/ppp0.log

function ETH0_PING() {
	local i=0

	if [ "${ETH0_IP}" == "" ]; then
		eval ETH0_IP=`ifconfig eth0 | grep 'inet6' | awk '{print $2}'`
	fi	

	if [ "${ETH0_IP}" != "" ]; then
		ping -I eth0 $ETH0_IP -c 1 >> $OUTFOLDER/eth0.log
		if [ $? -ne 0 ]; then
			while [ "${i}" != "5" ]
			do
				ping -I eth0 $ETH0_IP -c 1 >> $OUTFOLDER/eth0.log
				if [ $? -ne 0 ]; then
					if [ "${i}" == "4" ]; then
						echo "eth0 ping $HOSTIP error, time : `date`" >> $OUTFOLDER/eth0.log
						ETH0_IP=""
					fi
				else
					echo "eth0 ping $HOSTIP success, time : `date`" >> $OUTFOLDER/eth0.log 
					i=5
				fi
				i=$(($i+1))
				sleep 1
				echo "i : ${i}" >> $OUTFOLDER/eth0.log
			done
		else
			echo "eth0 ping $HOSTIP success, time : `date`" >> $OUTFOLDER/eth0.log 
		fi
	else
		echo "ETH0_IP is null" >> $OUTFOLDER/eth0.log
	fi	
}

function PPP0_PING() {
	local i=0

	if [ "${PPP0_IP}" == "" ]; then
		eval PPP0_IP=`ifconfig ppp0 | grep 'inet' | awk '{print $2}'`
	fi

	if [ "${PPP0_IP}" != "" ]; then
		ping -I ppp0 $PPP0_IP -c 1 >> $OUTFOLDER/ppp0.log
		if [ $? -ne 0 ]; then
			while [ "${i}" != "5" ]
			do
				ping -I ppp0 $PPP0_IP -c 1 >> $OUTFOLDER/ppp0.log
				if [ $? -ne 0 ]; then
					if [ "${i}" == "4" ]; then
						echo "ppp ping $HOSTIP error, time : `date`" >> $OUTFOLDER/ppp0.log
						PPP0_IP=""
					fi
				else
					echo "ppp0 ping $HOSTIP success, time : `date`" >> $OUTFOLDER/ppp0.log
					i=5
				fi
				i=$(($i+1))
				sleep 1
				echo "i : ${i}" >> $OUTFOLDER/ppp0.log
			done
		else
			echo "ppp0 ping $HOSTIP success, time : `date`" >> $OUTFOLDER/ppp0.log
		fi
	else
		echo "PPP0_IP is null" >> $OUTFOLDER/ppp0.log
	fi	
}

while [ true ]
do
	ETH0_PING
	PPP0_PING
	sleep 10
done
