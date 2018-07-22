class Obstacle {
 int tall;
 int wide;
 PVector pos;
 
 Obstacle(PVector pos, int tall, int wide) {
   this.pos = pos;
   this.tall = tall;
   this.wide = wide;
 }
 
 void show() {

  fill(24,100, 255);
  rect(pos.x, pos.y, wide, tall);
 }
  
}
