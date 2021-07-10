PImage normal;

class personaje {

  int W, H, posX, posY;


  personaje( int W_, int H_, int posX_, int posY_  ) {

    normal = loadImage("normal1.png");
    W=W_;
    H=H_;
    posX=posX_;
    posY=posY_;
  }

  void dibujarPersonaje(FWorld mundo) {

    FBox personaje = new FBox(W, H);
    personaje.setPosition(posX, posY);
    personaje.setName("personaje");
    personaje.setStatic(true);
    personaje.attachImage(normal);
    mundo.add(personaje);
  }

  void PersonajeEnElAire() {
  }

  void PersonajeCubierto() {
  }
}
