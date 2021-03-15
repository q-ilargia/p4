class Planeta {

  private PShape plorma;
  private PImage plextura;
  private float rotacion, velocidad, radio;
  private float x, y, z;
  private Luna luna;
  private boolean ponLuna;
  private String nombrePlaneta;

  Planeta(float x, float y, float z, float radio, String damePlaneta, boolean ponLuna, String nombrePlaneta) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.radio = radio;
    this.rotacion = 0;
    this.velocidad = 0.55 * random(1, 2);
    this.ponLuna = ponLuna;
    this.plorma = createShape(SPHERE, this.radio);
    this.plextura = loadImage(damePlaneta);
    this.plorma.setTexture(plextura);
    this.plorma.setStroke(0);
    this.nombrePlaneta = nombrePlaneta;

    if (ponLuna) {
      float lunaRadio = radio / random(6, 8);
      this.luna = new Luna(x * 0.1, y * 0.075, 0, lunaRadio);
    }
  }

  void display() {
    rotateY(radians(rotacion));
    translate(x, y, z);
    textAlign(CENTER);
    text(nombrePlaneta, 0, -(radio + 10));
    shape(plorma);
    if (ponLuna) drawLuna();
  }

  void giro() {
    rotacion += velocidad;
    if (rotacion >= 360) rotacion -= 360;
  }

  void drawLuna() {
    pushMatrix();
    luna.display();
    popMatrix();
    luna.giro();
  }
}
