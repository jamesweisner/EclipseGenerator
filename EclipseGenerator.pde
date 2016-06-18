boolean paused;
Spark[] sparks;
Particle center;
ParticleSystem physics;

void setup()
{
  frameRate(100);
  size(1001, 1001);
  ellipseMode(RADIUS);
  noStroke();
  init();
}

void draw()
{
  // Update.
  for(int i = 1; i < physics.numberOfAttractions(); i++)
  {
    Attraction a = physics.getAttraction(i);
    if(a.getTheOtherEnd() != center)
    {
      a.setStrength(pow(center.age(), 1.75));
      a.setMinimumDistance(15 + center.age());
    }
  }
  physics.tick(0.1);

  // Draw.
  pushMatrix();
  translate(width / 2, height / 2);
  for(int i = 0; i < sparks.length; i++)
    sparks[i].draw();
  popMatrix();
}

void mouseClicked()
{
  saveFrame("eclipse-####.png");
}

void keyPressed()
{
  if(key == 'r') init();
  if(key == ' ') paused = !paused;
  if(paused) noLoop(); else loop();
}

void init()
{
  background(0);
  physics = new ParticleSystem(0.0, 0.0);
  center = physics.makeParticle(100, 0, 0, 0);
  center.makeFixed();
  sparks = new Spark[320];
  for(int i = 0; i < sparks.length; i++)
    sparks[i] = new Spark();
}