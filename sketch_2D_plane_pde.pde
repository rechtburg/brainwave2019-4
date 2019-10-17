void setup() {
  size(600, 800, P3D);
  frameRate(20);
}
void draw() {
  background(100, 100, 100);
  float center = mouseX;
  float p_height = height/2;
  float p_width = p_height;
  float b_width = p_width*0.06;
  float y = height-0.5*p_height;
  
  stroke(0, 0, 255);
  //back
  fill(255);
  beginShape();
    vertex(center-b_width, height-0.15*p_height);
    vertex(center-2.5*b_width, height-0.125*p_height);
    vertex(center-3*b_width, height-0.075*p_height);
    vertex(center-0.7*b_width, height-0.075*p_height);
  endShape();
  
  beginShape();
    vertex(center+b_width, height-0.15*p_height);
    vertex(center+2.5*b_width, height-0.125*p_height);
    vertex(center+3*b_width, height-0.075*p_height);
    vertex(center+0.7*b_width, height-0.075*p_height);
  endShape();
  
  bezier(center-b_width, height-0.125*p_height, center, height, center, height,center+b_width, height-0.125*p_height);
  
  //body
  beginShape();
    vertex(center+b_width, height-0.125*p_height);
    vertex(center+b_width, height-0.9*p_height);
    vertex(center-b_width, height-0.9*p_height);
    vertex(center-b_width, height-0.125*p_height);
  endShape();
  
  //wings
  beginShape();
    vertex(center+b_width, y);
    vertex(center+p_width*0.53, y+0.1*p_height);
    vertex(center+p_width*0.50, y);
    vertex(center+b_width, y-0.2*p_height);
  endShape();
  
  beginShape();
    vertex(center-b_width, y);
    vertex(center-p_width*0.53, y+0.1*p_height);
    vertex(center-p_width*0.50, y);
    vertex(center-b_width, y-0.2*p_height);
  endShape();
  
  //front
  bezier(center+b_width, height-p_height*0.9, center+b_width*0.8, height-p_height*1.05, center-b_width*0.8, height-p_height*1.05,center-b_width, height-p_height*0.9);
  
}