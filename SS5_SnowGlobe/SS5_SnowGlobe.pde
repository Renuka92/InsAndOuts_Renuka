//Snow Globe by Renuka
int[] xCoordinate = new int[500];
int[] yCoordinate = new int[500];
float move = 0;

PImage [] images = new PImage[4];
int imageIndex = 0;

float opacity = 10;
float fade = 1;

int snow = 1;

void setup() {
  size(900, 600);
  imageMode(CENTER);
  textAlign(CENTER);
  textSize(45);

  //assign random values to x and y coordinates
  for (int i=0; i<xCoordinate.length; i++) {
    xCoordinate[i] = int(random(300, 600));
    yCoordinate[i] = int(random(100, 500));
  }

  //load background images
  for (int i=0; i<images.length; i++) {
    images[i] = loadImage("globe"+i+".png");
  }
}

void draw() {
  background(300);
  tint(250);
  image(images[imageIndex], width/2, height/2);

  //globe circle
  noFill();
  strokeWeight(20);
  stroke(300);
  ellipse(width/2, height/2, 475, 475);

  fill(0);
  //quad needs 4 pairs of x and y going clockwise
  quad(300, 500, 600, 500, 675, 580, 225, 580); 

  //create snow circles using random x and y coordinates
  for (int j=0; j<xCoordinate.length; j++) {
    snow(xCoordinate[j], yCoordinate[j]);
  }

  //change text at bottom of globe based on image
  if (imageIndex == 0) {
    greeting("Snowball Fight");
  } else if (imageIndex == 1 || imageIndex == 2) {
    greeting("Snow Day");
  } else if (imageIndex == 3) {
    greeting("Snow Angels");
  }
}

void snow(int x, int y) {
  fill(255);
  noStroke();
  ellipse(x, constrain(y+move, 100, 500), 10, 10);
  // restart snow if spacebar is pressed
  if (keyPressed == true) {
    move=0;
  } else if (y + move<=500) {
      move+=0.005;
    }
  }

void greeting(String message) {
  fill(opacity);
  text (message, width/2, height-40);
  opacity = opacity+fade;
  if (opacity>255 || opacity<0) {
    fade= -fade;
  }
}

void mouseClicked () {
  imageIndex = int(random(images.length));
}
