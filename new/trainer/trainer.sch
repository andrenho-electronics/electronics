EESchema Schematic File Version 2
LIBS:trainer-rescue
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
LIBS:MiscellaneousDevices
LIBS:ULN280xA
LIBS:trainer-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
Title ""
Date "22 nov 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L USB_A P?
U 1 1 5653C819
P 6650 1900
F 0 "P?" H 6850 1700 50  0000 C CNN
F 1 "USB_A" H 6600 2100 50  0000 C CNN
F 2 "" V 6600 1800 60  0000 C CNN
F 3 "" V 6600 1800 60  0000 C CNN
	1    6650 1900
	1    0    0    -1  
$EndComp
NoConn ~ 6950 1800
$Sheet
S 8450 950  2150 1350
U 5655FD48
F0 "Inputs" 60
F1 "inputs.sch" 60
$EndSheet
$Sheet
S 8450 2750 2150 1350
U 56560475
F0 "Outputs" 60
F1 "outputs.sch" 60
$EndSheet
$Comp
L RELAY_SPDT S?
U 1 1 56568F0F
P 4750 4500
F 0 "S?" H 4750 4200 60  0000 C CNN
F 1 "RELAY_SPDT" H 4750 4100 60  0000 C CNN
F 2 "" H 4750 4500 60  0000 C CNN
F 3 "" H 4750 4500 60  0000 C CNN
	1    4750 4500
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X04 P?
U 1 1 5656959C
P 1300 4950
F 0 "P?" H 1300 5200 50  0000 C CNN
F 1 "CONN_01X04" V 1400 4950 50  0000 C CNN
F 2 "RELAYS" H 1400 5300 60  0000 C CNN
F 3 "" H 1300 4950 60  0000 C CNN
	1    1300 4950
	-1   0    0    1   
$EndComp
Text GLabel 5200 4350 2    60   Input ~ 0
R1_CLOSED
Text GLabel 5200 4500 2    60   Input ~ 0
R1_COM
Text GLabel 5200 4650 2    60   Input ~ 0
R1_OPEN
$Comp
L RELAY_SPDT S?
U 1 1 5656BF1B
P 4750 5300
F 0 "S?" H 4750 5000 60  0000 C CNN
F 1 "RELAY_SPDT" H 4750 4900 60  0000 C CNN
F 2 "" H 4750 5300 60  0000 C CNN
F 3 "" H 4750 5300 60  0000 C CNN
	1    4750 5300
	1    0    0    -1  
$EndComp
Text GLabel 5200 5150 2    60   Input ~ 0
R2_CLOSED
Text GLabel 5200 5300 2    60   Input ~ 0
R2_COM
Text GLabel 5200 5450 2    60   Input ~ 0
R2_OPEN
$Comp
L RELAY_SPDT S?
U 1 1 5656C278
P 4750 6100
F 0 "S?" H 4750 5800 60  0000 C CNN
F 1 "RELAY_SPDT" H 4750 5700 60  0000 C CNN
F 2 "" H 4750 6100 60  0000 C CNN
F 3 "" H 4750 6100 60  0000 C CNN
	1    4750 6100
	1    0    0    -1  
$EndComp
Text GLabel 5200 5950 2    60   Input ~ 0
R3_CLOSED
Text GLabel 5200 6100 2    60   Input ~ 0
R3_COM
Text GLabel 5200 6250 2    60   Input ~ 0
R3_OPEN
$Comp
L RELAY_SPDT S?
U 1 1 5656C28D
P 4750 6900
F 0 "S?" H 4750 6600 60  0000 C CNN
F 1 "RELAY_SPDT" H 4750 6500 60  0000 C CNN
F 2 "" H 4750 6900 60  0000 C CNN
F 3 "" H 4750 6900 60  0000 C CNN
	1    4750 6900
	1    0    0    -1  
$EndComp
Text GLabel 5200 6750 2    60   Input ~ 0
R4_CLOSED
Text GLabel 5200 6900 2    60   Input ~ 0
R4_COM
Text GLabel 5200 7050 2    60   Input ~ 0
R4_OPEN
$Comp
L LM7805 U?
U 1 1 5657C7C3
P 2600 2350
F 0 "U?" H 2750 2154 60  0000 C CNN
F 1 "LM7805" H 2600 2550 60  0000 C CNN
F 2 "" H 2600 2350 60  0000 C CNN
F 3 "" H 2600 2350 60  0000 C CNN
	1    2600 2350
	1    0    0    -1  
$EndComp
$Comp
L GNDREF #PWR?
U 1 1 5657D2EA
P 6750 2750
F 0 "#PWR?" H 6750 2500 50  0001 C CNN
F 1 "GNDREF" H 6750 2600 50  0000 C CNN
F 2 "" H 6750 2750 60  0000 C CNN
F 3 "" H 6750 2750 60  0000 C CNN
	1    6750 2750
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5657DDA5
P 2200 2550
F 0 "C?" H 2225 2650 50  0000 L CNN
F 1 "C" H 2225 2450 50  0000 L CNN
F 2 "0.33uF" H 2100 2450 30  0000 C CNN
F 3 "" H 2200 2550 60  0000 C CNN
	1    2200 2550
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5657DE9C
P 3000 2550
F 0 "C?" H 3025 2650 50  0000 L CNN
F 1 "C" H 3025 2450 50  0000 L CNN
F 2 "0.1uF" H 3150 2450 30  0000 C CNN
F 3 "" H 3000 2550 60  0000 C CNN
	1    3000 2550
	1    0    0    -1  
$EndComp
$Comp
L GNDREF #PWR?
U 1 1 5657E02B
P 2600 2850
F 0 "#PWR?" H 2600 2600 50  0001 C CNN
F 1 "GNDREF" H 2600 2700 50  0000 C CNN
F 2 "" H 2600 2850 60  0000 C CNN
F 3 "" H 2600 2850 60  0000 C CNN
	1    2600 2850
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 5657E06F
P 3350 2150
F 0 "#PWR?" H 3350 2000 50  0001 C CNN
F 1 "+5V" H 3350 2290 50  0000 C CNN
F 2 "" H 3350 2150 60  0000 C CNN
F 3 "" H 3350 2150 60  0000 C CNN
	1    3350 2150
	1    0    0    -1  
$EndComp
$Comp
L BARREL_JACK CON?
U 1 1 56587C69
P 1450 2400
F 0 "CON?" H 1450 2650 60  0000 C CNN
F 1 "BARREL_JACK" H 1450 2200 60  0000 C CNN
F 2 "7..12V" H 1450 2100 60  0000 C CNN
F 3 "" H 1450 2400 60  0000 C CNN
	1    1450 2400
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X03 P?
U 1 1 56588E62
P 5950 2500
F 0 "P?" H 5950 2700 50  0000 C CNN
F 1 "CONN_01X03" V 6050 2500 50  0000 C CNN
F 2 "USB" H 5950 2800 60  0000 C CNN
F 3 "" H 5950 2500 60  0000 C CNN
	1    5950 2500
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X02 P?
U 1 1 56589B7A
P 3800 2350
F 0 "P?" H 3800 2500 50  0000 C CNN
F 1 "CONN_01X02" V 3900 2350 50  0000 C CNN
F 2 "5V to circuit" H 3950 2050 60  0000 C CNN
F 3 "" H 3800 2350 60  0000 C CNN
	1    3800 2350
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5659DCCE
P 3250 4800
F 0 "R?" V 3200 4950 50  0000 C CNN
F 1 "R" V 3250 4800 50  0000 C CNN
F 2 "220R" V 3200 4600 30  0000 C CNN
F 3 "" H 3250 4800 30  0000 C CNN
	1    3250 4800
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5659E1A6
P 3250 4900
F 0 "R?" V 3200 5050 50  0000 C CNN
F 1 "R" V 3250 4900 50  0000 C CNN
F 2 "220R" V 3200 4700 30  0000 C CNN
F 3 "" H 3250 4900 30  0000 C CNN
	1    3250 4900
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5659E1E3
P 3250 5000
F 0 "R?" V 3200 5150 50  0000 C CNN
F 1 "R" V 3250 5000 50  0000 C CNN
F 2 "220R" V 3200 4800 30  0000 C CNN
F 3 "" H 3250 5000 30  0000 C CNN
	1    3250 5000
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5659E227
P 3250 5100
F 0 "R?" V 3200 5250 50  0000 C CNN
F 1 "R" V 3250 5100 50  0000 C CNN
F 2 "220R" V 3200 4900 30  0000 C CNN
F 3 "" H 3250 5100 30  0000 C CNN
	1    3250 5100
	0    1    1    0   
$EndComp
$Comp
L ULN2803A U?
U 1 1 5659B908
P 2250 5200
F 0 "U?" H 2200 4700 50  0000 C CNN
F 1 "ULN2803A" H 2250 5750 50  0000 C CNN
F 2 "" H 2250 5200 60  0000 C CNN
F 3 "" H 2250 5200 60  0000 C CNN
	1    2250 5200
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 565A0518
P 4000 3950
F 0 "#PWR?" H 4000 3800 50  0001 C CNN
F 1 "+5V" H 4000 4090 50  0000 C CNN
F 2 "" H 4000 3950 60  0000 C CNN
F 3 "" H 4000 3950 60  0000 C CNN
	1    4000 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 2200 6550 2500
Wire Wire Line
	6650 2600 6650 2200
Wire Wire Line
	6750 2750 6750 2200
Wire Wire Line
	1750 2300 2200 2300
Wire Wire Line
	3000 2400 3000 2300
Wire Wire Line
	3000 2300 3600 2300
Wire Wire Line
	2200 2300 2200 2400
Wire Wire Line
	3350 2300 3350 2150
Wire Wire Line
	1750 2400 1750 2750
Connection ~ 1750 2500
Wire Wire Line
	1750 2750 3600 2750
Wire Wire Line
	3000 2750 3000 2700
Wire Wire Line
	2600 2600 2600 2850
Connection ~ 3000 2750
Connection ~ 2600 2750
Wire Wire Line
	2200 2750 2200 2700
Connection ~ 2200 2750
Wire Wire Line
	6550 2500 6150 2500
Wire Wire Line
	6150 2600 6650 2600
Wire Wire Line
	6150 2400 6450 2400
Wire Wire Line
	6450 2400 6450 2200
Connection ~ 3350 2300
Wire Wire Line
	3600 2750 3600 2400
Wire Wire Line
	3000 4800 3100 4800
Wire Wire Line
	3000 4900 3100 4900
Wire Wire Line
	3000 5000 3100 5000
Wire Wire Line
	3000 5100 3100 5100
Wire Wire Line
	4000 3950 4000 6600
Wire Wire Line
	4000 4200 4200 4200
Wire Wire Line
	4000 5000 4200 5000
Connection ~ 4000 4200
Wire Wire Line
	4000 5800 4200 5800
Connection ~ 4000 5000
Wire Wire Line
	4000 6600 4200 6600
Connection ~ 4000 5800
Wire Wire Line
	4200 4800 3400 4800
Wire Wire Line
	4200 5600 3900 5600
Wire Wire Line
	3900 5600 3900 4900
Wire Wire Line
	3900 4900 3400 4900
Wire Wire Line
	4200 6400 3800 6400
Wire Wire Line
	3800 6400 3800 5000
Wire Wire Line
	3800 5000 3400 5000
Wire Wire Line
	4200 7200 3700 7200
Wire Wire Line
	3700 7200 3700 5100
Wire Wire Line
	3700 5100 3400 5100
$Comp
L GNDREF #PWR?
U 1 1 565A1ACC
P 1500 5900
F 0 "#PWR?" H 1500 5650 50  0001 C CNN
F 1 "GNDREF" H 1500 5750 50  0000 C CNN
F 2 "" H 1500 5900 60  0000 C CNN
F 3 "" H 1500 5900 60  0000 C CNN
	1    1500 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 5900 1500 5600
$Comp
L +5V #PWR?
U 1 1 565A1B8D
P 3350 5450
F 0 "#PWR?" H 3350 5300 50  0001 C CNN
F 1 "+5V" H 3350 5590 50  0000 C CNN
F 2 "" H 3350 5450 60  0000 C CNN
F 3 "" H 3350 5450 60  0000 C CNN
	1    3350 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 5600 3350 5600
Wire Wire Line
	3350 5600 3350 5450
$Comp
L CONN_01X02 P?
U 1 1 565A8A8C
P 1700 1250
F 0 "P?" H 1700 1400 50  0000 C CNN
F 1 "CONN_01X02" V 1800 1250 50  0000 C CNN
F 2 "Power from circuit" H 1950 950 60  0000 C CNN
F 3 "" H 1700 1250 60  0000 C CNN
	1    1700 1250
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR?
U 1 1 565A8B1D
P 1350 1000
F 0 "#PWR?" H 1350 850 50  0001 C CNN
F 1 "VCC" H 1350 1150 50  0000 C CNN
F 2 "" H 1350 1000 60  0000 C CNN
F 3 "" H 1350 1000 60  0000 C CNN
	1    1350 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 1000 1350 1200
Wire Wire Line
	1350 1200 1500 1200
$Comp
L GNDREF #PWR?
U 1 1 565A8FBD
P 1350 1500
F 0 "#PWR?" H 1350 1250 50  0001 C CNN
F 1 "GNDREF" H 1350 1350 50  0000 C CNN
F 2 "" H 1350 1500 60  0000 C CNN
F 3 "" H 1350 1500 60  0000 C CNN
	1    1350 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 1500 1350 1300
Wire Wire Line
	1350 1300 1500 1300
Text Notes 1900 3300 0    60   ~ 0
Isolated power supply\n(powers internal LEDs, ICs)
$EndSCHEMATC
