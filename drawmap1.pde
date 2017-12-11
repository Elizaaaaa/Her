void drawmap1()
{
  box = new FBox[7];
  box[0] = new FBox(60, 60);
  box[0].setPosition(30, 150);
  box[1] = new FBox(540, 60);
  box[1].setPosition(450, 150);
  box[2] = new FBox(60, 60);
  box[2].setPosition(450, 90);
  box[3] = new FBox(600, 180);
  box[3].setPosition(600, 510);
  box[4] = new FBox(240, 60);
  box[4].setPosition(420, 390);
  box[5] = new FBox(60, 60);
  box[5].setPosition(510, 330);
  box[6] = new FBox(180, 60);
  box[6].setPosition(810, 390);

  for (int i = 0; i < 7; i ++)
  {
    box[i].setStatic(true);
    PImage tmp = loadImage("1-"+i+".png");
    box[i].attachImage(tmp);
    box[i].setDensity(100);
    world.add(box[i]);
  }
  
  case1 = new FBox(60, 60);
  case1.setPosition(330, 85);
  case1.setDensity(10);
  case1.attachImage(c);
  world.add(case1);
  
  case2 = new FBox(60, 60);
  case2.setPosition(570, 85);
  case2.setDensity(10);
  case2.attachImage(c);
  world.add(case2);

  man = new FCircle(26);
  man.setPosition(15, 100);
  man.setNoFill();
  man.setNoStroke();
  world.add(man);

  woman = new FCircle(26);
  woman.setPosition(15, 560);
  woman.setNoFill();
  woman.setNoStroke();
  world.add(woman);
}
