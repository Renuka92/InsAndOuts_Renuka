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
  //text ("this light", width/4, height/4);
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

//mouse location controls communication to Serial 
  //if (mouseY > width/2 && mouseY < height) {  
  //  myPort.write(0); //send a 0
  //  println ("0");
  //} else 
  
  int tracker = get(mouseX, mouseY);
  //myTracker.write(tracker);
  
  print("tracker: "+tracker);
  
  if (tracker == -65536) {
    //val = int (map (mouseX, 0, width/2, 0, 255/2));
    if (mousePressed) {
      val=5;
    } else {
      val=1;
    }
    myPort.write(val);  
    println("red 1"); 
  } else if (tracker == -256) {
    //val = int (map (mouseX, width/2, width, 0, 255/2));
    if (mousePressed) {
      val=6;
    } else {
      val=2;
    }
    myPort.write(val);  
    println ("yellow 2"); 
  } else if (tracker == -16776961) {
    //val = int (map (mouseX, 0, width/2, 0, 255/2));
    if (mousePressed) {
      val=7;
    } else {
      val=3;
    }
    myPort.write(val);   
    println ("blue 3"); 
  } else if (tracker == -16711936) {
    //val = int (map (mouseY, height/2, height, 0, 255));
    if (mousePressed) {
      val=8;
    } else {
      val=4;
    }
    myPort.write(val);  
    println ("green 4"); 
  //} else if (mousePressed) {
  //  myPort.write(5);  
  //  println ("all");
  } else {  //otherwise
    myPort.write(0); //send a 0
    println ("0");
  }
  
  println(val);
  

}
