class Enemigo{
  float tamX;
  float tamY;
  
  Enemigo(float tam_X, float tam_Y){
    tamX = tam_X;
    tamY = tam_Y;     
 
  }
   
  void dibujar(){
   
   FBox enemigo = new FBox(tamX,tamY);
   enemigo.setPosition(900,250);
   enemigo.setStatic(true);
   enemigo.setName("enemigo");
   enemigo.setFill(255,0,0);
   mundo.add(enemigo);  
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
