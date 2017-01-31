#!/bin/sh

echo 11 > /sys/class/gpio/export
echo in > /sys/class/gpio/gpio11/diretion
echo 6 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio6/diretion
echo 0 > /sys/class/gpio/gpio6/value

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
