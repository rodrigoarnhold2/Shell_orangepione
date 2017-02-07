#!/bin/sh

echo 11 > /sys/class/gpio/export
echo in > /sys/class/gpio/gpio11/direction
echo 6 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio6/direction
echo 0 > /sys/class/gpio/gpio6/value

trap "echo 11 > /sys/class/gpio/unexport; echo 6 > /sys/class/gpio/unexport; exit 0" 1 2 15
#1 - HANGUP
#2 - INTERRUPT
#15 - TERMINATE


while true
do
	botao=$( cat /sys/class/gpio/gpio11/value)

	if [ "$botao" -eq 1 ];
		then
			echo 1 > /sys/class/gpio/gpio6/value
		else
			echo 0 > /sys/class/gpio/gpio6/value
	fi
sleep 0.5
done
