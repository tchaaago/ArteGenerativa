PFont font;

void setup() {
  size(800, 600);
  // Definindo fundo preto
  background(0);
  
  // Criando fonte Arial
  font = createFont("Arial", 48);
  textAlign(CENTER, CENTER);
}

void draw() {
  // Redefinindo fundo preto a cada quadro
  background(0);

  // Calculando a escala baseada na posição do mouse
  float scaleX = map(mouseX, 0, width, 1, 3);  // Varia entre 1 e 3
  float scaleY = map(mouseY, 0, height, 1, 3); // Varia entre 1 e 3

  pushMatrix();
  translate(width / 2, height / 2); // Centraliza
  scale(scaleX, scaleY);            // Escala conforme a posição do mouse
  textFont(font);
  // Definindo a cor da tipografia para branco
  fill(255);
  text("Hype", 0, 0);
  popMatrix();
}
