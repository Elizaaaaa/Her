void drawmap4()
{
  box = new FBox[10];
  box[0] = new FBox(120, 240);
  box[0].setPosition(60, 240);
  box[1] = new FBox(60, 60);
  box[1].setPosition(150, 330);
  box[2] = new FBox(240, 60);
  box[2].setPosition(300, 450);
  box[3] = new FBox(300, 60);
  box[3].setPosition(630, 148);
  box[4] = new FBox(180, 60);
  box[4].setPosition(630, 88);
  box[5] = new FBox(180, 120);
  box[5].setPosition(810, 300);
  box[6] = new FBox(180, 60);
  box[6].setPosition(630, 450);
  box[7] = new FBox(900, 120);
  box[7].setPosition(450, 540);
  box[8] = new FBox(180, 120);
  box[8].setPosition(90, 420);
  box[9] = new FBox(180, 120);
  box[9].setPosition(810, 420);

  for (int i = 0; i < 10; i ++)
  {
    box[i].setStatic(true);
    PImage tmp = loadImage("4-"+i+".png");
    box[i].attachImage(tmp);
    world.add(box[i]);
  }

  man = new FCircle(26);
  man.setPosition(860, 220);
  man.setNoFill();
  man.setNoStroke();
  world.add(man);

  woman = new FCircle(26);
  woman.setPosition(10, 90);
  woman.setNoFill();
  woman.setNoStroke();
  world.add(woman);

  case1 = new FBox(60, 60);
  case1.setPosition(800, 200);
  case1.attachImage(c);
  world.add(case1);

  case2 = new FBox(60, 60);
  case2.setPosition(660, 380);
  case2.attachImage(c);
  world.add(case2);

  fallingy1 = man.getY();
  fallingy2 = woman.getY();
}

