PImage DM;

float TILES_X = 70;
float TILES_Y = TILES_X;
float TILE_W, TILE_H;

void setup() {
  size(600, 600);
  DM = loadImage("DM.png");
  DM.resize(width, height);


  TILE_W = width / TILES_X;
  TILE_H = height / TILES_Y;
}

void draw() {

  background(#f1f1f1);
  noStroke();


  for (int x = 0; x < TILES_X; x++) {
    for (int y = 0; y < TILES_Y; y++) {
      
      int px = int(x * TILE_W);
      int py = int(y * TILE_H);

      color c = DM.get(px, py);
      float b = brightness(c);

      fill(b);
      
      push();
      translate(x * TILE_W, y * TILE_H);
      rect(0, 0, TILE_W, TILE_H);
      pop();
    }
  }
}
