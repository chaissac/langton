final int STEP = 1000; 
int x, y, d, i;
boolean c;

int[] entiers = new int[20];

void setup() {
  size(600, 400);
  x=width/2;
  y=height/2;
  textSize(32);
  textAlign(CENTER);
  background(255);
  stroke(#FF4040);
  loadPixels();
  for (int i=0; i<entiers.length; i++) {
    entiers[i]=1;
  }
}
void draw() {
  if (keyPressed) exit();
  if (mousePressed) {
    for (int j=0; j<STEP; j++) {
      c=(pixels[x+y*width]==color(0));
      d=(d+(c?3:1))%4;
      pixels[x+y*width]=color(c?255:0); 
      x=((x-(d-1)%2)+width)%width;
      y=((y+(2-d)%2)+height)%height;
    }
    updatePixels();
    fill(#FFFFFF, 210);
    rect(width/2-150, 5, 300, 40);
    fill(#FF4040);
    text(String.format("%,d", i+=STEP), width/2, 35);
  } else {
    line(x, 0, x, height);
    line(0, y, width, y);
  }
}