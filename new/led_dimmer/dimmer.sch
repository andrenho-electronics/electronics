EESchema Schematic File Version 2
LIBS:dimmer-rescue
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
LIBS:dimmer-cache
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
L LED-RESCUE-dimmer D3
U 1 1 567404B6
P 7400 3450
F 0 "D3" H 7400 3550 50  0000 C CNN
F 1 "LED" H 7400 3350 50  0000 C CNN
F 2 "" H 7400 3450 60  0000 C CNN
F 3 "" H 7400 3450 60  0000 C CNN
	1    7400 3450
	0    1    1    0   
$EndComp
$Comp
L NPN Q1
U 1 1 56740556
P 6950 4000
F 0 "Q1" H 6950 3850 50  0000 R CNN
F 1 "2N3904" H 6950 4150 50  0000 R CNN
F 2 "" H 6950 4000 60  0000 C CNN
F 3 "" H 6950 4000 60  0000 C CNN
	1    6950 4000
	1    0    0    -1  
$EndComp
$Comp
L R-RESCUE-dimmer R1
U 1 1 567405F3
P 6050 2950
F 0 "R1" V 6130 2950 40  0000 C CNN
F 1 "R" V 6057 2951 40  0000 C CNN
F 2 "1k" V 5980 2950 30  0000 C CNN
F 3 "" H 6050 2950 30  0000 C CNN
	1    6050 2950
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR8
U 1 1 5674066D
P 7300 2500
F 0 "#PWR8" H 7300 2350 50  0001 C CNN
F 1 "VCC" H 7300 2650 50  0000 C CNN
F 2 "" H 7300 2500 60  0000 C CNN
F 3 "" H 7300 2500 60  0000 C CNN
	1    7300 2500
	1    0    0    -1  
$EndComp
$Comp
L R-RESCUE-dimmer R2
U 1 1 567407CF
P 7300 2950
F 0 "R2" V 7380 2950 40  0000 C CNN
F 1 "R" V 7307 2951 40  0000 C CNN
F 2 "100R" V 7230 2950 30  0000 C CNN
F 3 "" H 7300 2950 30  0000 C CNN
	1    7300 2950
	1    0    0    -1  
$EndComp
$Comp
L R-RESCUE-dimmer R3
U 1 1 5674091B
P 7500 2950
F 0 "R3" V 7580 2950 40  0000 C CNN
F 1 "R" V 7507 2951 40  0000 C CNN
F 2 "68R" V 7430 2950 30  0000 C CNN
F 3 "" H 7500 2950 30  0000 C CNN
	1    7500 2950
	1    0    0    -1  
$EndComp
$Comp
L LED-RESCUE-dimmer D4
U 1 1 56740C27
P 7800 3450
F 0 "D4" H 7800 3550 50  0000 C CNN
F 1 "LED" H 7800 3350 50  0000 C CNN
F 2 "" H 7800 3450 60  0000 C CNN
F 3 "" H 7800 3450 60  0000 C CNN
	1    7800 3450
	0    1    1    0   
$EndComp
$Comp
L R-RESCUE-dimmer R4
U 1 1 56740C2D
P 7700 2950
F 0 "R4" V 7780 2950 40  0000 C CNN
F 1 "R" V 7707 2951 40  0000 C CNN
F 2 "100R" V 7630 2950 30  0000 C CNN
F 3 "" H 7700 2950 30  0000 C CNN
	1    7700 2950
	1    0    0    -1  
$EndComp
$Comp
L R-RESCUE-dimmer R5
U 1 1 56740C33
P 7900 2950
F 0 "R5" V 7980 2950 40  0000 C CNN
F 1 "R" V 7907 2951 40  0000 C CNN
F 2 "68R" V 7830 2950 30  0000 C CNN
F 3 "" H 7900 2950 30  0000 C CNN
	1    7900 2950
	1    0    0    -1  
$EndComp
$Comp
L LED-RESCUE-dimmer D5
U 1 1 56740CD6
P 8200 3450
F 0 "D5" H 8200 3550 50  0000 C CNN
F 1 "LED" H 8200 3350 50  0000 C CNN
F 2 "" H 8200 3450 60  0000 C CNN
F 3 "" H 8200 3450 60  0000 C CNN
	1    8200 3450
	0    1    1    0   
$EndComp
$Comp
L R-RESCUE-dimmer R6
U 1 1 56740CDC
P 8100 2950
F 0 "R6" V 8180 2950 40  0000 C CNN
F 1 "R" V 8107 2951 40  0000 C CNN
F 2 "100R" V 8030 2950 30  0000 C CNN
F 3 "" H 8100 2950 30  0000 C CNN
	1    8100 2950
	1    0    0    -1  
$EndComp
$Comp
L R-RESCUE-dimmer R7
U 1 1 56740CE2
P 8300 2950
F 0 "R7" V 8380 2950 40  0000 C CNN
F 1 "R" V 8307 2951 40  0000 C CNN
F 2 "68R" V 8230 2950 30  0000 C CNN
F 3 "" H 8300 2950 30  0000 C CNN
	1    8300 2950
	1    0    0    -1  
$EndComp
$Comp
L GNDREF #PWR7
U 1 1 56740F10
P 7050 4750
F 0 "#PWR7" H 7050 4500 50  0001 C CNN
F 1 "GNDREF" H 7050 4600 50  0000 C CNN
F 2 "" H 7050 4750 60  0000 C CNN
F 3 "" H 7050 4750 60  0000 C CNN
	1    7050 4750
	1    0    0    -1  
$EndComp
$Comp
L LM555N U1
U 1 1 56741A2A
P 5050 4000
F 0 "U1" H 5050 4100 70  0000 C CNN
F 1 "NE555" H 5050 3900 70  0000 C CNN
F 2 "" H 5050 4000 60  0000 C CNN
F 3 "" H 5050 4000 60  0000 C CNN
	1    5050 4000
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR6
U 1 1 567442FB
P 6050 2500
F 0 "#PWR6" H 6050 2350 50  0001 C CNN
F 1 "VCC" H 6050 2650 50  0000 C CNN
F 2 "" H 6050 2500 60  0000 C CNN
F 3 "" H 6050 2500 60  0000 C CNN
	1    6050 2500
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-dimmer C2
U 1 1 56745047
P 4050 4450
F 0 "C2" H 4050 4550 40  0000 L CNN
F 1 "C" H 4056 4365 40  0000 L CNN
F 2 "100nF" H 4150 4300 30  0000 C CNN
F 3 "" H 4050 4450 60  0000 C CNN
	1    4050 4450
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR5
U 1 1 56745220
P 4200 2500
F 0 "#PWR5" H 4200 2350 50  0001 C CNN
F 1 "VCC" H 4200 2650 50  0000 C CNN
F 2 "" H 4200 2500 60  0000 C CNN
F 3 "" H 4200 2500 60  0000 C CNN
	1    4200 2500
	1    0    0    -1  
$EndComp
$Comp
L GNDREF #PWR4
U 1 1 567452E5
P 4050 4750
F 0 "#PWR4" H 4050 4500 50  0001 C CNN
F 1 "GNDREF" H 4050 4600 50  0000 C CNN
F 2 "" H 4050 4750 60  0000 C CNN
F 3 "" H 4050 4750 60  0000 C CNN
	1    4050 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 3200 7500 3200
Wire Wire Line
	7400 3200 7400 3250
Connection ~ 7400 3200
Wire Wire Line
	7700 3200 7900 3200
Wire Wire Line
	7800 3200 7800 3250
Connection ~ 7800 3200
Wire Wire Line
	8100 3200 8300 3200
Wire Wire Line
	8200 3200 8200 3250
Connection ~ 8200 3200
Wire Wire Line
	7050 3800 7050 3700
Wire Wire Line
	7050 3700 8200 3700
Wire Wire Line
	7400 3700 7400 3650
Wire Wire Line
	7800 3700 7800 3650
Connection ~ 7400 3700
Wire Wire Line
	8200 3700 8200 3650
Connection ~ 7800 3700
Wire Wire Line
	7050 4750 7050 4200
Connection ~ 7700 2700
Connection ~ 7500 2700
Connection ~ 8100 2700
Connection ~ 7900 2700
Connection ~ 7300 2700
Wire Wire Line
	5750 4000 6750 4000
Wire Wire Line
	6050 4000 6050 3200
Wire Wire Line
	7300 2500 7300 2700
Wire Wire Line
	7300 2700 8300 2700
Connection ~ 6050 4000
Wire Wire Line
	6050 2700 6050 2500
Wire Wire Line
	5750 4200 5950 4200
Wire Wire Line
	5950 4200 5950 3500
Wire Wire Line
	5950 3500 4300 3500
Wire Wire Line
	4350 4050 4050 4050
Wire Wire Line
	4050 4050 4050 4250
Wire Wire Line
	4200 4300 4350 4300
Wire Wire Line
	4200 2500 4200 4300
Wire Wire Line
	4050 4750 4050 4650
$Comp
L POT RV1
U 1 1 56747D51
P 5100 2800
F 0 "RV1" H 5100 2700 50  0000 C CNN
F 1 "POT" H 5100 2800 50  0000 C CNN
F 2 "100k" H 5100 2600 60  0000 C CNN
F 3 "" H 5100 2800 60  0000 C CNN
	1    5100 2800
	1    0    0    -1  
$EndComp
$Comp
L DIODE D1
U 1 1 56747D57
P 4850 3000
F 0 "D1" H 4850 3100 40  0000 C CNN
F 1 "DIODE" H 4850 2900 40  0000 C CNN
F 2 "1N4148" H 4850 3200 60  0000 C CNN
F 3 "" H 4850 3000 60  0000 C CNN
	1    4850 3000
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D2
U 1 1 56747D5D
P 5350 3000
F 0 "D2" H 5350 3100 40  0000 C CNN
F 1 "DIODE" H 5350 2900 40  0000 C CNN
F 2 "1N4148" H 5350 3200 60  0000 C CNN
F 3 "" H 5350 3000 60  0000 C CNN
	1    5350 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	4850 3200 5350 3200
Connection ~ 5100 3200
Wire Wire Line
	5100 3200 5100 3500
Connection ~ 5100 3500
Wire Wire Line
	5750 3800 5750 2550
Wire Wire Line
	5750 2550 5100 2550
Wire Wire Line
	5100 2550 5100 2650
$Comp
L C-RESCUE-dimmer C1
U 1 1 56749AF9
P 3750 4450
F 0 "C1" H 3750 4550 40  0000 L CNN
F 1 "C" H 3756 4365 40  0000 L CNN
F 2 "100nF" H 3850 4300 30  0000 C CNN
F 3 "" H 3750 4450 60  0000 C CNN
	1    3750 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 3800 4350 3800
Wire Wire Line
	3750 3800 3750 4250
Wire Wire Line
	4300 3500 4300 3800
Connection ~ 4300 3800
$Comp
L GNDREF #PWR3
U 1 1 5674A0C9
P 3750 4750
F 0 "#PWR3" H 3750 4500 50  0001 C CNN
F 1 "GNDREF" H 3750 4600 50  0000 C CNN
F 2 "" H 3750 4750 60  0000 C CNN
F 3 "" H 3750 4750 60  0000 C CNN
	1    3750 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 4750 3750 4650
Wire Notes Line
	6550 2150 6550 5150
$Comp
L BATTERY BT1
U 1 1 5674D17C
P 2900 4050
F 0 "BT1" H 2900 4250 50  0000 C CNN
F 1 "BATTERY" H 2900 3860 50  0000 C CNN
F 2 "3V" H 2700 4250 60  0000 C CNN
F 3 "" H 2900 4050 60  0000 C CNN
	1    2900 4050
	0    1    1    0   
$EndComp
$Comp
L SPST SW1
U 1 1 5674D25B
P 2900 3250
F 0 "SW1" H 2900 3350 70  0000 C CNN
F 1 "SPST" H 2900 3150 70  0000 C CNN
F 2 "" H 2900 3250 60  0000 C CNN
F 3 "" H 2900 3250 60  0000 C CNN
	1    2900 3250
	0    -1   -1   0   
$EndComp
$Comp
L VCC #PWR1
U 1 1 5674DCA4
P 2900 2500
F 0 "#PWR1" H 2900 2350 50  0001 C CNN
F 1 "VCC" H 2900 2650 50  0000 C CNN
F 2 "" H 2900 2500 60  0000 C CNN
F 3 "" H 2900 2500 60  0000 C CNN
	1    2900 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 2500 2900 2750
$Comp
L GNDREF #PWR2
U 1 1 5674DD8E
P 2900 4750
F 0 "#PWR2" H 2900 4500 50  0001 C CNN
F 1 "GNDREF" H 2900 4600 50  0000 C CNN
F 2 "" H 2900 4750 60  0000 C CNN
F 3 "" H 2900 4750 60  0000 C CNN
	1    2900 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 4750 2900 4350
Wire Notes Line
	3400 5150 3400 2100
Wire Notes Line
	8450 3250 8450 3650
Text Notes 8650 3600 1    60   ~ 0
25 mA\neach
$EndSCHEMATC
