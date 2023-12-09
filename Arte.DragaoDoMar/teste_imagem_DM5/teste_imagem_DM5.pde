PImage DM;

float TILES_X = 100;
float TILES_Y = 70;

float TILE_W, TILE_H;

PFont FONT;

String CHARS = "#/-. ";

void setup() {
  size(600, 600);
  DM = loadImage("DM.png");
  DM.resize(width, height);
  
  FONT = createFont("CascadiaCode.ttf", 1000);

  TILE_W = width / TILES_X;
  TILE_H = height / TILES_Y;
  
  textFont(FONT);
  textAlign(CENTER, CENTER);
  textSize(10);
  
}

void draw() {

  background(#f1f1f1);
  noStroke();
  
  translate(TILE_W / 2, TILE_H / 2);

  for (int x = 0; x < TILES_X; x++) {
    for (int y = 0; y < TILES_Y; y++) {
      
      int px = int(x * TILE_W);
      int py = int(y * TILE_H);

      color c = DM.get(px, py);
      float b = brightness(c);
      
      int selector = int( map(b,0,255,0,CHARS.length() - 1 ) );

      fill(0);
      
      push();
      translate(x * TILE_W, y * TILE_H);
      text(CHARS.charAt(selector), 0, 0);
      pop();
    }
  }
}
