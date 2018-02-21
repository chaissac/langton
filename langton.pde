int x, y, d, i = 0;
final int STEP = 1000; 
boolean c, p;
void setup() {
  size(600, 600);
  x=width/2;
  y=height/2;
  textSize(16);
  textAlign(CENTER);
  background(255);
  loadPixels();
}
void mouseReleased() {
  p=!p;
}
void draw() {
  if (!p) {
    for (int j=0; j<STEP; j++) {
      c=(pixels[x+y*width]==color(0));
      d=(d+(c?-1:1)+4)%4;
      pixels[x+y*width]=color(c?255:0);
      x=((x-(d-1)%2)+width)%width;
      y=((y+(2-d)%2)+height)%height;
    }
    updatePixels();
    set(x, y, #FF0000);
    fill(#FFFFFF,220);
    rect(10,10,130,30);
    fill(#D06000);
    text(""+(i+=STEP), 75, 30);
  }
}