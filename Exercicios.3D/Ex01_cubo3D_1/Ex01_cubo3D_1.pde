void setup() {
  size(500, 500, P3D); // Define o tamanho do canvas e usa o renderizador 3D (P3D)
}

void draw() {
  background(255); //  Escolhe a cor de backgorund (branco)
  lights(); // Adiciona iluminação básica para ajudar na tridimensionalidade

  // A partir daqui é definido os controles de câmera e rotação
  translate(width/2, height/2); // Centraliza o cubo
  rotateX(frameCount * 0.01); // Rotação em X com base no tempo
  rotateY(frameCount * 0.01); // Rotação em Y com base no tempo

  // Desenho do cubo
  box(150); // Desenha um cubo de acordo com o valor (x)
}
