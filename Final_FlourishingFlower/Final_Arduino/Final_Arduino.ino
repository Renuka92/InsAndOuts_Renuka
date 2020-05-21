/* Flourishing Flower */

const int POT_SENSOR = A0; //potentiometer hooked up to analog pin A0
const int PHOTOCELL = A1;  // the cell and 10K pulldown are connected to a0
int photocell_val = 0;
int pot_val = 0;

void setup() {
  pinMode (POT_SENSOR, INPUT);
  pinMode (PHOTOCELL, INPUT);
  Serial.begin(9600); // Start serial communication at 9600 baud
}

void loop() {
  ////////////////************** POTENTIOMETER **************////////////////
 
  pot_val = analogRead(POT_SENSOR);
  pot_val = map(pot_val, 0, 1023, 0, 150);
  delay(100); // Wait 100 milliseconds

  //  Serial.print("Potentiometer reading = ");
  //  Serial.println(pot_val);
  Serial.write(pot_val);

  ////////////////************** PHOTORESISTOR **************////////////////

  photocell_val = analogRead(PHOTOCELL);
  photocell_val = map(photocell_val, 0, 1023, 151, 255);;
  delay(100);

  //  Serial.print("Photocell reading = ");
  //  Serial.println(photocell_val);
  Serial.write(photocell_val);
}
