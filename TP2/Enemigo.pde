class Enemigo {

  FWorld mundo;
  BolaDeFuego bola; 
  FDistanceJoint joint;

  FCircle enemigoCabeza1;
  FCircle enemigoCabeza2;
  FCircle enemigoCabeza3;
  FBox cuerpoEnemigo;
  FBox rectangulo1, rectangulo2, rectangulo3, rectangulo4;

  PImage hidra, cabeza1, cabeza2, cabeza3;
  float tamX;
  float tamY;
  float tamC1 = 70;
  float px=750;
  float py = 400;
  float px2=880;
  float py2 = 280;
  float px3=1050;
  float py3 = 200;
  float posCuelloX1 = 800;
  float posCuelloY1 = 425;
  float angulo;
  float anguloVel = 1;
  float tiempo, cool, cool2;
  float posRect1X = 680;
  float posRect1Y = 450;
  float posRect2X = 750;
  float posRect2Y = 320;
  float posRect3X = 750;
  float posRect3Y = 550;
  float posRect4X = 850;
  float posRect4Y = 450;
  float impulso1 = -500;
  float impulso2 = 500;
  float impulso3 = -500;
  float impulso4 = 500;


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
    enemigoCabeza1.setGrabbable(false);
    enemigoCabeza1.setRotatable(false);
    enemigoCabeza1.setGroupIndex(-2);
    mundo.add(enemigoCabeza1);

    rectangulo1 = new FBox(20, 150);
    rectangulo1.setPosition(posRect1X, posRect1Y);
    rectangulo1.setDrawable(false);
    rectangulo1.setStatic(true);
    rectangulo1.setGrabbable(false);
    rectangulo1.setGroupIndex(-1);
    mundo.add(rectangulo1); 

    rectangulo2 = new FBox(350, 20);
    rectangulo2.setPosition(posRect2X, posRect2Y);
    rectangulo2.setDrawable(false);
    rectangulo2.setStatic(true);
    rectangulo2.setGrabbable(false);
    rectangulo2.setGroupIndex(-1);
    mundo.add(rectangulo2); 

    rectangulo3 = new FBox(350, 20);
    rectangulo3.setPosition(posRect3X, posRect3Y);
    rectangulo3.setDrawable(false);
    rectangulo3.setStatic(true);
    rectangulo3.setGrabbable(false);
    rectangulo3.setGroupIndex(-1);
    mundo.add(rectangulo3); 

    rectangulo4 = new FBox(20, 200);
    rectangulo4.setPosition(posRect4X, posRect4Y);
    rectangulo4.setDrawable(false);
    rectangulo4.setStatic(true);
    rectangulo4.setGrabbable(false);
    rectangulo4.setGroupIndex(-1);
    mundo.add(rectangulo4);
  }




  void dibujarCabeza2() {
    enemigoCabeza2 = new FCircle(tamC1);
    enemigoCabeza2.setName("enemigoCabeza2");
    enemigoCabeza2.setPosition(px2, py2);
    cabeza2=loadImage("cabeza2.png");
    enemigoCabeza2.attachImage(cabeza2);
    enemigoCabeza2.setGrabbable(false);
    enemigoCabeza2.setDensity(0.5);
    enemigoCabeza2.setStatic(true);
    enemigoCabeza2.setRotatable(false);
    enemigoCabeza2.setGroupIndex(-2);
    mundo.add(enemigoCabeza2);
  }


  void dibujarCabeza3() {
    enemigoCabeza3 = new FCircle(tamC1);
    enemigoCabeza3.setName("enemigoCabeza3");
    enemigoCabeza3.setPosition(px3, py3);
    cabeza3=loadImage("cabeza3.png");
    enemigoCabeza3.attachImage(cabeza3);
    enemigoCabeza3.setStatic(true);
    enemigoCabeza3.setRotatable(false);
    enemigoCabeza3.setGroupIndex(-2);
    enemigoCabeza3.setGrabbable(false);
    mundo.add(enemigoCabeza3);
  }


  void cadenaCabezas() {
    joint = new FDistanceJoint(cuerpoEnemigo, enemigoCabeza1);
    joint.setStroke(0, 0, 255);
    joint.setFill(0, 0, 255);
    joint.setLength(10);   //Distancia máxima que va a tratar de mantener el joint entre los 2 objetos
    joint.setDamping(600); //Fuerza con la que va a tirar del objeto
    joint.setFrequency(.00005); //Frecuencia con la que el joint va a tirar del objeto (creoq ue está en segundos)
    joint.setDrawable(false);
    mundo.add(joint);
    cool=200;   //Variables para ajustar los tirones del cuello
    tiempo = 0;
  }



  void movimientoCabezas() {
    if (millis()>tiempo+cool) {
      enemigoCabeza1.addImpulse(random(impulso1, impulso2), random(impulso3, impulso4));
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
