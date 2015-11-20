EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	1550 1150 1850 1150
Wire Wire Line
	1550 1550 1850 1550
$Comp
L Switch_DPST SW?
U 1 1 564F7446
P 2150 1350
F 0 "SW?" H 2150 1850 50  0000 C CNN
F 1 "DPST >2A" H 2150 1750 50  0000 C CNN
F 2 "On/Off switch" H 2150 1000 60  0000 C CNN
F 3 "" H 2150 1350 60  0000 C CNN
	1    2150 1350
	1    0    0    -1  
$EndComp
Text Label 950  1200 0    60   ~ 0
110/220VAC
Text Label 950  1600 0    60   ~ 0
110/220VAC
$Comp
L FUSE F?
U 1 1 564F755D
P 3050 1150
F 0 "F?" H 3150 1200 50  0000 C CNN
F 1 "1,25A" H 3050 1000 50  0000 C CNN
F 2 "" H 3050 1150 60  0000 C CNN
F 3 "" H 3050 1150 60  0000 C CNN
	1    3050 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 1150 2800 1150
$Comp
L TRANSFO4 T?
U 1 1 564F75F7
P 5150 1250
F 0 "T?" H 5150 1500 50  0000 C CNN
F 1 "TRANSFO4" H 5150 950 50  0000 C CNN
F 2 "" H 5150 1250 60  0000 C CNN
F 3 "" H 5150 1250 60  0000 C CNN
	1    5150 1250
	1    0    0    -1  
$EndComp
$Comp
L Switch_SPDT_x2 SW?
U 1 1 564F76C1
P 4000 1150
F 0 "SW?" H 3800 1300 50  0000 C CNN
F 1 "SPDT" H 3750 1000 50  0000 C CNN
F 2 "Voltage switch" H 3950 900 60  0000 C CNN
F 3 "" H 4000 1150 60  0000 C CNN
	1    4000 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 1150 3700 1150
Wire Wire Line
	4300 1050 4750 1050
Wire Wire Line
	4300 1250 4750 1250
Wire Wire Line
	2450 1550 4750 1550
Wire Wire Line
	4750 1550 4750 1450
Text Label 4400 1050 0    60   ~ 0
220VAC
Text Label 4400 1250 0    60   ~ 0
110VAC
Text Label 4350 1650 0    60   ~ 0
NEUTRAL
Wire Wire Line
	5550 1050 6000 1050
Wire Wire Line
	5550 1450 6050 1450
Wire Wire Line
	6050 1450 6050 1450
Text Label 5550 1050 0    60   ~ 0
+18VAC
Text Label 5700 1450 0    60   ~ 0
GND
$EndSCHEMATC
