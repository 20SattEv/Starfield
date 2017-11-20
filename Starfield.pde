Dot[] dots;
int globalSize=10;
public void setup() {
  size(700, 700);
  dots = new Dot[300];
  for (int i = 0; i < dots.length; i++) {
    dots[i] = new NormalDot();
  }
  dots[0] = new OddDot();
  dots[1] = new ThiccDot();
}
void draw() {
  background(0);
  for (int i = 0; i < dots.length; i++) {
    dots[i].show();
    dots[i].move();
  }
}

interface Dot
{ 
  public void show();
  public void move();
}

class NormalDot implements Dot {
  color rgb= color((int)(Math.random()*100), 255, (int)(Math.random()*100), (int)(Math.random()*100));
  double x;
  double y;
  int size;
  double xspeed;
  double yspeed;
  double angle;
  NormalDot() {
    x=width/2;
    y=height/2;
    size = globalSize;
    angle = (Math.random()*2)*Math.PI;
    xspeed = 0;
    yspeed = 0;
  }
  public void show() {
    stroke(200);
    fill(rgb);
    if (x<width || x>0 || y <height || y>0) {
      ellipse((int)x, (int)y, size, size);
    }
  }
  public void move() {
    y+= Math.cos((float)angle) + (float)yspeed;
    x+= Math.sin((float)angle) + (float)xspeed;
    if (x>width) {
      x=width;
      xspeed=(Math.random()*5)-2;
    }
    if (x<0) {
      x=0;
      xspeed=(Math.random()*5)-2;
    }
    if (y>height) {
      y=height;
      yspeed=(Math.random()*5)-2;
    }
    if (y<0) {
      y=0;
      yspeed=(Math.random()*5)-2;
    }
  }
}

class OddDot implements Dot
{
  double x;
  double y;
  int size;
  double xspeed;
  double yspeed;
  double angle;
  color rgb;
  OddDot() {
    x=width/2;
    y=height/2;
    size = globalSize*3;
    angle = (Math.random()/2)*Math.PI;
    xspeed = 10;
    yspeed = 10;
    rgb= color(255,(int)(Math.random()*100) ,(int)(Math.random()*100), (int)(Math.random()*200));
  }
  public void show() {
    fill(rgb);
    rect((float)y, (float)x, size, size);
  }
  public void move() {
    y+= Math.cos((float)angle) + (float)yspeed;
    x+= Math.sin((float)angle) + (float)xspeed;
    if (x>width) {
      x=0;
      xspeed=((Math.random()*5)-2)*5;
    }
    if (x<0) {
      x=width;
      xspeed=((Math.random()*5)-2)*5;
    }
    if (y>height) {
      y=0;
      yspeed=(Math.random()*5)-2;
    }
    if (y<0) {
      y=height;
      yspeed=(Math.random()*5)-2;
    }
  }
}
class ThiccDot  extends NormalDot//uses inheritance

{
  ThiccDot() {
    size = globalSize*5;
    angle = (Math.random()*.5)*Math.PI;
    xspeed = 0;
    yspeed = 0;
  }
}
