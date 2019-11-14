import java.util.*;
Random rand = new Random();

Airplane airplane;
BackGround backGround;
Bird bird;
Cloud cloud;
ScoreBoard scoreBoard;
ObstaclePoint obstaclePoint;
PVector nOffset1, nOffset2;
PImage img;

void setup() {
  size(1200, 800);
  frameRate(20);
  
  img = loadImage("images/bird-image.png");

  airplane = new Airplane(height);
  backGround = new BackGround();
  bird = new Bird(img, 220, 127);

  nOffset1 = new PVector(random(10000), random(10000));
  nOffset2 = new PVector(random(10000), random(10000));
  cloud = new Cloud(nOffset1, nOffset2);
  scoreBoard = new ScoreBoard();
  obstaclePoint = new ObstaclePoint();
}

// Center of window size;
float center = 600;

// For bird as obstacle
// Center Position
float cx = rand.nextInt(800)+200;
float cy = 0;
// Size
int r = 60;
// Velocity
int velocity = 13;
int escaped_obstacle = 0;

// For cloud
float clx = rand.nextInt(800)+200;
float cly = 0;
float cl_velocity = 5;

// For ObstaclePoint
int obstacle_score = 0;
int text_size;
int text_pos_x = 100;
int text_pos_y = 250;

int time = 0;
int startTime = 0;
int current_game_score = 0;
int highscore = 0;
int total_obstacle = 0;
int cnt = 1;

void draw() {
  if(cnt <= 3){ 
    backGround.display();
    center = mouseX;

    cloud.display();

    // Draw airplane
    airplane.center = mouseX;
    airplane.display();

    if(dist(cx, cy, center, 4*height/5) < 0.9*(r/2+height/5)){
      if(r/12 <= abs(-cx-cy+0.6*height+center)/sqrt(2) &&
          r/12 <= abs(cx-cy+0.6*height-center)/sqrt(2) &&
          r/12 <= abs(cx-cy+height-center)/sqrt(2) &&
          r/12 <= abs(-cx-cy+height-center)/sqrt(2)){
      }else{
        noLoop();
      }
    }

    bird.display(cx, cy, r);
    cy += velocity;
    if(cy - r >= height){
      cx = rand.nextInt(200)+center-100;
      cy = 0;
      obstacle_score = bird.calc_score(velocity, r);
      current_game_score += obstacle_score;
      velocity += rand.nextInt(10);
      escaped_obstacle += 1;
      r = rand.nextInt(100) + 60;
      text_size = obstaclePoint.calc_text_size(obstacle_score, 130);
      text_pos_x = rand.nextInt(500) + 140;
      text_pos_y = rand.nextInt(300) + 50;
    }

    if(obstacle_score != 0) {
      obstaclePoint.display(text_pos_x, text_pos_y, obstacle_score, text_size);
    }

    time = millis() - startTime;
    scoreBoard.display(cnt, escaped_obstacle, current_game_score, time, highscore);
  } else {
    backGround.display();
    fill(255);
    text("YOUR SCORE: " + highscore, width/3, height/2);
    text("TOTAL OBSTACLE: " + total_obstacle, width/3, height/2+30);
  }
}

void mouseClicked(){
  cx = rand.nextInt(width-400)+200;
  cy = 0;
  r = width/20;
  startTime = millis();
  highscore = max(time/10 + current_game_score, highscore);
  total_obstacle += escaped_obstacle;
  escaped_obstacle = 0;
  cnt++;
  loop();
}
