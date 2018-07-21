class Goal {
 int x;
 int y;
 PVector pos;
 
 Goal(int x, int y) {
  this.x = x;
  this.y = y;
  pos = new PVector(x,y);
 }
 
 void show() {
  fill(255,0,0);
  ellipse(x, y, 10,10);
  
 }
  
}
