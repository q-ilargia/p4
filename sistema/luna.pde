class Luna {

  private PShape yorma;
  private PImage yoxture;
  private float rotacion, velocidad, radio;
  private float x, y, z;

  Luna(float x, float y, float z, float radio) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.radio = radio;
    this.rotacion = 0;
    this.velocidad = 0.5 * random(1, 3);
    this.yorma = createShape(SPHERE, this.radio);
    this.yoxture = loadImage(dameYo);
    this.yorma.setTexture(yoxture);
    this.yorma.setStroke(0);
  }

  void display() {
    rotateY(radians(rotacion));
    translate(x, y, z);
    shape(yorma);
  }

  void giro() {
    rotacion += velocidad;
    if (rotacion >= 360){
      rotacion -= 360;
    }  
  }
}
