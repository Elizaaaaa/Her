PImage begin0, begin1;
PImage bg;

int choose = 0;
int trans = 0;

// mode == 0
void startPage()
{
  begin0 = loadImage("begin0.jpg");
  begin1 = loadImage("begin1.jpg");

  if (choose == 0)
    image(begin0, 0, 0);
  else if (choose == 1)
    image(begin1, 0, 0);
}

void keyPressed()
{
  if (mode == 0)
  {
    if (keyCode == UP || keyCode == DOWN)
      choose = (choose+1)%2;

    if (choose == 0 && keyCode == ENTER)
    {
      mode = 1;
      startingTime = millis()/1000;
      bgm.close();
      bgm = minim.loadFile("bgm1.mp3", 2048);
      bgm.loop();
    }
    else if (choose == 1 && keyCode == ENTER)
      mode = 2;
  }

  if (mode == 1)
  {
    if (stage == 1)
      movingStage1();
    else if (stage == 2)
      movingStage2();
    else if (stage == 3)
      movingStage3();
    else if (stage == 4)
      movingStage4();
    else if (stage == 5)
      movingStage5();

    if (key == 'x')
      changeStage = true;
    if (key == 'z')
    {
      mode = 0;
      stage = 1;
      bgm = minim.loadFile("op.mp3", 2048);
      bgm.loop();
    }
  }

  if (mode == 2)
  {
    if (key == 'z')
      mode = 0;
  }
}

