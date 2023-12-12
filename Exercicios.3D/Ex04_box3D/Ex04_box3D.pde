void setup() {
  size(600, 600, P3D);
}

void draw() {
  background(0);
  noFill();
  lights();

  translate(width/2, height/2, 0);
  rotateX(radians(mouseY));
  rotateY(radians(mouseX));

  for (int i = 0; i < 6; i++) {
    pushMatrix();
    if (i < 4) {
      rotateY(HALF_PI * i);
    } else {
      rotateX(HALF_PI * (i % 2 == 0 ? 1 : -1));
    }
    translate(0, 0, 250);

    stroke(255, 204 - i * 30, 0); // Cores análogas
    box(300, 300, 10);
    popMatrix();
  }
}
