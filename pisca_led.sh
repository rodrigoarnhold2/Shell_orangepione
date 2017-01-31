#!/bin/sh

# Inicializa a gpio12 (PA12) - (1 - 1)*32 + 12 = 12
echo 12 > /sys/class/gpio/export
# Declara a gpio12 como saida
echo "out" > /sys/class/gpio/gpio12/direction
# Inicializa a saida com nivel logico 0 (led desligado)
echo 0 > /sys/class/gpio/gpio12/value

#loop infinito
while true
do
	#Liga o led (gpio12)
	echo 1 > /sys/class/gpio/gpio12/value
	#Aguarda 1 segundo
	sleep 1
	#Desliga o led
	echo 0 > /sys/class/gpio/gpio12/value
	sleep 1
done
