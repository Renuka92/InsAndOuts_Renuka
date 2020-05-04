byte val; // stores data received from serial port
int tracker;

const int LED1 = 6; // variable for which pin
const int LED2 = 9;
const int LED3 = 10;
const int LED4 = 11;

void setup() {
  pinMode(LED1, OUTPUT); // set pin as output
  pinMode(LED2, OUTPUT); // set pin as output
  pinMode(LED3, OUTPUT);
  pinMode(LED4, OUTPUT);
  Serial.begin(9600); // Start serial communication at 9600 bps
}

void loop() {
  if (Serial.available()) { // If data is available to read
    val = Serial.read(); // read it and store it in val
    tracker = Serial.read();
  }
    if (val == 0) { // If 0 received
      analogWrite(LED1, LOW); // turn LEDs off
      analogWrite(LED2, LOW);
      analogWrite(LED3, LOW);
      analogWrite(LED4, LOW);
    }
    else if (val == 1) {
      analogWrite(LED1, 255);
      analogWrite(LED2, 0);
      analogWrite(LED3, 0);
      analogWrite(LED4, 0);
    }
    else if (val == 2) {
      analogWrite(LED1, 0);
      analogWrite(LED2, 255);
      analogWrite(LED3, 0);
      analogWrite(LED4, 0);
    }
    else if (val == 3) {
      analogWrite(LED1, 0);
      analogWrite(LED2, 0);
      analogWrite(LED3, 0);
      analogWrite(LED4, 255);
    }
    else if (val == 4) {
      analogWrite(LED1, 0);
      analogWrite(LED2, 0);
      analogWrite(LED3, 255);
      analogWrite(LED4, 0);
    }
//    else if (val == 5) {
//      analogWrite(LED1, 0);
//      analogWrite(LED2, 100);
//      analogWrite(LED3, 150);
//      analogWrite(LED4, 200);
//      delay(100);
//      analogWrite(LED1, 250);
//      analogWrite(LED2, 200);
//      analogWrite(LED3, 150);
//      analogWrite(LED4, 100);
//    }
//  if (0 < val < 125) {
//    analogWrite(LED1, val);
//    analogWrite(LED2, 0);
//    analogWrite(LED3, 0);
//    analogWrite(LED4, 0);
//  }
//  else if (126 < val < 250) {
//    analogWrite(LED1, 0);
//    analogWrite(LED2, 0);
//    analogWrite(LED3, 0);
//    analogWrite(LED4, val);
//  }
  delay(10); // Wait 10 milliseconds
}
