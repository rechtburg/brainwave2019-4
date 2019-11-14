import java.util.*;
Random rand = new Random();

Airplane airplane;
BackGround backGround;
Bird bird;
Cloud cloud;
ScoreBoard scoreBoard;

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
float velocity = 13;
int escaped_obstacle = 0;

// For cloud
float clx = rand.nextInt(800)+200;
float cly = 0;
float cl_velocity = 5;


int time = 0;
int startTime = 0;
int current_game_score = 0;
int highscore = 0;
int total_obstacle = 0;
int cnt = 1;
int next = 0;
int v_cnt = 0;


void draw() {
  if(cnt <= 3){
    
    backGround.display();
    center = mouseX;

    cloud.display();

    // Draw airplane
    airplane.center = mouseX;
    airplane.display();
    if(v_cnt == 0)
      next = rand.nextInt(20)-10;
    if((airplane.vy >= 0 && next > 0)||(airplane.vy <= -100 && next < 0)){
    } else {
      airplane.vy += next;
    }
    v_cnt++;
    if(v_cnt == 5)
      v_cnt = 0;

   
    if(((cx+r >= airplane.center-airplane.b_width && cx+r <= airplane.center+airplane.b_width) ||
        (cx >= airplane.center-airplane.b_width && cx <= airplane.center+airplane.b_width)    ||
        cx <= airplane.center-airplane.b_width && airplane.center+airplane.b_width <= cx+r) &&
        ((cy+r/2 <= height+airplane.vy && cy+r/2 >= height - airplane.p_height+airplane.vy) ||
        (cy <= height+airplane.vy && cy >= height - airplane.p_height+airplane.vy))
        ){
        noLoop();
    }
    if(((cx+r >= airplane.center-airplane.p_width*0.425 && cx+r <= airplane.center+airplane.p_width*0.425) ||
        (cx >= airplane.center-airplane.p_width*0.425 && cx <= airplane.center+airplane.p_width*0.425) 
        ) &&
        ((cy+r/2 <=  airplane.y+airplane.vy && cy+r/2 >= airplane.y-airplane.p_width*0.2*(float)Math.tan(airplane.arg)+airplane.vy) ||
        (cy <= airplane.y+airplane.vy && cy >= airplane.y-airplane.p_width*0.2*(float)Math.tan(airplane.arg)+airplane.vy))
        ){
        noLoop();
    }
    
    bird.display(cx, cy, r);
    cy += velocity;
    if(cy - r >= height){
      cx = rand.nextInt(200)+center-100;
      cy = 0;
      current_game_score += velocity * 10;
      velocity += rand.nextInt(10);
      escaped_obstacle += 1;
      r = rand.nextInt(100) + 100;
    }


    time = millis() - startTime;
    scoreBoard.display(cnt, escaped_obstacle, current_game_score, time, highscore);
    velocity += 0.005;
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
