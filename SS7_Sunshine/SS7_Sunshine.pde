import processing.serial.*; //imports Serial library from Processing

Serial myPort; // creates object from Serial class
int val=0; // creates variable for data coming from serial port
int sunY=500;
float y=0;
float count=0;

void setup() {
  size(500, 500);
  rectMode(CENTER);

  printArray(Serial.list()); // this line prints the port list to the console
  String portName = Serial.list()[3]; //change the number in the [] for the port you need
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  background(0);
  if (myPort.available() > 0) { // If data is available,
    val = myPort.read(); // read it and store it in val
  }

  if (val==255) {
    background(135, 206, 235);
    sunRays();
    sun();
    sunY=500;
  } else if (val>250) {
    background(135, 206, 235);
    sun();
  } else if (val>150) {
    background(135, 206, 235);
    sunrise();
  } else if (val>100) {
    background(135, 206, 235);
  } else if (val>55) {
    rain();
  }

  println (val); //prints to Processing console
}

void sun() {
  noStroke();
  fill(255, 255, 0);
  ellipse(width/2, height/2, val, val);
}

void sunrise() {
  noStroke();
  fill(255, 255, 0);
  if (sunY>=height/2) {
    ellipse(width/2, sunY, val, val);
    sunY--;
  }
}

void sunRays() {
  fill(255, 255, 0);
  pushMatrix();
  //rotate(mouseX/100.0);
  beginShape(TRIANGLES);
  //top
  vertex(width/2-30, height/2+120);
  vertex(width/2, height/2+180); 
  vertex(width/2+30, height/2+120);

  //bottom
  vertex(width/2+30, height/2-120);
  vertex(width/2, height/2-180); 
  vertex(width/2-30, height/2-120);

  //left
  vertex(width/2-120, height/2-30);
  vertex(width/2-180, height/2); 
  vertex(width/2-120, height/2+30);

  //right
  vertex(width/2+120, height/2-30);
  vertex(width/2+180, height/2); 
  vertex(width/2+120, height/2+30);

  //upper left
  vertex(width/2-45, height/2-95);
  vertex(width/2-120, height/4); 
  vertex(width/2-95, height/2-45);

  //upper right
  vertex(width/2+45, height/2-95);
  vertex(width/2+120, height/4); 
  vertex(width/2+95, height/2-45);

  //lower left
  vertex(width/2-45, height/2+95);
  vertex(width/2-120, 3*(height/4)); 
  vertex(width/2-95, height/2+45);

  //lower right
  vertex(width/2+45, height/2+95);
  vertex(width/2+120, 3*(height/4)); 
  vertex(width/2+95, height/2+45);

  endShape();
  popMatrix();
}

void rain() {
  background (count);
  for (int x=0; x<=width+40; x+=50) {
    stroke(0);
    strokeWeight(4);
    line(x, y, x, y-15); //bottom row
    line(x-30, y-30, x-30, y-45); //middle row
    line(x-60, y-60, x-60, y-75); //top row
  }

  y+=1.5;  //y value of lines increments after we exit the for loop

  if (y>=(height/4)+50) { //if y value reaches 50 pixels below canvas
    y=-50;  //sets y value to 50 pixels above canvas
  }

  if (count<=100) {
    count = count+0.5;
  } else {
    count = 10;
  }

  y+=1.5;  //y value of lines increments after we exit the for loop

  if (y>=(height/4)+50) { //if y value reaches 50 pixels below canvas
    y=-50;  //sets y value to 50 pixels above canvas
  }

  if (count<=100) {
    count = count+0.5;
  } else {
    count = 10;
  }
}
