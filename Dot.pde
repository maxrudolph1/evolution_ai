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
  
  void update(Obstacle[] obs) {
     if (!dead && !reachedGoal) {
       move();
       if (pos.x > width || pos.x < 2 || pos.y > height || pos.y < 2 )
       dead = true;
       
       for (int k = 0; k < obs.length; k++) {
       if(pos.x > obs[k].pos.x && pos.x < (obs[k].wide+obs[k].pos.x)  &&
        pos.y < (obs[k].pos.y + obs[k].tall) && 
        pos.y > obs[k].pos.y) 
       
         dead = true; 
 
         
       } 
       if(dist(pos.x, pos.y, goal.x, goal.y) < 6) {
         
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
    fitness = 1.0/(brain.step * brain.step) + 1.0/16.0; 
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
