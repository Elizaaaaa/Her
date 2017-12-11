//mode == 1
import fisica.*;
import fisica.util.nonconvex.*;

void stage5()
{
  if (runningTime - startingTime <= 3)
  {
    tint(255,255,255,trans);
    PImage transP = loadImage("5.jpg");
    image(transP, 0, 0);
    if (trans < 255)
      trans++;
  }
  else
  {
    tint(255, 255, 255, 255);
    bg = loadImage("bg5.jpg");
    image(bg, 0, 0);
    addBoyGirl();
    world.step();
    world.draw();
    int wx = int(woman.getX());
    int mx = int(man.getX());

    if (mx - wx < 23 && woman.getY() >= 500)
    {
      mode = 3;
      trans = 0;
    }
  }
}

void movingStage5()
{
  if (keyCode == LEFT)
  {
    if (woman.getX() > 0)
      woman.setPosition(woman.getX() - speed, woman.getY());
    girl = loadImage("girl2.png");
  }
  if (keyCode == RIGHT)
  {
    if (woman.getX() < width)
      woman.setPosition(woman.getX() + speed, woman.getY());
    girl = loadImage("girl.png");
  }
  if (keyCode == UP)
  {
    if (onGround(woman, box.length))
      woman.addImpulse(0, upForce);
  }
}

