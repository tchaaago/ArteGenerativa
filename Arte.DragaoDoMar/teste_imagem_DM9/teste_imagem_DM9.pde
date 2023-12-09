PImage DM;
PGraphics scene;
PFont font;

void setup() {
  size(600, 600);
  DM = loadImage("DM.png");
  font = createFont("IBMPlexMono-Regular.otf", 1000);
  scene = createGraphics(width, height);
  DM.resize(width, 0);
}

void draw() {
  scene.beginDraw();
  scene.background(#000000);
  scene.imageMode(CENTER);
  scene.translate(width/2, height/2);
  scene.scale(map(sin(radians(frameCount*2)), -1, 1, 0, 2));
  scene.image(DM, 0, 0);

  scene.endDraw();
   scene.endDraw();

  rendererAscii(
    scene, // Input PGraphics object
    font, // font to use
    20, // font size
    " █▛▜▟▙▄▀▐▌▞▚▝▖▗▘", // charset 
    50, // cols
    40, // rows
    width*0.4, // spread
    #f1f1f1, // background color
    0); // foreground color
}
void rendererAscii(

  PGraphics in, // the input PGraphics object
  PFont fnt, // the font object
  float fontSize, // the font size
  String chars, // the charset to use
  int tilesX, // the amount of cols
  int tilesY, // the amount of rows
  float spread, // the magnitude of the grid from the center
  color bg, // the background-color
  color fg // the foreground-color
  ) {

  PGraphics pg;

  pg = createGraphics(width, height);
  pg.beginDraw();
  pg.background(bg);
  pg.fill(fg);
  pg.noStroke();

  float tileW = width / tilesX;
  float tileH = height / tilesY;

  pg.fill(0);
  pg.textFont(fnt);
  pg.textSize(fontSize);
  pg.textAlign(CENTER, CENTER);
  pg.translate(width/2, height/2);

  PImage buffer = in.get();

  for (int x = 0; x < tilesX; x++) {
    for (int y = 0; y < tilesY; y++) {

      int px = int(x * tileW);
      int py = int(y * tileH);
      color c = buffer.get(px, py);

      char ch = chars.charAt(int(map(brightness(c), 0, 255, 0, chars.length()-1)));

      float posX = map(x, 0, tilesX, -spread, spread);
      float posY = map(y, 0, tilesY, -spread, spread);

      pg.push();
      pg.translate(posX, posY);
      pg.text(ch, 0, 0);
      pg.pop();
    }
  }

  pg.endDraw();

  image(pg, 0, 0);
}
