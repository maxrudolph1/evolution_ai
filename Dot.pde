class Dot {
  PVector pos;
  PVector vel;
  PVector acc;
  Brain brain;
  float fitness = 0;
  boolean dead = false;
  float timeToGoal = 1;
  int maxVel = 4;
  
  boolean reachedGoal = false;

  Dot() {
    brain = new Brain(500);

    pos = new PVector(width/2, height);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  void show() {
    fill(0);
    ellipse(pos.x, pos.y, 4, 4);
  }
  
  void update() {
     if (!dead && !reachedGoal) {
       move();
       if (pos.x > width || pos.x < 2 || pos.y > height || pos.y < 2 ||
       (pos.x > width/2-50 && pos.x < (width/2+50) && pos.y > height/2 && pos.y < (height/2+50))) 
       { 
         dead = true; 
 
         
       } else if(dist(pos.x, pos.y, goal.x, goal.y) < 6) {
         
         reachedGoal = true;

         
       } 
     }
  }

  void move() {
    if (brain.directions.length > brain.step) {
    acc = brain.directions[brain.step];
    brain.step++;
    } else {
      dead = true;
     
    }
    vel.add(acc);
    vel.limit(maxVel);
    pos.add(vel);
  }
  
  void calcFit() {
   if( reachedGoal ) {
    fitness = 1.0/(brain.step * brain.step); 
   } else {
     float dist = dist(pos.x , pos.y, goal.x, goal.y);
    fitness = 1.0 / ( dist * dist);
   }
   
   

  }
  
  Dot birth() {
   Dot baby = new Dot();
   baby.brain = brain.clone();
   return baby;
  }
  
  String toString() {
   return pos.toString(); 
  }
}
