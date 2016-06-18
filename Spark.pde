import traer.physics.*; // http://murderandcreate.com/physics/

class Spark
{
  float theta;
  float alpha;
  Particle p;

  public Spark()
  {
    this.theta = random(TWO_PI);
    this.alpha = 0.5 + random(1.5);
    int radius = 200; // Raidus of the sun.
    float x = sin(this.theta) * radius;
    float y = cos(this.theta) * radius;
    this.p = physics.makeParticle(1, x, y, 0);
    physics.makeAttraction(p, center, -400, 1);
    for (int i = 1; i < physics.numberOfParticles(); i++)
      physics.makeAttraction(p, physics.getParticle(i), 0, 0);
  }

  public void draw()
  {
    Vector3D p = this.p.position();
    float r = max(0, 23 - alpha * pow(center.age(), 1.10));
    ellipse(p.x(), p.y(), r, r);
  }
}