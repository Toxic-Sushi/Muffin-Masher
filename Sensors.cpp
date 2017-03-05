
#include "Sensors.h"

uint8_t newSensorInput = 0;
int8_t linePosition = 0;

void setupSensors() {
	for(uint8_t i=0; i<4; i++) pinMode(sPins[i], INPUT);
}


void newUpdateSensors() {
	newSensorInput = 0;

	int16_t lPos = 0;
	uint8_t activeSensors = 0;

	for(uint8_t i=0; i<4; i++) {
		bool si = digitalRead(sPins[i]);
		newSensorInput |= si << i;

		if(si) {
			lPos += sWeight[i];
			activeSensors++;
		}
	}

	if(activeSensors != 0)
		linePosition = lPos / activeSensors;

}
