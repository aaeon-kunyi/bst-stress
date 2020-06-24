#!/bin/bash
source env.sh

function test_leds() {
	while :
	do
		local colors=("red" "blue" "yellow")
		for color in ${colors[@]}
		do
			echo -e "default-on" > /sys/class/leds/led_${color}/trigger
		done
		sleep 1
		for color in ${colors[@]}
		do
			echo -e "none" > /sys/class/leds/led_${color}/trigger
		done
		sleep 1
	done
}

test_leds