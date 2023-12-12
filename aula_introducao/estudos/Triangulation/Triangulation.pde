PImage img;
ArrayList<PVector> points = new ArrayList<PVector>();

void setup() {
  size(1800, 1600);
  img = loadImage("mis.jpeg");
  background(255);
  
  detectPoints();
  drawPointsAndLines();
}

void detectPoints() {
  img.loadPixels();
  for (int y = 1; y < img.height - 1; y++) {
    for (int x = 1; x < img.width - 1; x++) {
      int loc = x + y * img.width;
      color c = img.pixels[loc];
      float avgR = (red(img.pixels[loc-1]) + red(img.pixels[loc+1]) + red(img.pixels[loc-img.width]) + red(img.pixels[loc+img.width])) / 4.0;
      float avgG = (green(img.pixels[loc-1]) + green(img.pixels[loc+1]) + green(img.pixels[loc-img.width]) + green(img.pixels[loc+img.width])) / 4.0;
      float avgB = (blue(img.pixels[loc-1]) + blue(img.pixels[loc+1]) + blue(img.pixels[loc-img.width]) + blue(img.pixels[loc+img.width])) / 4.0;
      if (dist(red(c), green(c), blue(c), avgR, avgG, avgB) > 20) { 
        points.add(new PVector(x, y));
      }
    }
  }
}

void drawPointsAndLines() {
  for (PVector p : points) {
    fill(0);
    noStroke();
    ellipse(p.x, p.y, 2, 2);
    for (PVector q : points) {
      float d = dist(p.x, p.y, q.x, q.y);
      if (d < 20 && d > 5) {
        stroke(0, 20);
        line(p.x, p.y, q.x, q.y);
      }
    }
  }
}
