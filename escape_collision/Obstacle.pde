abstract class Obstacle {
  float width;
  float height;

  abstract int calc_score();
  abstract void display();
}
