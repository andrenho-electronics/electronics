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
LIBS:switch_dpdt
LIBS:MiscellaneousDevices
LIBS:buzzer_blinker-cache
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
$Comp
L C C1
U 1 1 5657A47F
P 5100 2600
F 0 "C1" H 5125 2700 50  0000 L CNN
F 1 "C" H 5125 2500 50  0000 L CNN
F 2 "330nF" V 4950 2600 30  0000 C CNN
F 3 "" H 5100 2600 60  0000 C CNN
	1    5100 2600
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 5657A4A7
P 5150 3000
F 0 "R2" V 5230 3000 50  0000 C CNN
F 1 "R" V 5150 3000 50  0000 C CNN
F 2 "625R 1/4W" V 5080 3000 30  0000 C CNN
F 3 "" H 5150 3000 30  0000 C CNN
	1    5150 3000
	0    1    1    0   
$EndComp
$Comp
L D D1
U 1 1 5657A5A6
P 5650 2450
F 0 "D1" H 5650 2550 50  0000 C CNN
F 1 "D" H 5650 2350 50  0000 C CNN
F 2 "1N4007" H 5800 2500 30  0000 C CNN
F 3 "" H 5650 2450 60  0000 C CNN
	1    5650 2450
	0    1    1    0   
$EndComp
$Comp
L CP C2
U 1 1 5657A794
P 6300 2800
F 0 "C2" H 6325 2900 50  0000 L CNN
F 1 "CP" H 6325 2700 50  0000 L CNN
F 2 "47uF 16V" V 6250 2600 30  0000 C CNN
F 3 "" H 6300 2800 60  0000 C CNN
	1    6300 2800
	1    0    0    -1  
$EndComp
$Comp
L ZENER D5
U 1 1 5657A7EF
P 6700 2800
F 0 "D5" H 6700 2900 50  0000 C CNN
F 1 "ZENER" H 6700 2700 50  0000 C CNN
F 2 "6V8" H 6800 2850 30  0000 C CNN
F 3 "" H 6700 2800 60  0000 C CNN
	1    6700 2800
	0    1    1    0   
$EndComp
$Comp
L LED D6
U 1 1 5657A884
P 7000 2800
F 0 "D6" H 7000 2900 50  0000 C CNN
F 1 "LED" H 7000 2700 50  0000 C CNN
F 2 "" H 7000 2800 60  0000 C CNN
F 3 "" H 7000 2800 60  0000 C CNN
	1    7000 2800
	0    -1   -1   0   
$EndComp
Text GLabel 2450 3700 0    60   Input ~ 0
NEUTRAL
$Comp
L D D2
U 1 1 5657AEA3
P 5650 3250
F 0 "D2" H 5650 3350 50  0000 C CNN
F 1 "D" H 5650 3150 50  0000 C CNN
F 2 "1N4007" H 5500 3300 30  0000 C CNN
F 3 "" H 5650 3250 60  0000 C CNN
	1    5650 3250
	0    1    1    0   
$EndComp
$Comp
L D D3
U 1 1 5657AEE6
P 5950 2450
F 0 "D3" H 5950 2550 50  0000 C CNN
F 1 "D" H 5950 2350 50  0000 C CNN
F 2 "1N4007" H 6100 2500 30  0000 C CNN
F 3 "" H 5950 2450 60  0000 C CNN
	1    5950 2450
	0    1    1    0   
$EndComp
$Comp
L D D4
U 1 1 5657AF16
P 5950 3250
F 0 "D4" H 5950 3350 50  0000 C CNN
F 1 "D" H 5950 3150 50  0000 C CNN
F 2 "1N4007" H 5800 3300 30  0000 C CNN
F 3 "" H 5950 3250 60  0000 C CNN
	1    5950 3250
	0    1    1    0   
$EndComp
Text GLabel 2450 2700 0    60   Input ~ 0
LIVE
$Comp
L SWITCH_DPDT SW2
U 1 1 565DFC34
P 3450 2800
F 0 "SW2" H 3450 3250 70  0000 C CNN
F 1 "SWITCH_DPDT" H 3450 2350 70  0000 C CNN
F 2 "" H 3450 2800 60  0000 C CNN
F 3 "" H 3450 2800 60  0000 C CNN
	1    3450 2800
	-1   0    0    1   
$EndComp
$Comp
L FUSE F1
U 1 1 565E1906
P 4500 2600
F 0 "F1" H 4600 2650 50  0000 C CNN
F 1 "FUSE" H 4400 2550 50  0000 C CNN
F 2 "250 mA" H 4500 2450 60  0000 C CNN
F 3 "" H 4500 2600 60  0000 C CNN
	1    4500 2600
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 565E19DC
P 5100 2250
F 0 "R1" V 5180 2250 50  0000 C CNN
F 1 "R" V 5100 2250 50  0000 C CNN
F 2 "10M 1/4W" V 5030 2250 30  0000 C CNN
F 3 "" H 5100 2250 30  0000 C CNN
	1    5100 2250
	0    1    1    0   
$EndComp
NoConn ~ 2950 3100
NoConn ~ 2950 2500
Text GLabel 2450 3450 0    60   Input ~ 0
TO_BELL
Wire Wire Line
	3950 2600 4250 2600
Wire Wire Line
	2450 2700 2950 2700
Connection ~ 5300 2600
Wire Wire Line
	5300 2250 5300 2600
Wire Wire Line
	5250 2250 5300 2250
Connection ~ 4900 2600
Wire Wire Line
	4900 2250 4900 2600
Wire Wire Line
	4950 2250 4900 2250
Wire Wire Line
	4750 2600 4950 2600
Connection ~ 6700 3400
Wire Wire Line
	7000 3400 7000 3000
Connection ~ 6300 3400
Wire Wire Line
	6700 3400 6700 3000
Connection ~ 6700 2300
Connection ~ 6300 2300
Wire Wire Line
	6700 2300 6700 2600
Wire Wire Line
	6300 3400 6300 2950
Wire Wire Line
	6300 2300 6300 2650
Wire Wire Line
	5650 2600 5650 3100
Connection ~ 5950 3000
Wire Wire Line
	5950 2600 5950 3100
Wire Wire Line
	5300 3000 5950 3000
Wire Wire Line
	5250 2600 5650 2600
Wire Wire Line
	7000 2300 7000 2600
Wire Wire Line
	5650 2300 7000 2300
Connection ~ 5950 2300
Wire Wire Line
	5650 3400 7000 3400
Connection ~ 5950 3400
Wire Wire Line
	5000 3000 4500 3000
Wire Wire Line
	4500 3000 4500 3700
Wire Wire Line
	4500 3700 2450 3700
Wire Wire Line
	2450 2900 2950 2900
Wire Wire Line
	2450 3450 3950 3450
Wire Wire Line
	3950 3450 3950 3000
Text GLabel 2450 2900 0    60   Input ~ 0
FROM_BELL
$EndSCHEMATC
