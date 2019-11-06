class Bird {
  PImage img;
  float width, height;

  Bird(PImage image, float w, float h) {
    img = image;
    width = w;
    height = h;
  }

  void display(float cx, float cy, int size) {
    float current_width = size;
    float current_height = height * size / width;

    stroke(192, 192, 192);
    image(img, cx, cy, current_width, current_height);
  }
}
