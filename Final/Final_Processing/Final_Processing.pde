import processing.serial.*;

Serial myPort;
int val;
int photocell_val=0;
int pot_val=0;
float r = 225;
float g = 93;
float b = 196;
float xMove = 800;
float yMove = 140;
float count = 0;
int diameter = 145; 
PImage watering_can;
PImage droplets;
PImage sad_face;
PImage straight_face;
PImage happy_face;
int[] xCoordinate = new int[300];
int[] yCoordinate = new int[300];
float move = 0;

void setup() {
  size (1080, 720);
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER);
  textSize(20);

  //printArray(Serial.list()); 
  String portName = Serial.list()[3]; 
  myPort = new Serial(this, portName, 9600);

  //create random coordinates for rain
  for (int i=0; i<xCoordinate.length; i++) {
    xCoordinate[i] = int(random(width/3+50, 2*(width/3)-50));
    yCoordinate[i] = int(random(0, 200));
  }
}

void draw() {
  background(125, 212, 242);
  
  watering_can = loadImage("can.png"); //watering can
  droplets = loadImage("drops.png"); //water droplets
  sad_face = loadImage("frown.png"); //frowning face
  straight_face = loadImage("straight.png"); //straight face
  happy_face = loadImage("smile.png"); //smiling face

  if (myPort.available() > 0) { 
    val = myPort.read();
  }

  if (val>150) {
    photocell_val = val;
  } else {
    pot_val = val;
  }

  println ("Photocell = " + photocell_val);
  println ("Pot val = " + pot_val);

  if (pot_val>=145) {
    background(255);
    water(50);
  } else if (pot_val>100) {
    background(200, 0, 0);
    water(75);
  } else if (pot_val>50) {
    background(0, 200, 0);
    water(100);
  } else if (pot_val>20) {
    background(0, 0, 200);
    water(150);
  } else {
    water(200);
  }

  flower();
}  

void flower() {
  image(watering_can, width-150, height-600);
  stem_leafs();
  petals_center();
}

void stem_leafs() {
  noStroke();
  fill(53, 94, 59);
  rect(width/2, height, 30, height);
  arc(530, 600, 80, 30, HALF_PI, PI+HALF_PI);          //LEFT LEAF
  arc(550, 640, 80, 30, PI+HALF_PI, TWO_PI+HALF_PI);   //RIGHT LEAF
}

void petals_center() {
  //r = photocell_val;
  //b = photocell_val; 
  stroke(r, g, b);
  strokeWeight(100);

  //PETALS
  line (450, 275, 630, 440); //diagonal top left to bottom right
  line (630, 275, 445, 440); //diagonal top right to bottom left
  line (540, 230, 540, 475); //vertical
  line (415, 360, 675, 360); //horizontal

  //CENTER CIRCLE
  fill(r-100, g-100, b-100);
  noStroke();
  circle(width/2, height/2, diameter);
  
  if (pot_val>=145) {
    image(happy_face, width/2, height/2);
  } else if (pot_val>100) {
    image(straight_face, width/2, height/2);
  } else {
    image(sad_face, width/2, height/2);
  }
}

void water(int space) {
  for (int x=0; x<=width+40; x+=space) {
    if (pot_val>=145) {
      image(droplets, xMove-40, yMove-200);
      image(droplets, xMove+100, yMove-200);
      image(droplets, xMove+30, yMove-105);
      image(droplets, xMove-100, yMove-100);
      image(droplets, xMove, yMove);
      xMove-=0.1;
      yMove+=0.1;
    } else if (pot_val>100) {
      image(droplets, xMove+100, yMove-200);
      image(droplets, xMove+30, yMove-105);
      image(droplets, xMove-100, yMove-100);
      image(droplets, xMove, yMove);
      xMove-=0.135;
      yMove+=0.135;
    } else if (pot_val>50) {
      image(droplets, xMove+30, yMove-105);
      image(droplets, xMove-100, yMove-100);
      image(droplets, xMove, yMove);
      xMove-=0.125;
      yMove+=0.125;
    } else if (pot_val>20) {
      image(droplets, xMove-100, yMove-100);
      image(droplets, xMove, yMove);
      xMove-=0.1;
      yMove+=0.1;
    } else {
      image(droplets, xMove, yMove);
      xMove-=0.05;
      yMove+=0.05;  
    }

    if (yMove>=(height/4)+100) {
      yMove=140;
      xMove=800;
    }
  }
}
