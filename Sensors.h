
#ifndef ROBOT_SENSORS_H
#define ROBOT_SENSORS_H

#include "Arduino.h"

const uint8_t 	sPins[4] = {17, 15, 16, 14};
const int8_t 	sWeight[4] = {-120, -60, 60, 120};

extern int8_t 	linePosition;
extern uint8_t newSensorInput;

void setupSensors();

#endif
