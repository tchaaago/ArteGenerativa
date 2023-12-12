PFont font;
String inputWord = "";
int selectedLetterIndex = -1; 
float[] scaleX, scaleY;

void setup() {
  size(800, 600);
  background(0);
  
  font = createFont("Amador", 48, true);
  textAlign(LEFT, CENTER);
  scaleX = new float[100]; // espaço para 100 caracteres
  scaleY = new float[100];
  for (int i = 0; i < 100; i++) {
    scaleX[i] = 1;
    scaleY[i] = 1;
  }
}

void draw() {
  background(0);
  fill(255);
  textFont(font);
  
  float totalWidth = 0;
  for (int i = 0; i < inputWord.length(); i++) {
    totalWidth += textWidth(inputWord.charAt(i)) * scaleX[i];
  }

  float currentX = (width - totalWidth) / 2;
  for (int i = 0; i < inputWord.length(); i++) {
    char c = inputWord.charAt(i);
    float charWidth = textWidth(c) * scaleX[i];
    
    if (i == selectedLetterIndex) {
      float localScaleX = map(mouseX, 0, width, 1, 3);
      float localScaleY = map(mouseY, 0, height, 1, 3);
      scaleX[i] = localScaleX;
      scaleY[i] = localScaleY;
    }
    
    pushMatrix();
    translate(currentX + charWidth/2, height/2);
    scale(scaleX[i], scaleY[i]);
    text(c, -charWidth/2 / scaleX[i], 0);
    popMatrix();

    currentX += charWidth;
  }
}

void keyPressed() {
  if (keyCode == BACKSPACE) {
    if (inputWord.length() > 0) {
      inputWord = inputWord.substring(0, inputWord.length() - 1);
    }
  } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
    inputWord += key;
  }
}

void mousePressed() {
  if (selectedLetterIndex != -1) {
    // Se uma letra estiver selecionada, desselecionamos ela ao clicar em qualquer lugar
    selectedLetterIndex = -1;
    return;
  }
  
  float totalWidth = 0;
  for (int i = 0; i < inputWord.length(); i++) {
    totalWidth += textWidth(inputWord.charAt(i)) * scaleX[i];
  }
  float currentX = (width - totalWidth) / 2;
  for (int i = 0; i < inputWord.length(); i++) {
    char c = inputWord.charAt(i);
    float charWidth = textWidth(c) * scaleX[i];
    if (mouseX > currentX && mouseX < currentX + charWidth && 
        mouseY > height/2 - 24*scaleY[i] && mouseY < height/2 + 24*scaleY[i]) {
      selectedLetterIndex = i;
      return;
    }
    currentX += charWidth;
  }
}
