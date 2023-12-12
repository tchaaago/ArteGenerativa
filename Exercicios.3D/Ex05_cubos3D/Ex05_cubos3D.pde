float boxSize = 20;
float rez = 0.003;
int amount = 400;
float speed = 0.005;
float factor = 0.008;

void setup() {
  size(600, 600, P3D);
  camera(0, 200, (height/2) / tan(PI/6), 0, 0, 0, 0, 1, 0);
}

void draw() {
  background(220);
  ambientLight(100.0, 100.0, 100.0); // Corrigido para valores de ponto flutuante, pois houve erro na chamada da funçao por ter fornecido valores inteiros :P (ponto flutuante é em valor decimal)
  directionalLight(255, 0, 0, 0.25, 0.25, 0);
  pointLight(0, 0, 255, -width/2 +100, -height/2 + 100, 250);
  
  for (float x = -width; x <= width; x += boxSize) {
    for (float y = -height; y <= height; y += boxSize) {
      pushMatrix();
      translate(x, y, 0);
      float depth = constrain(noise(x * factor + frameCount * speed, y * factor + frameCount * speed) * amount, 0, 1000);
      box(boxSize, boxSize, depth);
      popMatrix();
    }
  }
}
