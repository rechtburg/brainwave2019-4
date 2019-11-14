class ScoreBoard {
  int top = 50;
  int left = 50;
  int line_height = 50;
  int fill_color = 255;
  int text_size = 25;

  void display(int cnt, int escaped_obstacle, int current_game_score, int time, int highscore) {
    fill(fill_color);
    textSize(text_size);
    text("Game" + " " + cnt, left, top);
    text("Obstacle: " + escaped_obstacle, left, top + line_height);
    text("Score: " + (time/10 + current_game_score), left, top + 2 * line_height);
    text("HighScore: " + highscore, left, top + 3 * line_height);
  }
}
