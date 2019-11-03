int colorZero = 0;
int beamCounter = 1;

Ship Spaceship;

int nmb = 50;
beams [] beams = new beams [nmb];
//beams [] beams = new beams {1, 1, 2, 2, 3, 3, 4, 4, 5, 6}; //kræver mere avanceret programmering at give hvert element en værdi når det er objekter


void setup() {
  size(500, 1000);

  int _x= 10, _y= 10, _w = 50, _h = 70; //spaceship dimensions

  int _y1 = int(random(-200,0)), _y2 = _y1+ 50, _strokeW = 10; //beam variables
  float _x1 = random(1, 500);
  float _x2 = _x1;
  color _c = #FFF700;
  int _speed = int(random (5,10));


  Spaceship = new Ship(_x, _y, _w, _h);
  

  for (int i = 0; i < beams.length; i++) {
    _x1 = random(1, 500);
    _x2 = _x1;
    beams[i] = new beams(_x1, _y1, _x2, _y2, _strokeW, _c, _speed); //beams bliver created med random position
  }
  beams[0] = new beams(_x1, _y1, _x2, _y2, _strokeW, _c, 5); //Her kan man ændre speeden på første beam, som kontrollere hvor hurtigt de andre beams spawner. Speed 3 = easy, speed = 5 medium, speed = 10 insane.
}

void draw() {   
  background(colorZero);
  Spaceship.x = mouseX;
  Spaceship.y = mouseY;


  Spaceship.display();
  for(int i = 0; i < beams.length; i++){
  Spaceship.collider(beams[i]);
  }
  beams[0].show();
  beams[0].move();
  
  Spaceship.hp();

  


  if (beams[0].y2 > height) { //beamcounter bliver forøget når den første beam når bunden af skærmen
    beamCounter++;
  }

  if(beamCounter > nmb) {
    beamCounter = nmb;
  }

  for (int i = 0; i < beamCounter; i++) { //Mens i er mindre end beamcounter så loop i med i = i + 1
    beams[i].show();                      //Beam objekterne, som blev created længere oppe bliver vist og bevæget her
    beams[i].move();
  }
}
