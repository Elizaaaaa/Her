import fisica.*;
import fisica.util.nonconvex.*;
import ddf.minim.*;

AudioPlayer bgm;
Minim minim;

int mode = 0;
int stage = 1;
int runningTime;
int startingTime;

PImage boy, girl, intro, te, c;

void setup()
{
  size(900, 600);
  frameRate(60);
  boy = loadImage("boy.png");
  girl = loadImage("girl.png");
  intro = loadImage("instruction.jpg");
  te = loadImage("trueEnding.jpg");
  c = loadImage("case.png");
  minim = new Minim(this);
  bgm = minim.loadFile("op.mp3", 2048);
  bgm.loop();
}

void draw()
{
  runningTime = millis()/1000;
  if (mode == 0)
    startPage();
  else if (mode == 1)
    gamePlay();
  else if (mode == 2)
    image(intro, 0, 0);
  else if (mode == 3)
  {
    tint(255,255,255,trans);
    image(te, 0, 0);
    if (trans < 255)
      trans ++;
  }
}

