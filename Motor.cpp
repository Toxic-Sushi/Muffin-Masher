
#include "Motor.h"
#include "Arduino.h"

void setMotors(int lMotor, int rMotor) {
   Serial.print("Setting Motors ");
   Serial.print("L: ");
   Serial.print(lMotor);
   Serial.print(" R: ");
   Serial.println(rMotor);

   if(rMotor > 0) {
      digitalWrite(MR, LOW);
      analogWrite(ER, rMotor);
   }
   else {
      digitalWrite(MR, HIGH);
      analogWrite(ER, -rMotor);
   }

   if(lMotor > 0) {
      digitalWrite(ML, LOW);
      analogWrite(EL, lMotor);
   }
   else {
      digitalWrite(ML, HIGH);
      analogWrite(EL, -lMotor);
   }
}

void motorSetup() {
   pinMode(EL,OUTPUT);
   pinMode(ER,OUTPUT);
   pinMode(ML,OUTPUT);
   pinMode(MR,OUTPUT);
}
