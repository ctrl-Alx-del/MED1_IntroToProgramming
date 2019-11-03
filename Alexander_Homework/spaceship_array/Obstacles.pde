class beams {

  int y1, y2, strokeW;
  color c;
  float x1, x2;
  int speed;



  beams(float temp_x1, int temp_y1, float temp_x2, int temp_y2, int temp_strokeW, color temp_c, int _speed) {
    strokeW = temp_strokeW;
    x1 = temp_x1;
    x2 = temp_x2;
    y1 = temp_y1;
    y2 = temp_y2;
    c = temp_c;
    speed = _speed;
  }

  void show() {
    strokeWeight(strokeW);
    line(x1, y1, x2, y2);
    stroke(c);

    if (y2 > height) {
      y2 = -50; 
      y1 = 30;
     
    }
  }

  void move() {
    y1 = y1 + speed;
    y2 = y2 + speed;
  }
}
