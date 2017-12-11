void drawmap5()
{
  box = new FBox[1];
  box[0] = new FBox(120, 60);
  box[0].setPosition(60, 120);
  box[0].setStatic(true);
  box[0].setNoStroke();
  box[0].setFill(0);
  world.add(box[0]);

  man = new FCircle(26);
  man.setPosition(870, 570);
  man.setNoFill();
  man.setNoStroke();
  world.add(man);

  woman = new FCircle(26);
  woman.setPosition(10, 70);
  woman.setNoFill();
  woman.setNoStroke();
  world.add(woman);

  fallingy1 = man.getY();
  fallingy2 = woman.getY();
}

