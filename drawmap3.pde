void drawmap3()
{
  box = new FBox[10];
  box[0] = new FBox(360, 60);
  box[0].setPosition(180, 390);
  box[1] = new FBox(120, 60);
  box[1].setPosition(180, 330);
  box[2] = new FBox(60, 60);
  box[2].setPosition(210, 270);
  box[3] = new FBox(240, 60);
  box[3].setPosition(600, 150);
  box[4] = new FBox(60, 60);
  box[4].setPosition(630, 90);
  box[5] = new FBox(240, 60);
  box[5].setPosition(780, 390);
  box[6] = new FBox(180, 60);
  box[6].setPosition(810, 330);
  box[7] = new FBox(120, 60);
  box[7].setPosition(840, 270);
  box[8] = new FBox(300, 60);
  box[8].setPosition(510, 450);
  box[9] = new FBox(900, 180);
  box[9].setPosition(450, 510);
  box[9].setSensor(true);
  for (int i = 0; i < 10; i ++)
  {
    box[i].setStatic(true);
    PImage tmp = loadImage("3-"+i+".png");
    box[i].attachImage(tmp);
    world.add(box[i]);
  }

  man = new FCircle(26);
  man.setPosition(860, 200);
  man.setNoFill();
  man.setNoStroke();
  world.add(man);

  woman = new FCircle(26);
  woman.setPosition(10, 320);
  woman.setNoFill();
  woman.setNoStroke();
  world.add(woman);

  case1 = new FBox(60, 60);
  case1.setPosition(510, 85);
  case1.attachImage(c);
  world.add(case1);

  case2 = new FBox(60, 60);
  case2.setPosition(840, 205);
  case2.attachImage(c);
  world.add(case2);

  fallingy1 = man.getY();
  fallingy2 = woman.getY();
}

