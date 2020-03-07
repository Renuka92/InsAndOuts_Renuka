class Grass {
  // data (instance variables)
  int x;
  int y;
  int d;
  int speed;

  // constructor
  Grass(int tempX, int tempY, int tempD, int tempSpeed) {
    x = tempX;
    y = tempY;
    d = tempD;
    speed = tempSpeed;
  }

  // methods
  void display() {
    fill(200, 255, 100);
    triangle(x, y, x+d, y, x+25, y-30);
  }

  void move() {
    if (mouseX < width/2 && mouseX>width/2-15 && mouseX<width/2+15) {
      x = x + speed;
      if (x>width) {
        x=0;
      }
    }
  }
}
