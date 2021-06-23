class Paleta{
  
PImage imagen;  
PImage imagen2; 
PImage imagen3; 
  
 Paleta (String nombreArchivo, String nombreArchivo2, String nombreArchivo3){
 imagen = loadImage(nombreArchivo); 
 imagen2 = loadImage(nombreArchivo2);
 imagen3 = loadImage(nombreArchivo3);

 } 
  
  color darUnColor(){
    int x= int(random(imagen.width));
    int y= int(random(imagen.height));
   return imagen.get(x , y); //get devuelve un pixel al azar de la imagen 
   }
   
   color darUnColor2(){
    int x= int(random(imagen.width));
    int y= int(random(imagen.height));
   return imagen2.get(x , y); //get devuelve un pixel al azar de la imagen 
   } 
   
   color darUnColor3(){
    int x= int(random(imagen.width));
    int y= int(random(imagen.height));
   return imagen3.get(x , y); //get devuelve un pixel al azar de la imagen 
   }
}  
