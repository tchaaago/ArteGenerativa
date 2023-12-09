PGraphics pg;
PImage DM;

int TILES_X = 50;
int TILES_Y = 35;

float TILE_W, TILE_H;

PFont FONT;

String CHARS = " ._▂▃▄▅▆▇░▒▓█";

void setup() {
  size(600, 600);
  pg = createGraphics(width, height);
  DM = loadImage("DM.png");
  DM.resize(width, height);

  FONT = createFont("IBMPlexMono-Regular.otf", 1000);

  TILE_W = width / TILES_X;
  TILE_H = height / TILES_Y;

  textFont(FONT);
  textAlign(CENTER, CENTER);
  textSize(16);
}

void draw() {

  background(#f1f1f1);
  noStroke();

  pg.beginDraw();
  pg.noStroke();
  pg.background(0);
  pg.translate(pg.width/2, pg.height/2);
  pg.scale(map(sin(radians(frameCount)),-1,1,0.1,2));
  pg.imageMode(CENTER);
  pg.image(DM,0,0);
  pg.endDraw();
  

  PImage buffer = pg.get();

  for (int x = 0; x < TILES_X; x++) {
    for (int y = 0; y < TILES_Y; y++) {

      int px = int(x * TILE_W);
      int py = int(y * TILE_H);
      color c = buffer.get(px, py);
      float b = brightness(c);

      int selector = int( map(b, 0, 255, CHARS.length()-1, 0) );

      push();
      fill(0);
      translate(x * TILE_W, y * TILE_H);
      text(CHARS.charAt(selector), 0, 0);
      pop();

    }
  }
}
