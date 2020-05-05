int val = 0;

import processing.serial.*;  //import Serial library

Serial myPort;  // create object from Serial class

void setup() {
  size(500, 500); 
  background (255);
  fill(0);
  textSize (22);
  textAlign (CENTER);

  //set up Serial communication
  printArray(Serial.list()); // prints port list to the console
  String portName = Serial.list()[3]; //change to match your port
  myPort = new Serial(this, portName, 9600); //initialize Serial communication at 9600 baud
}

void draw() {
  noStroke();
  fill(255, 0, 0);
  rect(0, 0, width/2, width/2);
  fill(0);
  fill(255, 255, 0);
  rect(width/2, 0, width/2, width/2);
  fill(0, 0, 255);
  rect(0, width/2, width/2, width);
  fill(0, 255, 0);
  rect(width/2, width/2, width, width);

  stroke(0);
  strokeWeight(5);
  line(width/2, 0, width/2, height);
  line(0, width/2, width, width/2);

  int tracker = get(mouseX, mouseY);

  println("tracker: "+tracker);

  if (tracker == -65536) {
    if (mousePressed) {
      val=5;
    } else {
      val=1;
    }
    myPort.write(val);  
    println("red 1");
  } else if (tracker == -256) {
    if (mousePressed) {
      val=6;
    } else {
      val=2;
    }
    myPort.write(val);  
    println ("yellow 2");
  } else if (tracker == -16776961) {
    if (mousePressed) {
      val=7;
    } else {
      val=3;
    }
    myPort.write(val);   
    println ("blue 3");
  } else if (tracker == -16711936) {
    if (mousePressed) {
      val=8;
    } else {
      val=4;
    }
    myPort.write(val);  
    println ("green 4");
  } else {  
    myPort.write(0); 
    println ("0");
  }

  println(val);
}
