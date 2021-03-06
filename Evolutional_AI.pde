
Population pop;
Goal goal;
void setup() {
  size(400, 400);

  pop = new Population(400);
  goal = new Goal(200, 10);
  goal.show();
}

void draw() {
  background(255);
  goal.show();
  rect(width/2-50,height/2,100,50);
  fill(255);

  if (pop.allDotsDead()) {
    
    pop.calcFit();
    pop.natSelec();
    pop.mutate();
    System.out.println(pop.gen);
    

  } else {
    pop.update();
    pop.show();
  }
}
