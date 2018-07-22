class Population {
  int size;
  float fitnessSum;
  int gen = 1;
  Dot[] dots;

  Population(int size) {
    this.size = size;
    dots = new Dot[size];
    for (int k = 0; k < size; k++) {
      dots[k] = new Dot();
    }
  }

  void show() {
    for (Dot dot : dots) {
      dot.show();
    }
  }


  void update(Obstacle[] obs) {
    for (Dot dot : dots) {
      dot.update(obs);
    }
  }
  void calcFit() {
    for (Dot dot : dots) {
      dot.calcFit();
    }
  } 

  boolean allDotsDead() {
    for (Dot dot : dots) {
      if (!dot.dead && !dot.reachedGoal) {
        return false;
      }
    }

    return true;
  }

  void natSelec() {
    
    Dot[] dots2 = new Dot[size];
    sumFit();
    
    
    for ( int k = 0; k < size; k++) {
      Dot parent = selectParent();

      dots2[k] = parent.birth();
    }
    dots = dots2.clone();
    gen++;
    
  }

  void sumFit() {
    fitnessSum = 0;
    for (Dot dot : dots) {
      fitnessSum += dot.fitness;
    }
  }


  Dot[] clone() {
    Dot[] temp = new Dot[size];
    for (int k = 0; k < size; k++) {
      temp[k] = dots[k];
    }
    return temp;
  }



  Dot selectParent() {
    sumFit();
    float rand = random(fitnessSum);
    float sum = 0;

    for (int k = 0; k < size; k++) {
      sum += dots[k].fitness;

      
      if (sum > rand) {
        return dots[k];
      }
      
    }
    return null;
  }


  void mutate() {
    for (int k = 0; k < size; k++) {
      dots[k].brain.mutate(dots[k].fitness);
    }
  }
}
