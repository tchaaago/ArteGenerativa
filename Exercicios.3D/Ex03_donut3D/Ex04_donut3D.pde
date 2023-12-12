int totalPoints = 200;
float[] angleX = new float[totalPoints];
float[] angleY = new float[totalPoints];
float radius1 = 100;
float radius2 = 40;
float pointSize = 4.0;

void setup() {
  size(600, 600, P3D);
  strokeWeight(pointSize);
  
  for (int i = 0; i < totalPoints; i++) {
    angleX[i] = random(TWO_PI);
    angleY[i] = random(TWO_PI);
  }
}

void draw() {
  background(255);
  translate(width / 2, height / 2);
  
  float mx = map(mouseX, 0, width, 0, PI);
  float my = map(mouseY, 0, height, 0, PI);

  rotateX(-my);
  rotateY(mx);

  for (int i = 0; i < totalPoints; i++) {
    float x = (radius1 + radius2 * cos(angleY[i])) * cos(angleX[i]);
    float y = (radius1 + radius2 * cos(angleY[i])) * sin(angleX[i]);
    float z = radius2 * sin(angleY[i]);
    
    point(x, y, z);
    
    angleX[i] += 0.03;
    angleY[i] += 0.02;
  }
}
