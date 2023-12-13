PImage img;
int blockSize = 5; 
int minSize = 3;   
int maxSize = 8; 

void setup() {
  size(1202, 1400); 
  background(255);

  img = loadImage("nord5.png");
}

void draw() {
  background(0);

for (int y = 0; y < img.height; y += blockSize) {
for (int x = 0; x < img.width; x += blockSize) {
color c = img.get(x, y); 

  float bright = brightness(c); 
  float rectSize = map(bright, 0, 255, minSize, maxSize); 

  rectSize += random(-80, 110); 

  fill(c);  
  noStroke(); 
  rect(x, y, rectSize, rectSize);
}
}
}
