//mode = 1
FWorld world;
FCircle man, woman;
FBox [] box;
FBox case1, case2;

float fallingy1, fallingy2; 
boolean recorded1;
boolean recorded2;
boolean changeStage = true;
int speed = 2;
int upForce = -400;

void gamePlay()
{

  if (changeStage)
  {
    Init();
    if (stage == 1) drawmap1(); 
    if (stage == 2) drawmap2();
    if (stage == 3) drawmap3();
    if (stage == 4) drawmap4();
    if (stage == 5) drawmap5();
    changeStage = false;
  }

  if (!onGround(man, box.length) && !recorded1)
  {
    fallingy1 = man.getY();
    recorded1 = true;
  }
  else if (onGround(man, box.length)) recorded1 = false;
  if (!onGround(woman, box.length) && !recorded2)
  {
    fallingy2 = woman.getY();
    recorded2 = true;
  }
  else if (onGround(man, box.length)) recorded2 = false;

  adjustPosition(man, box.length);
  adjustPosition(woman, box.length);

  if (fallingDeath1() || fallingDeath2() && stage < 5)
  {
    world.clear();
    changeStage = true;
  }

  if (stage == 1)
    stage1();
  else if (stage == 2)
    stage2();
  else if (stage == 3)
    stage3();
  else if (stage == 4)
    stage4();
  else if (stage == 5)
    stage5();

  if (man.getX()<13)
    man.setPosition(13, man.getY());
  if (woman.getX()<13)
    woman.setPosition(13, woman.getY());
  if (man.getY()<13)
    man.setPosition(man.getX(), 13);
  if (woman.getY()<13)
    woman.setPosition(woman.getX(), 13);

  if (stage == 4)
  {
    if (see())
    {
      if (woman.getX() < width && !meet() && onGround(woman, box.length))
        woman.setPosition(woman.getX() + speed, woman.getY());
    }
  }
}

void Init()
{
  Fisica.init(this);
  world = new FWorld();
  world.setGrabbable(false);
  world.setEdges(); 
  world.remove(world.top); 
  world.remove(world.left); 
  world.remove(world.right);
  world.setGravity(0, 700);

  recorded1 = false; 
  recorded2 = false;
}

boolean onGround(FCircle a, int n)
{
  for (int i = 0; i < n; i++)
  {
    if (a.isTouchingBody(box[i]) && int(a.getY())+43 <= int(box[i].getY()))
      return true;
  }

  if (a.isTouchingBody(case1) && int(a.getY())+43 <= int(case1.getY()))
    return true;

  if (a.isTouchingBody(case2) && int(a.getY())+43 <= int(case2.getY()))
    return true;

  return false;
}

void adjustPosition(FCircle a, int n)
{
  for (int i = 0;  i < n; i++)
  {
    float up = box[i].getY() - box[i].getHeight()/2;
    float down = box[i].getY() + box[i].getHeight()/2;
    if (a.isTouchingBody(box[i]) && a.getY() > up && a.getY() < down)
    {
      if (a.getX() < box[i].getX() && a.getX() + 13 > box[i].getX() - box[i].getWidth()/2)
        a.setPosition(box[i].getX() - box[i].getWidth()/2 - 13, a.getY());
      if (a.getX() > box[i].getX() && a.getX() - 13 < box[i].getX() + box[i].getWidth()/2)
        a.setPosition(box[i].getX() + box[i].getWidth()/2 + 13, a.getY());
    }
  }
}

boolean fallingDeath1()
{
  if (man.getY() - fallingy1 > 210)
    return true;

  if (stage == 3)
  {
    if (man.isTouchingBody(box[8]))
      return true;
  }

  return false;
}

boolean fallingDeath2()
{
  if (woman.getY() - fallingy2 > 210)
    return true;

  if (stage == 3)
  {
    if (woman.isTouchingBody(box[8]))
      return true;
  }

  return false;
}

boolean meet()
{
  int x1 = int(man.getX());
  int x2 = int(woman.getX());
  int y1 = int(man.getY());
  int y2 = int(woman.getY());
  if (y1 == y2)
  {
    if (x1+26 == x2)
      return true;
    if (x1-26 == x2)
      return true;
  }
  return false;
}

void addBoyGirl()
{
  int bx = int(man.getX()) - 13;
  int by = int(man.getY()) - 13 - 23;
  if (stage == 5)
    boy = loadImage("boy2.png");
  image(boy, bx, by);
  int gx = int(woman.getX()) - 13;
  int gy = int(woman.getY()) - 13 - 23;
  if (stage == 4)
    girl = loadImage("girl.png");
  image(girl, gx, gy);
}

