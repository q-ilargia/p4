Sol sol;
PImage futurama;
PImage fondo;
String dameFuturama = "../texturas/futurama.png";
String dameFondo = "../texturas/fondo.jpg";
String dameSol = "../texturas/sun.jpg";
String dameMercurio = "../texturas/mercury.png";
String dameVenus = "../texturas/VENUS.jpg";
String dameTierra = "../texturas/earth.jpg";
String dameMarte = "../texturas/mars.jpg";
String dameJupiter = "../texturas/JUPITER.jpg";
String dameYo = "../texturas/yo.jpg";







float derr = -180;
float to = 10;
PVector direccion = new PVector(0,0,1);
PVector camara = new PVector(width/2 ,height/2 -100,(height/2.0) / tan(PI*30.0 / 180.0));
PVector futuramapos = new PVector(0,0,0);
PVector up = new PVector(0, 1, 0);
int dist = 500;
float hor;
float ver;

boolean veoFuturama;
boolean w = false, s = false, a = false, d = false;
boolean upp = false, down = false, left = false, right = false;
float pas = 5.0;
float angulo = 1;










void setup() {
  size(1280, 720, P3D);
  imageMode (CENTER) ;
  fondo = loadImage (dameFondo);
  sol = new Sol(width/2, height/2, 0, 100);
  futurama = loadImage(dameFuturama);
}

void draw() {
  background(fondo);

    textAlign(CENTER);
    text("W A S D para el movimiento de la nave \n Flechas de dirección para la cámara \n Enter para empezar", 350,35);
  
  
  if (!veoFuturama){
    camera();
  }else{

    actualizarCamara();
    camera(
      camara.x, camara.y, camara.z,
      futuramapos.x, futuramapos.y, futuramapos.z,
      up.x, up.z, up.y);
    pushMatrix();
    translate(futuramapos.x, futuramapos.y, futuramapos.z);
    image(futurama, 0, 0);
    popMatrix();
  }
  
  sol.display();
  sol.giro();
}

void keyPressed(){
  if (keyCode == ENTER){
    veoFuturama = !veoFuturama;
  }else if (key == 'w'){
    w = true;
  }else if (key == 's'){
    s = true;
  }else if (key == 'a'){
    a = true;
  }else if (key == 'd'){
    d = true;
  }else if (keyCode == UP){
    upp = true;
  }else if (keyCode == DOWN){
    down = true;
  }else if (keyCode == LEFT){
    left = true;
  }else if (keyCode == RIGHT){
    right = true;
  }
}


void keyReleased(){
  if (key == 'w'){
    w = false;
  }
  if (key == 's'){
    s = false;
  }
  if (key == 'a'){
    a = false;
  }
  if (key == 'd'){
    d = false;
  }
  if (keyCode == UP){
    upp = false;
  }
  if (keyCode == DOWN){
    down = false;
  }
  if (keyCode == LEFT){
    left = false;
  }
  if (keyCode == RIGHT){
    right = false;
  }
}

void actualizarVectoresFuturama(){
  hor = dist * cos(radians(to));
  ver = dist * sin(radians(to));
  camara.y = futuramapos.y + ver;
  camara.x = futuramapos.x + hor * sin(radians(derr));
  camara.z = futuramapos.z + hor * cos(radians(derr));
  direccion.x = sin(radians(derr)) * cos(radians(to));
  direccion.z = cos(radians(derr)) * cos(radians(to));
  direccion.y = sin(radians(to));
  direccion.normalize();
}

void actualizarCamara(){
  if (w){
    futuramapos.add(PVector.mult(direccion, 5));
  }
  
  if (s){
    futuramapos.sub(PVector.mult(direccion, 5));
  }
  
  if (a){
    PVector producto = new PVector();
    PVector.cross(direccion, up, producto);
    producto.normalize();
    futuramapos.sub(PVector.mult(producto, 5));
  }
  
  if (d){
    PVector producto = new PVector();
    PVector.cross(direccion, up, producto);
    producto.normalize();
    futuramapos.add(PVector.mult(producto, 5));
  }
  
  if (upp){
    to -= 1;
    to = to % 360;
  }
  
  if (down){
    to += 1;
    to = to % 360;
  }
  
  if (left){
    derr -= 1;
    derr = derr % 360;
  }
  
  if (right){
    derr += 1;
    derr = derr % 360;
  }
  
  actualizarVectoresFuturama();
}
