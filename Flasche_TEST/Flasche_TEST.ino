const int EL =4; //E1
const int ER =6; //E2
const int ML =5; //M1
const int MR =7; //M2

const int Lf1 = 14; // in Fahrtrichtung Rechts
const int Lf2 = 15; // in Fahrtrichtung mitte Rechts
int Lf3 = 16 ;// in Fahrtrichtung mitte Links
int Lf4 = 17 ;// in Fahrtrichtung Links
int D = 8; // Drucksensor

int G; // Letzte Position der Linie
int Z = 0 ; // Momentane Linienposition


int V = 225;
int R = -200;
int y = -175;

void setup(){
  pinMode(Lf1, INPUT);
  pinMode(Lf2, INPUT);
  pinMode(Lf3, INPUT);
  pinMode(Lf4, INPUT);
  pinMode(EL,OUTPUT);
  pinMode(ER,OUTPUT);
  pinMode(ML,OUTPUT);
  pinMode(MR,OUTPUT);
  pinMode(D,INPUT);
  Serial.begin(9600);
}

int sensorInput = 0;
void setMotors(int lMotor, int rMotor) {
  Serial.print("L: ");
  Serial.print(lMotor);
  Serial.print(" R: ");
  Serial.print(rMotor);
  Serial.print(" G: ");
  Serial.print(G);
  Serial.print(" Z: ");
  Serial.print(Z);
  Serial.print("D:  ");
  Serial.print(D);
  Serial.println(sensorInput, BIN);

  if(rMotor > 0) {
    digitalWrite(MR, HIGH);
    analogWrite(ER, rMotor);
  }
  else {
    digitalWrite(MR, LOW);
    analogWrite(ER, -rMotor);
  }

  if(lMotor > 0) {
    digitalWrite(ML, HIGH);
    analogWrite(EL, lMotor);
  }
  else {
    digitalWrite(ML, LOW);
    analogWrite(EL, -lMotor);
  }
}

void updateSensors() {
  sensorInput = (digitalRead(Lf1) << 3) | (digitalRead(Lf2) << 2) | (digitalRead(Lf3) << 1) | (digitalRead(Lf4));
}

void loop() {
                             setMotors(V,V);
  if(digitalRead(D)==HIGH){
       setMotors(R,V);
       delay(500);
       setMotors(V,V);
       delay(1000);
       setMotors(V,R);
       delay(500);
       setMotors(V,V);
       delay(1500);
       setMotors(V,R);
       delay(300);
  
  while(sensorInput== 0b0000 | 0b0001 | 0b0011){
                             setMotors(V,V);    
  }
  

  
  }





  
}
