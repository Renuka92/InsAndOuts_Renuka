/* Flourishing Flower by Renuka
 
 To interact with the sketch, turn the potentiometer to add water 
 droplets and make the flower go from feeling sad to being happy. 
 Increase the amount of light the photoresistor receives to make 
 the dull flower bright again. */

////////////////********** Arduino Variables **********////////////////

import processing.serial.*;
Serial myPort;
int val;
int photocell_val=0;
int pot_val=0;

///////////////********** Processing Variables **********///////////////

int diameter = 145; //flower center
float r = 225;
float g = 93;       
float b = 196;
float xMove = 800;  //move droplets in x direction
float yMove = 140;  //move droplets in y direction

////////////////************** IMAGES **************////////////////

PImage wateringCan;
PImage droplets;
PImage smallDrops;
PImage sadFace;
PImage straightFace;
PImage happyFace;

void setup() {
  size (1080, 720);
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER);
  textSize(20);

  //printArray(Serial.list()); 
  String portName = Serial.list()[3]; 
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  background(125, 212, 242);

////////////////************ Load Images ************////////////////

  wateringCan = loadImage("can.png");        //watering can
  droplets = loadImage("drops.png");         //water droplets
  smallDrops = loadImage("drops_small.png"); //smaller drops
  sadFace = loadImage("frown.png");          //frowning face
  straightFace = loadImage("straight.png");  //straight face
  happyFace = loadImage("smile.png");        //smiling face

////////////////********* Read Sensor Values *********////////////////

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

///////////********* Add water depending on pot val *********///////////

  if (pot_val>=145) {
    water(50);
  } else if (pot_val>100) {
    water(75);
  } else if (pot_val>50) {
    water(100);
  } else if (pot_val>20) {
    water(150);
  } else {
    water(200);
  }
  
  flower();
}  

////////////////************** FUNCTIONS **************////////////////

void flower() {
  image(wateringCan, width-150, height-600);
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
  r = photocell_val;
  b = photocell_val; 
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

///////////****** Change face of flower with water & light ******///////////

  if (pot_val>=145 && photocell_val>=245) {
    image(happyFace, width/2, height/2);
  } else if (pot_val>100) {
    image(straightFace, width/2, height/2);
  } else {
    image(sadFace, width/2, height/2);
  }
}

/////////////****** Water Droplets from Watering Can ******/////////////

void water(int space) {
  for (int x=0; x<=width+40; x+=space) {
    if (pot_val>=145) {
      image(smallDrops, xMove-20, yMove-200);
      image(droplets, xMove+28, yMove-115);
      image(smallDrops, xMove-100, yMove);
      image(droplets, xMove-100, yMove-100);
      image(droplets, xMove, yMove);
      xMove-=0.1;
      yMove+=0.1;
    } else if (pot_val>100) {
      image(droplets, xMove+28, yMove-115);
      image(smallDrops, xMove-100, yMove);
      image(droplets, xMove-100, yMove-100);
      image(droplets, xMove, yMove);
      xMove-=0.135;
      yMove+=0.135;
    } else if (pot_val>50) {
      image(droplets, xMove-100, yMove-100);
      image(smallDrops, xMove-100, yMove);
      image(droplets, xMove, yMove);
      xMove-=0.125;
      yMove+=0.125;
    } else if (pot_val>20) {
      image(smallDrops, xMove-100, yMove);
      image(droplets, xMove, yMove);
      xMove-=0.1;
      yMove+=0.1;
    } else {
      image(droplets, xMove, yMove);
      xMove-=0.05;
      yMove+=0.05;
    }

    //resets values of xMove and yMove
    if (yMove>=(height/4)+100) {
      xMove=800;
      yMove=140;
    }
  }
}
