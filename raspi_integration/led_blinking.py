from ultralytics import YOLO
import RPi.GPIO as IO
from time import sleep

# Constants
harbor_id = 2

HIGH = 1
LOW = 0

GREEN = 38
RED = 40

# Main
def main():
	IO.setmode(IO.BOARD)

	model = YOLO('best.pt') # path to best.pt file
	names = model.names
	results = model(source='imgs/', show=False, conf=0.4, save=False, stream=True) # path to images

	for r in results:
		classes_list = list(r.boxes.cls)
		if harbor_id in classes_list:
			IO.setup(GREEN, IO.OUT)
			IO.output(GREEN, HIGH)
			sleep(1)
			IO.output(GREEN, LOW)
			sleep(1)
		else:
			IO.setup(RED, IO.OUT)
			IO.output(RED, HIGH)
			sleep(1)
			IO.output(RED, LOW)
			sleep(1)

if __name__ == '__main__':
	main()
