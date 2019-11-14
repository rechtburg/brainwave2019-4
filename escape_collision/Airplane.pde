class Airplane {
  // Instance variables
  float center, size, p_height, p_width, b_width, y, vy = 0, arg;

  Airplane(float size) {
    p_height = size / 2.5;
    p_width = size / 2.5;
    b_width = p_width * 0.065;
    y = height - 0.5 * p_height;
  }

  void display() {
    //draw backside
    stroke(0);
    fill(255);
    beginShape();
      vertex(center-b_width, height-0.15*p_height+vy);
      vertex(center-2.5*b_width, height-0.125*p_height+vy);
      vertex(center-3*b_width, height-0.075*p_height+vy);
      vertex(center-0.7*b_width, height-0.075*p_height+vy);
    endShape(CLOSE);
  
    beginShape();
      vertex(center+b_width, height-0.15*p_height+vy);
      vertex(center+2.5*b_width, height-0.125*p_height+vy);
      vertex(center+3*b_width, height-0.075*p_height+vy);
      vertex(center+0.7*b_width, height-0.075*p_height+vy);
    endShape(CLOSE);
  
    stroke(0);
    bezier(center-b_width, height-0.125*p_height+vy, center, height+vy, center, height+vy ,center+b_width, height-0.125*p_height+vy);

    // draw body
    stroke(255);
    beginShape();
      vertex(center+b_width, height-0.125*p_height+vy);
      vertex(center+b_width, height-0.9*p_height+vy);
      vertex(center-b_width, height-0.9*p_height+vy);
      vertex(center-b_width, height-0.125*p_height+vy);
    endShape(CLOSE);
  
    arg = (float)Math.atan(0.2*p_height/(0.5*p_width-b_width));
    // Wings both sides
    stroke(0);
    strokeWeight(1);
    beginShape();
      vertex(center+b_width, y+vy);
      vertex(center+p_width*0.53, y+0.1*p_height+vy);
      vertex(center+p_width*0.50, y+vy);
      // Engine
      vertex(center+p_width*0.4, y-p_width*0.1*(float)Math.tan(arg)+vy);
      vertex(center+p_width*0.4, y-p_width*0.1*(float)Math.tan(arg)-0.075*p_height+vy);
      vertex(center+p_width*0.35, y-p_width*0.1*(float)Math.tan(arg)-0.075*p_height+vy);
      vertex(center+p_width*0.35, y-p_width*0.15*(float)Math.tan(arg)+vy);
      vertex(center+p_width*0.2, y-p_width*0.3*(float)Math.tan(arg)+vy);
      vertex(center+p_width*0.2, y-p_width*0.3*(float)Math.tan(arg)-0.075*p_height+vy);
      vertex(center+p_width*0.15, y-p_width*0.3*(float)Math.tan(arg)-0.075*p_height+vy);
      vertex(center+p_width*0.15, y-p_width*0.35*(float)Math.tan(arg)+vy);
      vertex(center+b_width, y-0.2*p_height+vy);
    endShape();
  
    beginShape();
      vertex(center-b_width, y+vy);
      vertex(center-p_width*0.53, y+0.1*p_height+vy);
      vertex(center-p_width*0.50, y+vy);
      // Engine
      vertex(center-p_width*0.4, y-p_width*0.1*(float)Math.tan(arg)+vy);
      vertex(center-p_width*0.4, y-p_width*0.1*(float)Math.tan(arg)-0.075*p_height+vy);
      vertex(center-p_width*0.35, y-p_width*0.1*(float)Math.tan(arg)-0.075*p_height+vy);
      vertex(center-p_width*0.35, y-p_width*0.15*(float)Math.tan(arg)+vy);
      vertex(center-p_width*0.2, y-p_width*0.3*(float)Math.tan(arg)+vy);
      vertex(center-p_width*0.2, y-p_width*0.3*(float)Math.tan(arg)-0.075*p_height+vy);
      vertex(center-p_width*0.15, y-p_width*0.3*(float)Math.tan(arg)-0.075*p_height+vy);
      vertex(center-p_width*0.15, y-p_width*0.35*(float)Math.tan(arg)+vy);
      vertex(center-b_width, y-0.2*p_height+vy);
    endShape();
  
    // Frontside
    strokeWeight(1.2);
    bezier(center+b_width, height-p_height*0.9+vy, center+b_width*0.8, height-p_height*1.05+vy, center-b_width*0.8, height-p_height*1.05+vy,center-b_width, height-p_height*0.9+vy);
    strokeWeight(1);

    // Windows
    for(int i = 0; i <=25; i++){
      stroke(0);
      fill(0);
      beginShape();
        vertex(center+0.7*b_width, height-(0.25+i*0.02)*p_height+vy);
        vertex(center+0.75*b_width, height-(0.25+i*0.02)*p_height+vy);
        vertex(center+0.75*b_width, height-(0.255+i*0.02)*p_height+vy);
        vertex(center+0.7*b_width, height-(0.255+0.02*i)*p_height+vy);
      endShape(CLOSE);
    }
    for(int i = 0; i <=25; i++){
      stroke(0);
      fill(0);
      beginShape();
        vertex(center-0.7*b_width, height-(0.25+i*0.02)*p_height+vy);
        vertex(center-0.75*b_width, height-(0.25+i*0.02)*p_height+vy);
        vertex(center-0.75*b_width, height-(0.255+i*0.02)*p_height+vy);
        vertex(center-0.7*b_width, height-(0.255+0.02*i)*p_height+vy);
      endShape(CLOSE);
    }
  
    // Front Window
    fill(0);
    beginShape();
      vertex(center, height-0.95*p_height+vy);
      vertex(center, height-0.93*p_height+vy);
      vertex(center+b_width, height-0.885*p_height+vy);
      vertex(center+b_width, height-0.89*p_height+vy);
    endShape(CLOSE);
    beginShape();
      vertex(center, height-0.95*p_height+vy);
      vertex(center, height-0.93*p_height+vy);
      vertex(center-b_width, height-0.885*p_height+vy);
      vertex(center-b_width, height-0.89*p_height+vy);
    endShape(CLOSE);
  
    // Colorize
    strokeWeight(2.5);
    stroke(255, 0, 0);
    line(center-p_width*0.4, y-p_width*0.1*(float)Math.tan(arg)-0.075*p_height+vy, center-p_width*0.35, y-p_width*0.1*(float)Math.tan(arg)-0.075*p_height+vy);
    line(center+p_width*0.4, y-p_width*0.1*(float)Math.tan(arg)-0.075*p_height+vy, center+p_width*0.35, y-p_width*0.1*(float)Math.tan(arg)-0.075*p_height+vy);
    line(center-p_width*0.2, y-p_width*0.3*(float)Math.tan(arg)-0.075*p_height+vy, center-p_width*0.15, y-p_width*0.3*(float)Math.tan(arg)-0.075*p_height+vy);
    line(center+p_width*0.2, y-p_width*0.3*(float)Math.tan(arg)-0.075*p_height+vy, center+p_width*0.15, y-p_width*0.3*(float)Math.tan(arg)-0.075*p_height+vy);
    line(center-b_width, y+vy, center-p_width*0.53, y+0.1*p_height+vy);
    line(center+b_width, y+vy, center+p_width*0.53, y+0.1*p_height+vy);
    line(center-3*b_width, height-0.075*p_height+vy, center-0.7*b_width, height-0.075*p_height+vy);
    line(center+3*b_width, height-0.075*p_height+vy, center+0.7*b_width, height-0.075*p_height+vy);
    
    strokeWeight(3.5);
    line(center, height*0.995+vy, center, height-0.225*p_height+vy);

    stroke(0);
    strokeWeight(1.2);
    line(center+b_width, height-0.15*p_height+vy,center+b_width, height-0.9*p_height+vy);
    line(center-b_width, height-0.15*p_height+vy,center-b_width, height-0.9*p_height+vy);
   }
}
