//The Flower 2.0 by Renuka 
float r = 225;
float g = 225;
float b = 225;
int diameter = 100; 

void setup() {
  size (1080, 720);
}

void draw() {
  // move cursor on the left side to keep the sun and sky
  // move the cursor to the right side to make the sky gray
  if (mouseX > width/2) {
    background (100);
  } else {
    background (135, 206, 235);
  }

  //SUN 
  //Press and hold the spacebar to increase the size of the sun
  fill(255, 255, 0);
  if (mouseX < width/2){
    ellipse(0, 0, diameter, diameter);
  }
  if (keyPressed == true){
    ellipse(0, 0, diameter, diameter++);
    if (diameter >= 350){
      diameter = 350;
    } 
  }
  
  //STEM
  noStroke();
  fill(53, 94, 59);
  rect(525, 360, 30, 360);

  //arc(x, y, width, height, start, stop, mode)

  //LEFT LEAF
  arc(530, 600, 80, 30, HALF_PI, PI+HALF_PI);

  //RIGHT LEAF
  arc(550, 640, 80, 30, PI+HALF_PI, TWO_PI+HALF_PI);

  fill(255, 255, 0);
  stroke(r, g, b);
  strokeWeight(100);
  
  // press the mouse to change the color of the flower 
  //PETALS
  //diagonal top left to bottom right
  line (450, 275, 630, 440);

  //diagonal top right to bottom left
  line (630, 275, 445, 440);

  //vertical
  line (540, 230, 540, 475);

  //horizontal
  line (415, 360, 675, 360);

  //CENTER CIRCLE
  fill(r-100, g-100, b-100);
  noStroke();
  circle(540, 360, 100);
}

// assign random values for r, g, b
void mousePressed() {
  r = random(255);
  g = random(255);
  b = random(255);
}
