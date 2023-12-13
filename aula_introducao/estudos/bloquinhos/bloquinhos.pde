PImage img;
int blockSize = 12; // Tamanho base do bloco
int minSize = 1;    // Tamanho mínimo do quadrado
int maxSize = 8;   // Tamanho máximo do quadrado

void setup() {
  size(565, 705); // Definindo o tamanho do canva de acordo com a imagem
  background(255);

  img = loadImage("Esse.jpg"); //muda imagem aqui
}

void draw() {
  background(0);

for (int y = 0; y < img.height; y += blockSize) {
for (int x = 0; x < img.width; x += blockSize) {
color c = img.get(x, y); // Para definir a cor do pixel

  float bright = brightness(c); // Equivale a quatidade de luminância
  float rectSize = map(bright, 0, 255, minSize, maxSize); // Mapa de brilho dos bloquinhos

  rectSize += random(-2, 5); // Variaa +/- 5 pixels, podendo ajustar conforme ficar melhor para o resultado da imagem

  fill(c);  // Define a cor de preenchimento para a cor do pixel
  noStroke(); // Tirar o contorno
  rect(x, y, rectSize, rectSize);
}
}
}
