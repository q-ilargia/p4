class Sol {
  
  private PShape sorma;
  private PImage soltura; 
  private float rotacion, velocidad, radio;
  private float x, y, z;
  private ArrayList<Planeta> planetas;

  Sol(float x, float y, float z, float radio) {
    this.planetas = new ArrayList<Planeta>();
    this.x = x;
    this.y = y;
    this.z = z;
    this.radio = radio;
    this.rotacion = 0;
    this.velocidad = 0.25;
    this.soltura = loadImage(dameSol);
    this.sorma = createShape(SPHERE, this.radio); 
    this.sorma.setTexture(soltura);
    this.sorma.setStroke(0);
    addPlanetas();
  }

  void display() {
    translate(x, y, z);
    rotateX(radians(-45));
    drawSol();
    drawPlanetaas();
  }

  void giro() {
    rotacion += velocidad;
    if (rotacion >= 360) { 
      rotacion = 0;
    }
  }

  void addPlanetas() {
    planetas.add(new Planeta(radio + 7 + 5, y - radio*4, 0, 7, dameMercurio, false, "Mercurio"));
    planetas.add(new Planeta(radio + 15 + 108, y - radio*4, 0, 15, dameVenus, false, "Venus"));
    planetas.add(new Planeta(radio + 15 + 149, y - radio*4, 0, 15, dameTierra, true, "Tierra"));
    planetas.add(new Planeta(radio + 10 + 228, y - radio*4, 0, 10, dameMarte, true, "Marte"));
    planetas.add(new Planeta(radio + 40 + 780, y - radio*4, 0, 40, dameJupiter, true, "Júpiter"));
  }

  void drawSol() {
    pushMatrix();
    rotateY(radians(rotacion));
    shape(sorma);
    popMatrix();
  }

  void drawPlanetaas() {
    for (Planeta planeta : planetas) {
      pushMatrix();
      planeta.display();
      popMatrix();
      planeta.giro();
    }
  }
}
