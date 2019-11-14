class ObstaclePoint {  
  int calc_text_size(int score, int standard) {
    return int(18 * score / standard);
  }

  void display(int pos_x, int pos_y, int score, int size) {
    fill(#ee82ee);
    textSize(size);
    text(score, pos_x, pos_y);
  }
}
