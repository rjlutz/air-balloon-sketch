public class Turret
{
  PVector location;
  int diameter;
  float baseAngle, minAngle, maxAngle, angle;
  float speed = .01;
  boolean collision;

  public Turret(int x, int y, int diameter, float baseAngle, float minAngle, float maxAngle)
  {
    location = new PVector(x, y);
    this.diameter = diameter;
    this.minAngle = minAngle;
    this.maxAngle = maxAngle;
    angle = minAngle;
  }

  public void display()
  {
    fill(100);
    
    pushMatrix();
    translate(location.x, location.y);
    rotate(updateAngle());
    rect(0, -5, 50, 10);
    popMatrix();

    ellipseMode(CENTER);
    ellipse(location.x, location.y, diameter, diameter);
  }

  private float updateAngle()
  {
    if ( angle <= minAngle )
      collision = false;
    else if ( angle >= maxAngle )
      collision = true;
      
    if ( collision == true )
      angle-=speed;
    else if ( collision == false )
      angle+=speed;
      
    return angle;
  }
  
  public float getAngle()
  {
    return angle;
  }
  
  public PVector getLocation()
  {
    return location;
  }
}

