int age = 34;
PImage img;

void setup(){
  size(500, 500);
  img = loadImage("DM.png");
  img.resize(500,500);
  
}

void draw(){
  background(255);
  
  fill(0);
  noStroke();
  
  float tiles = mouseX/5;
  float tileSize = width/tiles;
  
  translate(tileSize/5, tileSize/5);
  
  for (int x = 0; x < tiles; x++){
    for (int y = 0; y < tiles; y++) {
      
      color c = img.get(int(x*tileSize), int(y*tileSize));
      float size = map(brightness(c), 0, 255, tileSize, 0);
      
      ellipse(x*tileSize, y*tileSize, size, size);
    }
  }
  
}
