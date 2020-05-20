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
  pot_val = analogRead(POT_SENSOR); //read sensor and assign to variable called val
  pot_val = map(pot_val, 0, 1023, 0, 150); //divide val by 4 or remap values to get byte-sized 0-255
  delay(100); // Wait 100 milliseconds

  /////////Uncomment Serial.print() OR Serial.write() and not both!//////////////

//  Serial.print("Potentiometer reading = ");
//  Serial.println(pot_val); //to send human-readable data to Arduino monitor
  Serial.write(pot_val);  //to send binary data to Processing

  photocell_val = analogRead(PHOTOCELL);
  photocell_val = map(photocell_val, 0, 1023, 151, 255);;
  delay(100);
 
//  Serial.print("Photocell reading = ");
//  Serial.println(photocell_val); 
  Serial.write(photocell_val);  //to send binary data to Processing
}
