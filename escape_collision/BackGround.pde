class BackGround {
  void display() {
    noStroke();
    color c1 = color(17, 128, 249);
    color c2 = color(227, 246, 254);
    for(float w = 0; w < width; w += 5){
      for(float h = 0; h < height; h += 5){
        color c = lerpColor(c1, c2, (w + h) / (width + height));
        fill(c);
        rect(w, h, 5, 5);
      }
    }
  }
}
