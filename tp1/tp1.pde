// agudo mayor a 90, vuelve a 0
//si no emitimos sonido no aumenta en X

import oscP5.*;

Verticales verticales;
float x1=0;
float y1=300;
Paleta paleta;


void setup() {

  size(1200, 600);
  background(235);

  verticales = new Verticales(x1);
  paleta= new Paleta("obra1.png", "obra2.jpeg", "obra3.jpeg");


}

void draw() {

  verticales.dibujar();
 
}
