PImage img;

void setup(){
  size(1400,900);
  
  img = loadImage("poco_draga_corona_6_1_-12664062.jpg");
  img.resize(width,height);
  
}

void draw(){
  background(0);
  
  float spcX = map(mouseX,0,width,1,400);
  float spcY = map(mouseY,0,height,1,400);
  
  for(int x = 0; x < width; x += spcX) {
    for(int y = 0; y < height; y += spcY) {
      color c = img.get(x,y);
    
      fill(c);
      noStroke();
      rect(x,y,spcX,spcY);
      
  
    }
  }
} 
