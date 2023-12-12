ArrayList<Particle> particles;
int numParticles = 1000;

class Particle {
  PVector position;
  int particleColor; // Renomeando para evitar qualquer conflito com a função color

  Particle(PVector position, int particleColor) {
    this.position = position;
    this.particleColor = particleColor; // Atribui o valor à variável particleColor
  }

  void move() {
    this.position.add(PVector.random3D()); // Move a partícula em uma direção aleatória
    // Mantém a partícula dentro da janela
    this.position.x = (this.position.x + width) % width;
    this.position.y = (this.position.y + height) % height;
    this.position.z = (this.position.z + 1000) % 1000 - 500;
  }

  void display() {
    pushMatrix();
    translate(this.position.x - width / 2, this.position.y - height / 2, this.position.z);
    fill(this.particleColor); // Usa a cor da partícula
    noStroke();
    sphere(5);
    popMatrix();
  }
}

void setup() {
  size(600, 600, P3D);
  particles = new ArrayList<Particle>();

  for (int i = 0; i < numParticles; i++) {
    PVector pos = new PVector(random(width), random(height), random(-500, 500));
    int col = color(random(255), random(255), random(255)); // Gera cores RGB de forma aleatória
    particles.add(new Particle(pos, col));
  }
}

void draw() {
  background(0);
  lights();
  translate(width/2, height/2);

  for (Particle p : particles) {
    p.move();
    p.display();
  }
}
