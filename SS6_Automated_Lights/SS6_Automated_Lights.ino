// sets up constant integer variables for pins (will not change)
const int buttonPin = 2;  // creates variable called buttonPin and assigns value of 2
const int LED1 = 13;      // creates variable called LED and assigns value of 13
const int LED2 = 12;      // creates variable called LED and assigns value of 12
const int LED3 = 11;      // creates variable called LED and assigns value of 11
const int LED4 = 10;      // creates variable called LED and assigns value of 10
const int LED5 = 9;       // creates variable called LED and assigns value of 9
const int LED6 = 8;       // creates variable called LED and assigns value of 8
const int LED7 = 7;       // creates variable called LED and assigns value of 7

// sets up integer variable that will change over time
int buttonState = 0;         // creates variable to track buttonState, assigns initial value of 0


// setup runs once at startup
void setup() {
  // initialize LED pin as an output.
  pinMode(LED1, OUTPUT);  
  pinMode(LED2, OUTPUT);
  pinMode(LED3, OUTPUT);
  pinMode(LED4, OUTPUT);
  pinMode(LED5, OUTPUT);
  pinMode(LED6, OUTPUT);
  pinMode(LED7, OUTPUT);
  // initialize pushbutton pin as an input.
  pinMode(buttonPin, INPUT);  
}

// loop runs infinitely
void loop() {
  buttonState = digitalRead(buttonPin);    // read the state of the pushbutton value
  delay (5); //small delay for debouncing, to increase accuracy

  // conditional statement
  if (buttonState == HIGH) { 
    // if button is pressed (voltage received on pin 2), send voltage to LED pin
    digitalWrite(LED1, HIGH);      
    digitalWrite(LED7, HIGH);
    delay(500);
    digitalWrite(LED2, HIGH);
    digitalWrite(LED6, HIGH);
    delay(500);
    digitalWrite(LED3, HIGH);
    digitalWrite(LED5, HIGH);
    delay(500);
    digitalWrite(LED4, HIGH);
    delay(1500);
    digitalWrite(LED4, LOW);
    delay(500);
    digitalWrite(LED3, LOW);      
    digitalWrite(LED5, LOW);
    delay(500);
    digitalWrite(LED2, LOW);
    digitalWrite(LED6, LOW);
    delay(500);
    digitalWrite(LED1, LOW);
    digitalWrite(LED7, LOW);
    delay(500);
  } else {   
    //otherwise turn off voltage to LEDs
    digitalWrite(LED1, LOW);     
    digitalWrite(LED2, LOW);
    digitalWrite(LED3, LOW);
    digitalWrite(LED4, LOW);
    digitalWrite(LED5, LOW);
    digitalWrite(LED6, LOW);
    digitalWrite(LED7, LOW);     
  }
}
