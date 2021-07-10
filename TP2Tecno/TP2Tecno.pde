
//2020 INFORMATICA APLICADA 2 - CATEDRA CAUSA - ATAM - UNA
//ESTE EJEMPLO DIBUJA UNA ELIPSE POR CADA PATRON Y SU RESPECTIVO ID

import fisica.*; //importo la libreria de fisica 
//import TUIO.*; //Declaramos un objeto de tipo TuioProcessing
//TuioProcessing tuioClient;


PImage fondo;
FWorld mundo;//objeto mundo de fisica

personaje p;
base Base;
Arco a;

void setup(){
  size(1200, 700);
  //inicializamos la libreria
  // tuioClient  = new TuioProcessing(this);
  Fisica.init(this);//inicializamos la libreria

 fondo=loadImage("castillo2.png");//poner un array de todas las imagenes del juego
   
  //inicio un mundo//
  mundo=new FWorld();
  mundo.setEdges();
  //inicio mundo//

  //inicio al personaje y dibujo//
  p= new personaje(80, 180, 110, 428); //ancho,alto,posX,posY
  p.dibujarPersonaje(mundo);
  //inicio al personaje y dibujo//

  //incio clase base//
  Base = new base(115, 260,90, 570); //ancho,alto,posX,posY
  Base.dibujarBase();
  //incio clase base//
  
  //inicio clase arco
   a = new Arco(50,450);

 }


void draw() {
 // background(0);
 image(fondo,0,0,width,height);
  a.movimientoArco();

  mundo.step();
  mundo.draw();
  Base.ponerImagen();
  a.dibujar();
  a.eliminarBala();
}

void keyPressed(){
 if ( key==' ' ) {
  a.disparar( mundo );
  } 
}
