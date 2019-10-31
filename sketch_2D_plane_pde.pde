import netP5.*;
import oscP5.*;

int port = 5001;
float center = 6*width;
OscP5 osc = new OscP5(this, port);

void setup() {
  size(1200, 800);
  frameRate(20); 
}

float v = 0;

void oscEvent(OscMessage msg){
  if(msg.checkAddrPattern("/move")){
      v = msg.get(0).floatValue();
      System.out.println(v);
  }
}

void draw() {
  background(255);
   System.out.println(v);
  center += v;
  fill(0);
  textSize(25);
  text("v:" + " " + v, 100, 100);
  float p_height = height/2.5;
  float p_width = p_height;
  float b_width = p_width*0.065;
  float y = height-0.5*p_height;
  //back
  stroke(0);
  fill(255);
  beginShape();
    vertex(center-b_width, height-0.15*p_height);
    vertex(center-2.5*b_width, height-0.125*p_height);
    vertex(center-3*b_width, height-0.075*p_height);
    vertex(center-0.7*b_width, height-0.075*p_height);
  endShape(CLOSE);
  
  beginShape();
    vertex(center+b_width, height-0.15*p_height);
    vertex(center+2.5*b_width, height-0.125*p_height);
    vertex(center+3*b_width, height-0.075*p_height);
    vertex(center+0.7*b_width, height-0.075*p_height);
  endShape(CLOSE);
  
  stroke(0);
  bezier(center-b_width, height-0.125*p_height, center, height, center, height,center+b_width, height-0.125*p_height);
  
  
  stroke(255);
  //body
  beginShape();
    vertex(center+b_width, height-0.125*p_height);
    vertex(center+b_width, height-0.9*p_height);
    vertex(center-b_width, height-0.9*p_height);
    vertex(center-b_width, height-0.125*p_height);
  endShape(CLOSE);
  
  float arg = (float)Math.atan(0.2*p_height/(0.5*p_width-b_width));
  //wings
  stroke(0);
  strokeWeight(1);
  beginShape();
    vertex(center+b_width, y);
    vertex(center+p_width*0.53, y+0.1*p_height);
    vertex(center+p_width*0.50, y);
    //engine
    vertex(center+p_width*0.4, y-p_width*0.1*(float)Math.tan(arg));
    vertex(center+p_width*0.4, y-p_width*0.1*(float)Math.tan(arg)-0.075*p_height);
    vertex(center+p_width*0.35, y-p_width*0.1*(float)Math.tan(arg)-0.075*p_height);
    vertex(center+p_width*0.35, y-p_width*0.15*(float)Math.tan(arg));
    vertex(center+p_width*0.2, y-p_width*0.3*(float)Math.tan(arg));
    vertex(center+p_width*0.2, y-p_width*0.3*(float)Math.tan(arg)-0.075*p_height);
    vertex(center+p_width*0.15, y-p_width*0.3*(float)Math.tan(arg)-0.075*p_height);
    vertex(center+p_width*0.15, y-p_width*0.35*(float)Math.tan(arg));
    
    vertex(center+b_width, y-0.2*p_height);
  endShape();
  
  beginShape();
    vertex(center-b_width, y);
    vertex(center-p_width*0.53, y+0.1*p_height);
    vertex(center-p_width*0.50, y);
    //engine
    vertex(center-p_width*0.4, y-p_width*0.1*(float)Math.tan(arg));
    vertex(center-p_width*0.4, y-p_width*0.1*(float)Math.tan(arg)-0.075*p_height);
    vertex(center-p_width*0.35, y-p_width*0.1*(float)Math.tan(arg)-0.075*p_height);
    vertex(center-p_width*0.35, y-p_width*0.15*(float)Math.tan(arg));
    vertex(center-p_width*0.2, y-p_width*0.3*(float)Math.tan(arg));
    vertex(center-p_width*0.2, y-p_width*0.3*(float)Math.tan(arg)-0.075*p_height);
    vertex(center-p_width*0.15, y-p_width*0.3*(float)Math.tan(arg)-0.075*p_height);
    vertex(center-p_width*0.15, y-p_width*0.35*(float)Math.tan(arg));
 
    vertex(center-b_width, y-0.2*p_height);
  endShape();
  
  strokeWeight(1.2);
  //front
  bezier(center+b_width, height-p_height*0.9, center+b_width*0.8, height-p_height*1.05, center-b_width*0.8, height-p_height*1.05,center-b_width, height-p_height*0.9);
  strokeWeight(1);
  //window
  for(int i = 0; i <=25; i++){
    stroke(0);
    fill(0);
    beginShape();
      vertex(center+0.7*b_width, height-(0.25+i*0.02)*p_height);
      vertex(center+0.75*b_width, height-(0.25+i*0.02)*p_height);
      vertex(center+0.75*b_width, height-(0.255+i*0.02)*p_height);
      vertex(center+0.7*b_width, height-(0.255+0.02*i)*p_height);
    endShape(CLOSE);
  }
  for(int i = 0; i <=25; i++){
    stroke(0);
    fill(0);
    beginShape();
      vertex(center-0.7*b_width, height-(0.25+i*0.02)*p_height);
      vertex(center-0.75*b_width, height-(0.25+i*0.02)*p_height);
      vertex(center-0.75*b_width, height-(0.255+i*0.02)*p_height);
      vertex(center-0.7*b_width, height-(0.255+0.02*i)*p_height);
    endShape(CLOSE);
  }
  
  fill(0);
//frontwindow
  beginShape();
    vertex(center, height-0.95*p_height);
    vertex(center, height-0.93*p_height);
    vertex(center+b_width, height-0.885*p_height);
    vertex(center+b_width, height-0.89*p_height);
  endShape(CLOSE);
  beginShape();
    vertex(center, height-0.95*p_height);
    vertex(center, height-0.93*p_height);
    vertex(center-b_width, height-0.885*p_height);
    vertex(center-b_width, height-0.89*p_height);
  endShape(CLOSE);
  
  //color
  strokeWeight(2.5);
  stroke(255, 0, 0);
  line(center-p_width*0.4, y-p_width*0.1*(float)Math.tan(arg)-0.075*p_height, center-p_width*0.35, y-p_width*0.1*(float)Math.tan(arg)-0.075*p_height);
  line(center+p_width*0.4, y-p_width*0.1*(float)Math.tan(arg)-0.075*p_height, center+p_width*0.35, y-p_width*0.1*(float)Math.tan(arg)-0.075*p_height);
  line(center-p_width*0.2, y-p_width*0.3*(float)Math.tan(arg)-0.075*p_height, center-p_width*0.15, y-p_width*0.3*(float)Math.tan(arg)-0.075*p_height);
  line(center+p_width*0.2, y-p_width*0.3*(float)Math.tan(arg)-0.075*p_height, center+p_width*0.15, y-p_width*0.3*(float)Math.tan(arg)-0.075*p_height);
  line(center-b_width, y, center-p_width*0.53, y+0.1*p_height);
  line(center+b_width, y, center+p_width*0.53, y+0.1*p_height);
  line(center-3*b_width, height-0.075*p_height, center-0.7*b_width, height-0.075*p_height);
  line(center+3*b_width, height-0.075*p_height, center+0.7*b_width, height-0.075*p_height);
  
  strokeWeight(3.5);
  line(center, height*0.995, center, height-0.225*p_height);

  stroke(0);
  strokeWeight(1.2);
  line(center+b_width, height-0.15*p_height,center+b_width, height-0.9*p_height);
  line(center-b_width, height-0.15*p_height,center-b_width, height-0.9*p_height);
}
