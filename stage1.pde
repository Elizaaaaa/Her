//mode == 1
import fisica.*;
import fisica.util.nonconvex.*;

void stage1()
{
  if (runningTime - startingTime <= 3)
  {
    tint(255,255,255,trans);
    PImage transP = loadImage("1.jpg");
    image(transP, 0, 0);
    if (trans < 255)
      trans++;
  }
  else
  {
    tint(255, 255, 255, 255);
    bg = loadImage("bg1.jpg");
    image(bg, 0, 0);
    addBoyGirl();
    world.step();
    world.draw();

    if (meet())
    {
      stage = 2;
      changeStage = true;
      trans = 0;
      startingTime = millis()/1000;
      bgm.close();
      bgm = minim.loadFile("bgm2.mp3", 2048);
       
      bgm.loop();
    }
  }
}

void movingStage1()
{
  if (keyCode == LEFT)
  {
    if (man.getX() > 0)
      man.setPosition(man.getX() - speed, man.getY());
    if (woman.getX() > 0)
      woman.setPosition(woman.getX() - speed, woman.getY());
    boy = loadImage("boy2.png");
    girl = loadImage("girl2.png");
  }
  if (keyCode == RIGHT)
  {
    if (man.getX() < width)
      man.setPosition(man.getX() + speed, man.getY());
    if (woman.getX() < width)
      woman.setPosition(woman.getX() + speed, woman.getY());
    boy = loadImage("boy.png");
    girl = loadImage("girl.png");
  }
  if (keyCode == UP)
  {
    if (onGround(man, box.length))
    {
      man.addImpulse(0, upForce);
      woman.addImpulse(0, upForce);
    }
  }
}

