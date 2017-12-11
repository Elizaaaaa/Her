//mode == 1
import fisica.*;
import fisica.util.nonconvex.*;

void stage4()
{
  if (runningTime - startingTime <= 3)
  {
    tint(255,255,255,trans);
    PImage transP = loadImage("4.jpg");
    image(transP, 0, 0);
    if (trans < 255)
      trans++;
  }
  else
  {
    tint(255, 255, 255, 255);
    bg = loadImage("bg4.jpg");
    image(bg, 0, 0);
    addBoyGirl();
    world.step();
    world.draw();

    if (meet())
    {
      stage = 5;
      changeStage = true;
      trans = 0;
      startingTime = millis()/1000;
      bgm.close();
      bgm = minim.loadFile("bgm5.mp3", 2048);
       
      bgm.loop();
    }
  }
}

void movingStage4()
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
    {
      man.addImpulse(0, upForce);
    }
  }
}

boolean see()
{
  int pw = int(woman.getY());
  int pm = int(man.getY());
  if (pw - pm < 15 && pw - pm > -15)
  {
    for (int i = 0; i < box.length; i++)
    {
      float up = box[i].getY() - box[i].getHeight()/2;
      float down = box[i].getY() + box[i].getHeight()/2;
      if (man.getY() > up && man.getY() < down 
          && box[i].getX() < man.getX() && box[i].getX() > woman.getX())
        return false;
      }
     return true;
    }
  else return false;
  }

