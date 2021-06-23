class Verticales {


//---------------------
//variables de calibracion
float minimoAmp = 45;
float maximoAmp = 100;
float minimoPitch = 44; //grave
float maximoPitch = 74; //agudo
boolean monitor = false;

float f = 0.9;
//---------------------
float amp;
float pitch;

GestorSenial gestorAmp;
GestorSenial gestorPitch;
//declaro el objeto osc
OscP5 osc;
  float x1;
  float moverv;


  Verticales(float xl) {
    this.x1=xl;
  gestorAmp = new GestorSenial(minimoAmp, maximoAmp,f);
  gestorPitch = new GestorSenial(minimoPitch, maximoPitch,f);

  //inicializo el obejeto osc
  osc = new OscP5(this, 12345);
  

  }


  void dibujar() {
    
  gestorAmp.actualizar(amp);
  gestorPitch.actualizar(pitch);

   //tamaños en X
    int  x2= int(random(4, 9));
    int  x3 = int(random(2, 8));
    int  x4 = int(random(1, 4));

  
    noStroke();
    rectMode(CENTER);
    frameRate(35);
    

if(pitch < 47){ 
    fill(paleta.darUnColor(), 230 ); 
}

if(pitch >= 47 && pitch < 55 ){ 
   fill(paleta.darUnColor2(), 230 ); 
}


if(pitch > 55 && pitch < 90 ){ 
   fill(paleta.darUnColor3(), 230 ); 
}


    rect(x1, random(245, 345), x2, random(-360, 360));    
    rect(x1, random(245, 345), x3, random(-270, 270));
    rect(x1, random(280, 320), x4, random(-480, 480));
    
 if(amp > 75){
    moverv=x1+3.2;  
    x1=moverv;
 }
 else{
  moverv --; 
 }
 
 if(pitch > 90){
   background(200);
  x1 = 0; 
 }
 
    if(x1 == width){
    background(235);
    x1 = 0; 
   }
  }
  
  void oscEvent(OscMessage m){
  if(m.addrPattern().equals("/amp")){
   amp = m.get(0).floatValue(); //cargo en la variable amp el primer dato del mensaje q entra
  println("amp:" + amp);
}

 if(m.addrPattern().equals("/pitch")){
   pitch = m.get(0).floatValue(); //cargo en la variable amp el primer dato del mensaje q entra
  println("pitch:" + pitch);
}

}
  
}
