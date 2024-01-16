import RPi.GPIO as GPIO
import time

SW = 22
count = 0
LED = 18
OUT = 0

GPIO.setmode(GPIO.BCM)
GPIO.setup(SW, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(LED, GPIO.OUT)

try:
    while True:
        if GPIO.wait_for_edge(SW, GPIO.FALLING):
            OUT = OUT + 1
            OUT = OUT%2
            count = count + 1
        if OUT == 1:
            print("Switch ON")
            GPIO.output (LED, True)
        else:
            print("Switch OFF")
            GPIO.output (LED, False)
        print(f"Button pressed {count}")
except KeyboardInterrupt:
    GPIO.cleanup()
    
print("\nBye")
