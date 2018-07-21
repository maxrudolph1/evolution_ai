
Population pop;
Goal goal;
void setup() {
  size(400, 400);

  pop = new Population(200);
  goal = new Goal(height/2, width/2);
  goal.show();
}

void draw() {
  background(255);
  goal.show();

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
