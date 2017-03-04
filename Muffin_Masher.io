int EL =4; //E1
int ER =6; //E2
int ML =5; //M1
int MR =7; //M2

int Lf1 = 14; // in Fahrtrichtung Rechts
int Lf2 = 16; // in Fahrtrichtung mitte Rechts
int Lf3 = 15 ;// in Fahrtrichtung mitte Links
int Lf4 = 17 ;// in Fahrtrichtung Links
int D = 8; // InfraRotSensor Vorne

int G; // Letzte Position der Linie
int Z = 0 ; // Momentane Linienposition


int V = 150;
int R = -50;
int y = -75;

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
  Serial.print(" S: ");
  Serial.println(sensorInput, BIN);

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

void updateSensors() {
  sensorInput = (digitalRead(Lf1) << 3) | (digitalRead(Lf2) << 2) | (digitalRead(Lf3) << 1) | (digitalRead(Lf4));
}

void loop(){
  updateSensors();

  if(sensorInput== 0b1100) {
    Z = 2;
    G = 2;
    delay(10);
  }
  if(sensorInput== 0b1000) {
    Z = 3;
    G = 3;
    delay(10);
  }
  if(sensorInput== 0b0011) {
    Z = 4;
    G = 4;
    delay(10);
  }
  if(sensorInput== 0b0001) {
    Z = 5;
    G = 5;
    delay(10);
  }
  if(sensorInput== 0b1110) {
    Z = 6;
    G = 6;
    delay(10);
  }
  if(sensorInput== 0b0110) {
    Z = 7;
    G = 7;
    delay(10);
  }
  if(sensorInput== 0b1111) {
    Z = 8;
    delay(10);
  }
  if(sensorInput== 0b0000) {
    Z = 9;
    G = 9;
    delay(10);
  }
  if(sensorInput== 0b0010) {
    Z = 10;
    G = 10;
    delay(10);
  }
  if(sensorInput== 0b0100) {
    Z = 11;
    G = 11;
    delay(10);
  }
  if(sensorInput== 0b0111) {
    Z = 12;
    G = 12;
    delay(10);
  }
  if(sensorInput== 0b1001) {
    Z = 13;
    G = 13;
    delay(10);
  }
  if(sensorInput== 0b1010) {
    Z = 14;
    G = 14;
    delay(10);
  }
  if(sensorInput== 0b0101) {
    Z = 15;
    G = 15;
    delay(10);
  }
  if(sensorInput== 0b1011) {
    Z = 16;
    G = 16;
    delay(10);
  }
  if(sensorInput== 0b1101) {
    Z = 17;
    G = 17;
    delay(10);
  }
  
  
  switch(Z) {
  case 2:
  case 3:
    setMotors(V,R);
  break;
  
  case 4:
  case 5:
    setMotors(V,V);
    delay(300);
    setMotors(R,V);
    delay(400);
  case 6:
    setMotors(V,V);
    delay(300);
    setMotors(R,V);
    delay(400);
  break;
  
  case 7:
    setMotors(V,V);
  break;
  
  case 8:
  switch(G){
    case 2:
    case 3:
      setMotors(y,y);
      delay(300);
      setMotors(R,V);
      delay(400);
    break;
    
    case 4:
    case 5:
      setMotors(y,y);
      delay(300);
      setMotors(V,R);
      delay(400);
    break;
    
    case 6:
      setMotors(y,y);
      delay(300);
      setMotors(R,V);
      delay(400);
    break;
    
    case 12:
      setMotors(y,y);
      delay(300);
      setMotors(V,R);
      delay(400);
    break;
    
    case 9:
      setMotors(V,V);
    break;
    
    default:
      setMotors(V,V);
  }
  break;
  
  case 9:
    setMotors(R,V);
    delay(500);
  break;
  
  case 10:
    setMotors(R,V);
  break;
  
  case 11:
    setMotors(V,R);
  break;
  
  case 12:
    setMotors(R,V);
  break;
  
  case 13:
    setMotors(V,V);
  break;
  
  case 14:
    setMotors(R,V);
  break;
  
  case 15:
    setMotors(V,R);
  break;
  
  case 16:
    setMotors(R,V);
  break;
  
  case 17:
    setMotors(V,R);
  break;
  
  default:
  break;
  }
}
