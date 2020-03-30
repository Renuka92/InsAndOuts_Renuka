//SEASON'S GREETINGS by Renuka
int scene = 0;
int currentTime = 0;
int timer1 = 5000;
int timer2 = 10000;
int limit = 15000;

//Snow Globe
int[] xCoordinate = new int[500];
int[] yCoordinate = new int[500];
PImage [] images = new PImage[4];
int imageIndex = 0;
int snow = 1;
float move = 0;
float opacity = 10;
float fade = 1;

//Flower
float r = 225;
float g = 225;
float b = 225;
float y = 0;
float count = 0;
int diameter = 170; 
PImage cloud;

//Beach
PImage [] fish = new PImage[3];
float yoff = 0.0;
float xValue;
float yValue;

void setup() {
  size(1080, 720);
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER);

  //Snow Globe
  //assign random values to x and y coordinates
  for (int i=0; i<xCoordinate.length; i++) {
    xCoordinate[i] = int(random(370, 710));
    yCoordinate[i] = int(random(100, 500));
  }

  //load background images
  for (int i=0; i<images.length; i++) {
    images[i] = loadImage("globe"+i+".png");
  }

  cloud = loadImage("cloud.png"); //Flower

  //Beach
  xValue = 0;
  yValue = height/2+150;

  for (int i=0; i<fish.length; i++) {
    fish[i] = loadImage("fish"+i+".png");
  }
}

void draw() { 
  currentTime=millis(); // must be out of if statement 
  
  if (currentTime>limit) {
    scene = 4;
    endScreen();
  } else if (currentTime>timer2) { //beach
    scene = 3;
    beach();
  } else if (currentTime>timer1) { //flower
    scene = 2;
    flower();
  } else if (scene == 1) { //globe
    snowGlobe();
  } else if (scene == 0) {
    startScreen();
  }

  if (scene==4) {
    if (key=='1') {
      snowGlobe();
    } else if (key=='2') {
      flower();
    } else if (key=='3') {
      beach();
    } else {
      scene=4;
    }
  }

  println(currentTime);

}

void startScreen() {
  background(0);
  textSize(40);
  text("Press return to begin a seasonal journey", width/2, height/2);
}

void snowGlobe() {
  globeShape();
  //create snow circles using random x and y coordinates
  for (int j=0; j<xCoordinate.length; j++) {
    snow(xCoordinate[j], yCoordinate[j]);
  }
  globeText();
}

void flower() {
  sky();
  sun();
  stem_leafs();
  petals_center();
}

void beach() {
  background(255);
  fill(0, 0, 255, 200);
  waves();
  fish();
}

void endScreen() {
  background(0);
  fill(255);
  textSize(40);
  text("Thank you for visiting!", width/2, height/2-200);
  text("Use keys to navigate through seasons:", width/2, height/2-50);
  text("1 - Winter Wonderland", width/2, height/2+50);
  text("2 - Spring into Action", width/2, height/2+125);
  text("3 - Summer Solstice", width/2, height/2+200);
}

void globeShape() {
  background(300);
  //click for new image in globe
  image(images[imageIndex], width/2, height/2-25);
  noFill();
  strokeWeight(20);
  stroke(300);
  ellipse(width/2, height/2-25, 550, 550);
  fill(0);
  quad(height/2, width/2-10, height, width/2-10, 800, 610, 300, 610);
}

void snow(int x, int y) {
  fill(255);
  noStroke();
  ellipse(x, constrain(y+move, 100, 530), 10, 10);
  // restart snow if spacebar is pressed
  if (keyPressed == true) {
    move=0;
  } else if (y + move<=500) {
    move+=0.005;
  }
}

void globeText () {
  //change text at bottom of globe based on image
  if (imageIndex == 0) {
    greeting("Snowball Fight");
  } else if (imageIndex == 1 || imageIndex == 2) {
    greeting("Snow Day");
  } else if (imageIndex == 3) {
    greeting("Snow Angels");
  }
}

void greeting(String message) {
  fill(opacity);
  textSize(45);
  text (message, width/2, height-135);
  opacity = opacity+fade;
  if (opacity>255 || opacity<0) {
    fade= -fade;
  }
}

void sky() {
  // SKY/RAIN SHOWER BACKGROUND & CLOUD IMAGE
  //move cursor on the left side to keep the sun and sky
  //move the cursor to the right side to make the sky gray
  if (mouseX < width/2) {
    background (135, 206, 235);
    image(cloud, width-150, height-600);
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
}

void sun() {
  noStroke();
  fill(255, 255, 0);
  if (mouseX < width/2) {
    ellipse(0, 0, diameter, diameter);
    if (keyPressed == true && diameter <= 350) {
      ellipse(0, 0, diameter, diameter++);
    }
  } 

  //MOVE SUN RAYS - only if mouse is in upper left quadrant
  if (diameter > 350 && mouseX < width/4 && mouseY < height/4) {
    pushMatrix();
    rotate(-mouseX/100.0);
    beginShape(TRIANGLES);
    vertex(10, 170);
    vertex(45, 220);
    vertex(50, 160);

    vertex(70, 150);
    vertex(105, 190);
    vertex(110, 130);

    vertex(129, 120);
    vertex(165, 150);
    vertex(150, 80);

    vertex(160, 65);
    vertex(210, 70);
    vertex(170, 40);
    endShape();
    popMatrix();
  }

  //SUN WORDS
  textSize(20);
  fill(0);
  if (mouseX < width/2 && keyPressed == true) {
    if (diameter > 350) {
      text ("HELLO", 70, 60);
      text ("SUNSHINE", 75, 90);
    } else if (diameter > 250) {
      text ("Rising...", 60, 50);
    } else {
      text ("press", 35, 20);
      text ("space", 35, 50);
    }
  }
}

void stem_leafs() {
  noStroke();
  fill(53, 94, 59);
  rect(width/2, height, 30, height);
  arc(530, 600, 80, 30, HALF_PI, PI+HALF_PI);   //LEFT LEAF
  arc(550, 640, 80, 30, PI+HALF_PI, TWO_PI+HALF_PI);   //RIGHT LEAF
}

void petals_center() {
  stroke(r, g, b);
  strokeWeight(100);

  // press mouse to change color of the flower 
  //PETALS
  line (450, 275, 630, 440); //diagonal top left to bottom right
  line (630, 275, 445, 440); //diagonal top right to bottom left
  line (540, 230, 540, 475); //vertical
  line (415, 360, 675, 360); //horizontal

  //CENTER CIRCLE
  fill(r-100, g-100, b-100);
  noStroke();
  circle(540, 360, 100);
}

void mouseClicked () {
  imageIndex = int(random(images.length));
}

// assign random values for r, g, b of flower
void mousePressed() {
  r = random(255);
  g = random(255);
  b = random(255);
}

void waves() {
  /* Adapted from Daniel Schiffman's Noise Wave example - 
   https://processing.org/examples/noisewave.html */
  beginShape(); 
  float xoff = 0.0;

  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x += 5) {
    // Calculate a y value according to noise, map to 
    // map function - map(a, start, stop, start2, stop2)
    // convert 'a' value to a value in range (start, stop) to (start2, stop2);
    float y = map(noise(xoff, yoff), 0, 1, 400, 500);

    // Set the vertex
    vertex(x, y); 
    // Increment x dimension for noise
    xoff += 0.05;
  }
  // increment y dimension for noise
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
}

void fish() {
  image(fish[0], xValue, yValue);
  image(fish[2], width-xValue, yValue+70);
  image(fish[1], xValue+50, yValue+150);

  xValue++;
  if (xValue>width+10) {
    xValue=-10;
  }
}

void keyPressed() {
  if (key==ENTER || (key=='1' && currentTime>limit)) {
    scene=1;
  } else if (key=='2' && currentTime>limit) {
    scene=2;
  } else if (key=='3' && currentTime>limit) {
    scene=3;
  }
}
