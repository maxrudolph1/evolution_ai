class Brain {
  PVector[] directions;
  int step = 0;


  Brain(int size) {

    directions = new PVector[size];
    randomize();
  }

  void randomize() {
    for (int k = 0; k < directions.length; k++) {
      float randomAngle = random(2*PI);
      directions[k] = PVector.fromAngle(randomAngle);
    }
  }

  Brain clone() {
    Brain clone = new Brain(directions.length);

    for (int k = 0; k < directions.length; k++) {
      clone.directions[k] = directions[k].copy();
    }

    return clone;
  }

  void mutate(float fitness) {
    float mutationRate = .01;

    for ( int k = 0; k < directions.length; k++) {
      float rand = random(1);

      if (rand < mutationRate) {
        float randomAngle = random(2*PI);
        directions[k] = PVector.fromAngle(randomAngle);
      }
    }
  }
}
