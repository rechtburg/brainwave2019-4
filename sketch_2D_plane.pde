void setup() {
  size(600, 800);
  frameRate(20);
}
void draw() {
  background(255);
  
  float center = mouseX;
  float p_height = height/2;
  float p_width = p_height;
  float b_width = p_width*0.06;
  float y = height-0.5*p_height;
  
  //back
  //line(center-b_width, height-0.125*p_height , center, height); 
  //line(center+b_width, height-0.125*p_height , center, height); 
  line(center-2.5*b_width, height-0.125*p_height, center-b_width, height-0.15*p_height);
  line(center+2.5*b_width, height-0.125*p_height, center+b_width, height-0.15*p_height);
  
  line(center+3*b_width, height-0.075*p_height, center+0.7*b_width, height-0.075*p_height);
  line(center-3*b_width, height-0.075*p_height, center-0.7*b_width, height-0.075*p_height);
  
  line(center-2.5*b_width, height-0.125*p_height,  center-3*b_width, height-0.075*p_height);
  line(center+2.5*b_width, height-0.125*p_height,  center+3*b_width, height-0.075*p_height);
 
  //line(center+2*b_width, height-0.1*p_height , center, height);
  bezier(center-b_width, height-0.125*p_height, center, height, center, height,center+b_width, height-0.125*p_height);
  
  //body
  line(center+b_width, height-0.125*p_height, center+b_width, height-0.9*p_height); 
  line(center-b_width, height-0.125*p_height, center-b_width, height-0.9*p_height);
  
  //wings
  line(center+b_width, y, center+p_width*0.53, y+0.1*p_height);
  line(center-b_width, y, center-p_width*0.53, y+0.1*p_height);
  line(center+b_width, y-0.2*p_height, center+p_width*0.50, y);
  line(center-b_width, y-0.2*p_height, center-p_width*0.50, y);
  line(center+p_width*0.53, y+0.1*p_height, center+p_width*0.50, y);
  line(center-p_width*0.53, y+0.1*p_height, center-p_width*0.50, y);
  
  //front
  bezier(center+b_width, height-p_height*0.9, center+b_width*0.8, height-p_height*1.05, center-b_width*0.8, height-p_height*1.05,center-b_width, height-p_height*0.9);
  
}
