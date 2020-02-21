//The Flower by Renuka Sookdeosingh
size (1080, 720);
background (135, 206, 235);

//rect(x, y, w, h, radii, r_tl, r_tr, r_br, r_bl);

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
stroke(220, 162, 220);
strokeWeight(100);

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
fill(240, 225, 48);
noStroke();
circle(540, 360, 100);
