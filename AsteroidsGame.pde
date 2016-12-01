SpaceShip jew = new SpaceShip();

int alive = 0;
int r;
int g;
int b;
int dindu = 0;

Star[] ayy = new Star[150];

ArrayList <Roid> steroids = new ArrayList <Roid>();
ArrayList <Bullet> maga = new ArrayList <Bullet>();

public void setup() 
{
  size(1000,1000);
  jew.setX(350);
  jew.setY(350);

  
  for (int i=0;i<ayy.length;i++){
    ayy[i] = new Star((int)(Math.random()*1000),(int)(Math.random()*1000));
  }

  for (int i=0; i < 10; i++){
    
    steroids.add(new Roid());
    steroids.get(i).setX((int)(Math.random()*1000));
    steroids.get(i).setY((int)(Math.random()*1000));
    steroids.get(i).setDirectionX((Math.random()*20)-10);
    steroids.get(i).setDirectionY((Math.random()*20)-10);


  }

}
public void draw() 
{

if (alive==0){
  background(0);
  jew.show();
  jew.move();



for (int i=0;i<steroids.size();i++){
       steroids.get(i).move();
       steroids.get(i).show();
     }
}

else if (alive==1){
  background(255);
  textSize(100);
  fill(255,0,0);
  text("u ded",200,200);

}

else if(alive==2){
  textSize(200);
  background(255);
  text("wiener",400,400);
}


  for (int i=0;i<ayy.length;i++){
    ayy[i].asd();
  }

    r+=(int)(Math.random()*500)-255;
    g+=(int)(Math.random()*500)-255;
    b+=(int)(Math.random()*500)-255;

     for (int i=0;i<steroids.size();i++){

       if (dist(jew.getX(), jew.getY(), steroids.get(i).getX(), steroids.get(i).getY())<50){
          alive=1;
        } 

    for (int j=0;j<maga.size();j++){
      
      if (dist(maga.get(j).getX(), maga.get(j).getY(), steroids.get(i).getX(), steroids.get(i).getY())<50){
          steroids.remove(i);
          maga.remove(j);
          dindu++;

          break;
      } 

    }
  }

if (dindu==10){
  alive=2;
}

  for (int i=0;i<maga.size();i++){
    maga.get(i).show();
    maga.get(i).move();

  }

}

public void keyPressed(){
     if (keyCode == LEFT ){
        jew.rotate(-40);
      }

     if (keyCode == RIGHT){
        jew.rotate(40);
      }

     if (keyCode == UP ){
        jew.accelerate(0.3);
      }

    if (keyCode == DOWN){
      jew.setX((int)(Math.random()*1000));
      jew.setY((int)(Math.random()*1000));
      jew.setDirectionX(0);
      jew.setDirectionY(0);
    }

    if (keyCode==32){
      maga.add(new Bullet(jew));
    }

  }



class SpaceShip extends Floater  
{   

    public SpaceShip(){
      corners=4;
      int[] xC={-5,3,-5,-2,-5};
      int[] yC={-5,0,5,0,-5};

      myColor=255;

      xCorners=xC;
      yCorners=yC;

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

class Star 
{
    private int myX;
    private int myY;
  
  public Star(int x, int y){
   myX=x;
   myY=y;
  }
 
  public void asd(){
    fill(r,g,b);
    ellipse(myX,myY,5,5);
  }
}

class Roid extends Floater
{
    private int rosalina =(int)((Math.random()*7)-3);


    public Roid(){
     corners=5;
     int[] xC={-4,0,6,4,-2};
     int[] yC={0,4,0,-2,-4};

      for (int i=0;i<xC.length;i++){
        xC[i]*=10;
        yC[i]*=10;
      }

     myColor=color(160,82,45);
     xCorners=xC;
     yCorners=yC;
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


    void move(){
      rotate(rosalina);
      super.move();
    }
}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class
{
  protected int corners;  //the number of corners, a triangular floater has 3
  protected int[] xCorners;
  protected int[] yCorners;
  protected int myColor;
  protected double myCenterX, myCenterY; //holds center coordinates
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel
  protected double myPointDirection; //holds current direction the ship is pointing in degrees
  abstract public void setX(int x);   
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dradians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dradians));    
    myDirectionY += ((dAmount) * Math.sin(dradians));       
  }   
  public void rotate (int nDegreesOfrotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfrotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dradians = myPointDirection*(Math.PI/180);                 
    int xrotatedTranslated, yrotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xrotatedTranslated = (int)((xCorners[nI]* Math.cos(dradians)) - (yCorners[nI] * Math.sin(dradians))+myCenterX);     
      yrotatedTranslated = (int)((xCorners[nI]* Math.sin(dradians)) + (yCorners[nI] * Math.cos(dradians))+myCenterY);      
      vertex(xrotatedTranslated,yrotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   


} 

