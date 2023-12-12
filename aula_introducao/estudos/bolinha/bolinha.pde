color cor;
int alt;

void setup(){
    background(255,0,0); //RGBA
size(1080, 1080); // altura, largura
 cor = color(255,255,0);
 alt = 0;
}

void draw() {
  fill(cor,20);
  noStroke();
  ellipse(mouseX, mouseY, 200, 200);
}

void mousePressed(){
 cor = color(random(0,255),random(0,255),random(0,255));
 bola();
}

void bola(){
  noStroke();
  
  for (int i = 0; i < 10; i=i+1){
    ellipse(width, alt, 100, 100);
  }
    if (alt < height){
    alt = alt + 1;
    }
}
