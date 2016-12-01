class Bullet extends Floater
{

  Bullet (SpaceShip theShip){
    myPointDirection=theShip.getPointDirection();
    double dRadians =myPointDirection*(Math.PI/180);
    myCenterX=theShip.getX();
    myCenterY=theShip.getY();
    myDirectionX=5 * Math.cos(dRadians) +  theShip.myDirectionX;
    myDirectionY=5 * Math.sin(dRadians) +  theShip.myDirectionY;
}


   public void show(){
  fill(255,0,0);
  ellipse((float)(myCenterX),(float)(myCenterY),5,5);
}
	
	public void move(){
		myCenterX+=myDirectionX;
		myCenterY+=myDirectionY;
		}

  public void setX(int x) {myCenterX=x;}
  public int getX(){return (int)(myCenterX);}
  public void setY(int y) {myCenterY=y;}
  public int getY(){return (int)(myCenterY);}
  public void setDirectionX(double x){myDirectionX=x;}
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY=y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection=degrees;}
  public double getPointDirection(){return myPointDirection;}
}
  