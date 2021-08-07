class Enemigo {

  FWorld mundo;
  BolaDeFuego bola; 
  FMouseJoint cadena;
  FCircle enemigoCabeza1;
  FCircle enemigoCabeza2;
  FCircle enemigoCabeza3;
  FBox cuerpoEnemigo;
  
  PImage hidra, cabeza1, cabeza2, cabeza3;
  float tamX;
  float tamY;
  float tamC1 = 70;
  float px=750;
  float py = 400;
  float posCuelloX1 = 800;
  float posCuelloY1 = 425;
  float angulo;
  float anguloVel = 1;

  Enemigo(float tam_X, float tam_Y, FWorld mundo, BolaDeFuego bola) {

    this.mundo = mundo;
    this.bola = bola;
    tamX = tam_X;
    tamY = tam_Y;
    
    angulo = 0;

  }

  void cuerpo() {

    cuerpoEnemigo = new FBox(tamX, tamY);
    cuerpoEnemigo.setName("enemigoCuerpo");
    
    cuerpoEnemigo.setPosition(950, 500);
    cuerpoEnemigo.setStatic(true);
    cuerpoEnemigo.setGrabbable(false);
    hidra=loadImage("hidra2n.png");
    cuerpoEnemigo.attachImage(hidra);
    mundo.add(cuerpoEnemigo);
  }
  

  void dibujarCabeza1() {
    enemigoCabeza1 = new FCircle(tamC1);
    enemigoCabeza1.setPosition(px, py);
    enemigoCabeza1.setName("enemigoCabeza1");
    cabeza1=loadImage("cabeza.png");
    enemigoCabeza1.attachImage(cabeza1);
    enemigoCabeza1.setStatic(false);
    enemigoCabeza1.setGrabbable(true);
    mundo.add(enemigoCabeza1);
}


  void dibujarCabeza2() {
     enemigoCabeza2 = new FCircle(tamC1);
     enemigoCabeza2.setName("enemigoCabeza2");
     enemigoCabeza2.setPosition(px+150, 200);
     cabeza2=loadImage("cabeza2.png");
     enemigoCabeza2.attachImage(cabeza2);
     enemigoCabeza2.setStatic(true);
     enemigoCabeza2.setGrabbable(false);
     mundo.add(enemigoCabeza2);
  }


  void dibujarCabeza3() {
    enemigoCabeza3 = new FCircle(tamC1);
    enemigoCabeza3.setName("enemigoCabeza3");
    enemigoCabeza3.setPosition(px+300, 200);
    cabeza3=loadImage("cabeza3.png");
    enemigoCabeza3.attachImage(cabeza3);
    enemigoCabeza3.setStatic(true);
    enemigoCabeza3.setGrabbable(false);
    mundo.add(enemigoCabeza3);
  }


void cadenaCabezas(){
cadena = new FMouseJoint(enemigoCabeza1,px,py);
cadena.setFrequency(1);
mundo.add(cadena);
}

void movimientoCabezas(){
   cadena.setTarget(posCuelloX1, posCuelloY1); 
  /* posCuelloX1 = posCuelloX1 - anguloVel;
   if(posCuelloX1 < 650){
    anguloVel = anguloVel * -1;
   }
   else{
    anguloVel = anguloVel + 1; 
   }*/
}



  /*void MoverCabeza() {
   
   ArrayList <FBody> cuerpos = mundo.getBodies();
   for ( FBody este : cuerpos ) {
   String nombre = este.getName();
   if ( nombre != null ) {
   if ( nombre.equals("enemigoCabeza1") ) {
   enemigoCabeza1.setRotation(radians(angulo));
   
   angulo = angulo -0.01;
   angulo = constrain( angulo, 
   radians(-30), radians(50) );
   
   if (angulo == radians(-30)) {
   angulo = radians(50);
   }
   }
   }
   }
   }*/





  boolean hayColisionEntre( FContact contact, String nombreUno, String nombreDos ) {
    boolean resultado = false;
    FBody uno = contact.getBody1();
    FBody dos = contact.getBody2();
    String etiquetaUno = uno.getName();
    String etiquetaDos = dos.getName();

    if ( etiquetaUno != null && etiquetaDos != null ) {
      if ( 
        ( nombreUno.equals( etiquetaUno ) && nombreDos.equals( etiquetaDos ) ) ||
        ( nombreDos.equals( etiquetaUno ) && nombreUno.equals( etiquetaDos ) )
        ) {
        resultado = true;
      }
    }
    return resultado;
  }
}
