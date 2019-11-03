class Ship {
  int trailOffset = 10;
  int triX [] = new int [trailOffset];  //array for rød triangles x-værdier. Her kan man justere længen af trailet på ilden
  int triY [] = new int [trailOffset];  //array for rød triangles y-værdier. TrailOffset skal være ens ellers følger ilden ikke med spaceship

  //spaceship variables
  int x, y, w, h; //body
  int tipEvenX =21, tipEvenY = 41, tipY2 = 70; //top

  //strokes
  int strokeFire =2, strokeShip = 8;

  //fire Variables
  int fireYelX1 = 11, fireEven = 41, fireYelY2 = 100, fireYelX3 = 11;
  int fireRedEven = 21, fireRedY2 = 180;

  //Colors
  int fullColor = 255, grey = 200;
  int yellow = #FFE600;
  int red = #FFE600;
  
  int hpOffset = 350;
  int hp = 3;
  int graceTimer = 4000;
  int graceReset = 4000;



  Ship(int temp_x, int temp_y, int temp_w, int temp_h) { //player ship
    h = temp_h;
    w = temp_w;
    x = temp_x;
    y = temp_y;
  }

  void display() {  
    //fire 
    triX[triX.length - 1] = mouseX; //Her bliver det sidste index i arrayet, altså nr. 14 sat til valuen af musens x-position. fx. mouse = 50, som betyder triX[14] = 50 i det tilfælde.
    triY[triY.length - 1] = mouseY; //Positionen bliver updated i draw loopet og bliver brugt i for-loops længere nede. 


    stroke(red);
    for (int i = 0; i < triX.length - 1; i++) { //Det her for-loop skifter hver position i arrayet en til venstre så index 0 bliver til 1 og 1 til 2 osv. 
      triX[i] = triX[i + 1];                    //Den looper igennem alle positionerne i arrayet fra 0 til 14 og sætter det ind så fx. triX[0] = triX[0+1], altså triX[0] = triX[1].
      triY[i] = triY[i + 1];                    //Det er her musens position ovenover bliver passeret videre igennem arrayet.
    }
    strokeWeight(strokeFire);


    //Red outer fire triangle. Her bliver arrayet brugt til at tegne trekanten.
    //Gennem et for-loop kører den alle indexene af arrayet igennem. Længere oppe fik hvert element i arrayet værdien af musens position det bliver sat ind,
    //som koordinater for trianglen og justeret til så det passer til bunden ligesom den gule trekant nedenunder.
    //Hvert element i arrayet har altså musens tidligere position for hvert frame der går og indtil det bliver opdateret når musens position 
    //igen når fra slutningen af arrayet til starten af det. Det kan man se ved at sætte frameRate(1). Derfor kommer der et trail efter.

    for (int i = 0; i < triX.length; i++) {
      fill(fullColor, 0, 0);
      triangle(triX[i]-fireRedEven, triY[i]+fireEven, triX[i], triY[i]+fireRedY2, triX[i]+fireRedEven, triY[i]+fireEven);
    }                                                                                                                     
    fill(yellow);                                                                                                         
    triangle(x-fireYelX1, y+fireEven, x, y+fireYelY2, x+fireYelX3, y+fireEven); //Yellow inner fire triangle 

    strokeWeight(strokeShip);
    stroke(grey);
    noCursor();
    rectMode(CENTER);

    //spaceship body
    fill(fullColor);   

    rect(x, y, w, h);

    //spaceship top
    triangle(x-tipEvenX, y-tipEvenY, x, y-tipY2, x+tipEvenX, y-tipEvenY);
  }
  /*
  boolean collider(beams beamer) {
   float collision = dist(x, y, beamer.x1, beamer.y1); 
   { //minus 1 hp for hitting a beam
   if (collision == y ) {
   return true;
   } else { 
   return false;
   */

  void collider (beams beamer) {        

    if (dist(mouseX, mouseY, beamer.x2, beamer.y2) < h/3 + w/3 && graceTimer == graceReset) { 
      hp--;         
      graceTimer--; //Sætter gracetimeren ned. Er der så man ikke bare dør med det samme af 1 beam
    } else {
      if (graceTimer < graceReset) { // gracetimeren kører mod 0. Når den er 0 så sæt den tilbage op igen så man igen kan miste 1 liv.
        graceTimer--;
        if (graceTimer < 0) {
          graceTimer = graceReset;
        }
        }
      }
    }
    void hp() {

      fill(255);
      stroke(255);
      for (int i = 0; i < hp; i++) { //Laver rektanglerne og ændrer sig alt efter ens hp.
        rect(hpOffset + (i*50), 50, 20, 20);
      }
      if (hp == 0) {
        background(0);
      }
    }
  }
