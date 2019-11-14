class Cloud {
  color c1 = color(17, 128, 249);
  color c2 = color(255);

  float nScale = 0.007;
  float tScale = 0.03;
  float step = 5.0;

  PVector nOffset1, nOffset2;

  Cloud(PVector offset1, PVector offset2) {
    nOffset1 = offset1;
    nOffset2 = offset2;
  }

  void display() {
    float time = frameCount * tScale;
    for(int w = 0; w < width; w += step){
      for(int h = 0; h < height; h += step){
        float n = noise(w * nScale + nOffset1.x + time, h * nScale + nOffset1.y - time, time);
        float r = map(n, 0, 1, red(c1), red(c2));
        float g = map(n, 0, 1, green(c1), green(c2));
        float b = map(n, 0, 1, blue(c1), blue(c2));
        fill(r, g, b);
        rect(w, h, step, step);
        fill(255, 255, 255, map(abs(n - 0.5) + 0.5, 0, 1, 255, 0));
        rect(w, h, step, step);   
      }
    }
  }
}
