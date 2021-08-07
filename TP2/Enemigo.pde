class Enemigo {

  FWorld mundo;
  BolaDeFuego bola; 
  FDistanceJoint joint;
  
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
  float tiempo, cool;
  
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
    enemigoCabeza1.setDensity(0.3);
    enemigoCabeza1.attachImage(cabeza1);
    enemigoCabeza1.setStatic(false);
    enemigoCabeza1.setGrabbable(true);
    //enemigoCabeza1.setDensity(2);
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
  joint = new FDistanceJoint(cuerpoEnemigo, enemigoCabeza1);
  joint.setStroke(0, 0, 255);
  joint.setFill(0, 0, 255);
  joint.setLength(100);   //Distancia máxima que va a tratar de mantener el joint entre los 2 objetos
  joint.setDamping(40); //Fuerza con la que va a tirar del objeto
  joint.setFrequency(.0005); //Frecuencia con la que el joint va a tirar del objeto (creoq ue está en segundos)
  mundo.add(joint);
  
  cool=200;   //Variables para ajustar los tirones del cuello
  tiempo = 0;
}

void movimientoCabezas(){
 //Ajuste para los tirones del cuello. Cada 200 milisegundos le asigno un impulso random
  if (millis()>tiempo+cool) {
    enemigoCabeza1.addImpulse(random(-500, 550), random(-500, 500));
    tiempo = millis();
  }
}



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
