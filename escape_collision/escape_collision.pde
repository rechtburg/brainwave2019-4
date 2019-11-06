import java.util.*;
Random rand = new Random();

Airplane airplane;
BackGround backGround;
Bird bird;
Cloud cloud;
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
float velocity = 15;

// For cloud
float clx = rand.nextInt(800)+200;
float cly = 0;
float cl_velocity = 5;


int time = 0;
int startTime = 0;
int highscore = 0;
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
      r = rand.nextInt(100) + 100;
    }

    time = millis() - startTime;
    fill(255);
    textSize(25);
    text("Game" + " " + cnt, 50, 50);
    text("Score:" + " "+ time/10, 50,100);
    text("HighScore:" + " " + highscore, 50, 150);
    velocity += 0.005;
  } else {
    backGround.display();
    fill(255);
    text("YOUR SCORE", width/3, height/2);
    text(highscore, width/3, height/2+30);
  }
}

void mouseClicked(){
  cx = rand.nextInt(width-400)+200;
  cy = 0;
  r = width/20;
  startTime = millis();
  highscore = max(time/10, highscore);
  cnt++;
  loop();
}