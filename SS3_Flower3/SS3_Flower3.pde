//The Flower 3.0 by Renuka 
float r = 225;
float g = 225;
float b = 225;
float y = 0;
float count = 0;
int diameter = 100; 

void setup() {
  size (1080, 720);
  rectMode(CENTER);
}

void draw() {
  //RAIN SHOWER
  // move cursor on the left side to keep the sun and sky
  // move the cursor to the right side to make the sky gray
  if (mouseX < width/2) {
    background (135, 206, 235);
  } else {
    background (count);
    for (int x=0; x<=width+40; x+=50) {
      stroke(0);
      strokeWeight(4);
      line(x, y, x, y-15); //bottom row
      line(x-30, y-30, x-30, y-45); //middle row
      line(x-60, y-60, x-60, y-75); //top row
    }
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

  //SUN 
  //Press and hold the spacebar to increase the size of the sun
  noStroke();
  fill(255, 255, 0);
  if (mouseX < width/2) {
    ellipse(0, 0, diameter, diameter);
  }
  if (keyPressed == true && diameter <= 350) {
    ellipse(0, 0, diameter, diameter++);
  }

  //Mouse pressed on stem creates "grass" pattern

  if (mouseX < width/2 && mouseX>width/2-15 && mouseX<width/2+15) {
    for (int y=height/2; y<height; y+=5) {
      for (int x = 0; x<=width; x+=85) {
        for (int d=40; d<width; d+=85) {
          stroke(91, 163, 102);
          fill (91, 163, 102);
          triangle(x, height, d, height-70, x+80, height);
        }
      }
    }
  }

  //STEM
  noStroke();
  fill(53, 94, 59);
  rect(width/2, height, 30, height);

  //arc(x, y, width, height, start, stop, mode)

  //LEFT LEAF
  arc(530, 600, 80, 30, HALF_PI, PI+HALF_PI);

  //RIGHT LEAF
  arc(550, 640, 80, 30, PI+HALF_PI, TWO_PI+HALF_PI);

  fill(255, 255, 0);
  stroke(r, g, b);
  strokeWeight(100);

  // press mouse to change color of the flower 
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
