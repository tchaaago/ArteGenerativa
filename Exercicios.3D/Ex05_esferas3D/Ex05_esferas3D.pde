void setup() {
  size(600, 600, P3D);
}

void draw() {
  background(255);
  lights();

  translate(width/2, height/2);

  // Cria várias esferas orbitando
  for (int i = 0; i < 8; i++) {
    pushMatrix(); // Salva a transformação atual
    rotateY(frameCount * 0.01);
    translate(150, 0, 0); // Posiciona a esfera em órbita
    sphere(20); // Desenha a esfera
    popMatrix(); // Restaura a transformação
    rotateZ(TWO_PI / 8); // Divide a órbita igualmente
  }
}
