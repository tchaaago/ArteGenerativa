import processing.video.*;

Movie video;

void setup() {
  size(1400, 900);
  video = new Movie(this, "_import_60657130da4d03.96528058.mov");
  video.loop();
  video.resize(width, height);
}

void draw() {
  background(0);
  image(video, 0, 0);
  
  float spcX = map(mouseX, 0, width, 1, 400);
  float spcY = map(mouseY, 0, height, 1, 400);
  
  for (int x = 0; x < width; x += spcX) {
    for (int y = 0; y < height; y += spcY) {
      // Calcula a cor média na região
      color c = calculateAverageColor(x, y, spcX, spcY);
    
      fill(c);
      rect(x, y, spcX, spcY);
    }
  }
}

color calculateAverageColor(int startX, int startY, float w, float h) {
  int count = 0;
  float rSum = 0;
  float gSum = 0;
  float bSum = 0;
  
  for (int x = startX; x < startX + w; x++) {
    for (int y = startY; y < startY + h; y++) {
      color pixelColor = video.get(x, y);
      rSum += red(pixelColor);
      gSum += green(pixelColor);
      bSum += blue(pixelColor);
      count++;
    }
  }
  
  float avgR = rSum / count;
  float avgG = gSum / count;
  float avgB = bSum / count;
  
  return color(avgR, avgG, avgB);
}

void movieEvent(Movie m) {
  m.read();
}
