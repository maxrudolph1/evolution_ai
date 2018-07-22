
Population pop;
Goal goal;
Obstacle[] obs = new Obstacle[2];

void setup() {
  size(400, 400);

  pop = new Population(400);
  goal = new Goal(200, 10);
  obs[0] = new Obstacle(new PVector(width/2+10,0), height,10);
  obs[1] = new Obstacle(new PVector(width/2 - 20, 0), height, 10);
  
  goal.show();
}

void draw() {
  background(255);
  goal.show();
  for (Obstacle ob : obs) {
  ob.show();
}
  if (pop.allDotsDead()) {
    
    pop.calcFit();
    pop.natSelec();
    pop.mutate();
    System.out.println(pop.gen);
    

  } else {
    pop.update(obs);
    pop.show();
  }
}
