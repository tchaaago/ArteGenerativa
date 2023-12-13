PImage img;
int blockSize = 5; // Tamanho base do bloco
int minSize = 3;    // Tamanho mínimo do quadrado
int maxSize = 8;   // Tamanho máximo do quadrado

void setup() {
  size(600, 600); // Tamanho do canva onde aparece a imagem
  background(255);

  img = loadImage("Lucas Hype.png");
}

void draw() {
  background(0);

for (int y = 0; y < img.height; y += blockSize) {
for (int x = 0; x < img.width; x += blockSize) {
color c = img.get(x, y); // Define a cor do pixel

  float bright = brightness(c); // Brilho da imagem
  float rectSize = map(bright, 0, 255, minSize, maxSize); // Mapa de brilho do bloquinho

  rectSize += random(-80, 110); // Varia de +/- 5 pixels. Pode alterar para melhorar o resultado da imagem.

  fill(c);  // Define a cor de preenchimento para a cor do pixel
  noStroke(); // Remove o contorno
  rect(x, y, rectSize, rectSize);
}

}
}
