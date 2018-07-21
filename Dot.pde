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
    brain = new Brain(200);

    pos = new PVector(width/2, height);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  void show() {
    fill(0);
    ellipse(pos.x, pos.y, 4, 4);
  }
  
  void update() {
     if (!dead) {
       move();
       if (pos.x > width || pos.x < 2 || pos.y > height || pos.y < 2) 
       { 
         dead = true; 
         timeToGoal = brain.step;
         
       } else if(dist(pos.x, pos.y, goal.x, goal.y) < 6) {
         
         reachedGoal = true;
         timeToGoal = brain.step;
         
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
   float dist = (dist(goal.x, goal.y, pos.x, pos.y))/height;
   float shortTime = height/maxVel;
   float time = sqrt((timeToGoal - shortTime)*(timeToGoal - shortTime))/400;
   fitness = 1/((dist *dist));// + 1/(timeToGoal);
   System.out.println(dist + " " + time + "  " + fitness);
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
