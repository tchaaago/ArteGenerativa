PImage img;
int blockSize = 5; // Tamanho base do bloco
int minSize = 3;    // Tamanho mínimo do quadrado
int maxSize = 8;   // Tamanho máximo do quadrado

void setup() {
  size(600, 600); // Definindo o tamanho da janela de acordo com a imagem
  background(255);

  // Carregue sua imagem aqui
  img = loadImage("Lucas Hype.png");
}

void draw() {
  background(0);

for (int y = 0; y < img.height; y += blockSize) {
for (int x = 0; x < img.width; x += blockSize) {
color c = img.get(x, y); // Obtém a cor do pixel

  float bright = brightness(c); // Obtém o valor de luminância
  float rectSize = map(bright, 0, 255, minSize, maxSize); // Mapeia a luminosidade para um tamanho de quadrado

  rectSize += random(-80, 110); // Variação de +/- 5 pixels. Ajuste conforme necessário.

  fill(c);  // Define a cor de preenchimento para a cor do pixel
  noStroke(); // Remove o contorno
  rect(x, y, rectSize, rectSize);
}

}
}
