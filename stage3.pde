//character == 1
import fisica.*;
import fisica.util.nonconvex.*;
int character = 0;

void stage3()
{
  if (runningTime - startingTime <= 5)
  {
    tint(255,255,255,trans);
    PImage transP = loadImage("3.jpg");
    image(transP, 0, 0);
    if (trans < 255)
      trans++;
  }
  else
  {
    tint(255, 255, 255, 255);
    bg = loadImage("bg3.jpg");
    image(bg, 0, 0);
    addBoyGirl();
    world.step();
    world.draw();

    if (meet())
    {
      stage = 4;
      changeStage = true;
      trans = 0;
      startingTime = millis()/1000;
      bgm.close();
      bgm = minim.loadFile("bgm4.mp3", 2048);
       
      bgm.loop();
    }
  }
}

void movingStage3()
{
  if (character == 0)
  {
    if (keyCode == LEFT)
    {
      if (man.getX() > 0)
        man.setPosition(man.getX() - speed, man.getY());
      boy = loadImage("boy2.png");
    }
    if (keyCode == RIGHT)
    {
      if (man.getX() < width)
        man.setPosition(man.getX() + speed, man.getY());
      boy = loadImage("boy.png");
    }
    if (keyCode == UP)
    {
      if (onGround(man, box.length))
        man.addImpulse(0, upForce);
    }
    if (keyCode == SHIFT)
      character = 1;
  }
  else if (character == 1)
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
    if (keyCode == SHIFT)
      character = 0;
  }
}

