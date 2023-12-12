float angleY = 0;

void setup() {
  size(600, 600, P3D);
}

void draw() {
  background(255);
  lights();

  // Mapeia a posição do mouse para o ângulo de rotação
  angleY = map(mouseX, 0, width, -PI, PI);

  // Desenha a "moeda" emoji
  pushMatrix();
  translate(width / 2, height / 2);
  rotateY(angleY);

  // Desenha a face feliz no "lado da frente" da moeda
  drawFace(true); // Face feliz

  // Desenha a face triste no "lado de trás" da moeda
  rotateY(PI); // Gira 180 graus para desenhar no outro lado
  drawFace(false); // Face triste

  popMatrix();
}

void drawFace(boolean isHappy) {
  // Cor amarela para a moeda
  fill(255, 215, 0); // Cor aproximada do ouro (moeda)

  // Desenha o rosto (a "moeda" em si)
  ellipse(0, 0, 300, 300);

  // Desenha os olhos
  fill(0); // Preto para os olhos
  ellipse(-70, -80, 40, 40);
  ellipse(70, -80, 40, 40);

  // Desenha a boca
  fill(0); // Preto para a boca
  if (isHappy) {
    // Boca feliz
    arc(0, 30, 100, 50, 0, PI);
  } else {
    // Boca triste
    arc(0, 30, 100, 50, PI, TWO_PI);
  }
}

// NAO DEU CERTO AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
