color cor;
int alt;

void setup(){
  size(680, 300); // tamanho do canvas (largura, altura)
  cor = color(70, 255, 60);
  alt = 0;
}

void draw(){
  background(255, 255, 255); //RGB-A
  fill(cor, 60);
  ellipse(mouseX, mouseY, 70, 70); // a elipse acompanha o trajeto do cursos do mouse(eixo x, eixo y)
  bola();
}

void mousePressed(){
  cor = color(random(0, 255), random(0, 255), random(100, 255)); // altera a cor aleatoriamente com o clique do mouse
}

void bola(){
  noStroke();
  fill(cor);
  
  for (int i = 0; i < 10; i++){
  ellipse(i*20, alt, 10, 10);
  }
  
  
  if(alt < height){
  alt = alt + 1;
  }
}  
