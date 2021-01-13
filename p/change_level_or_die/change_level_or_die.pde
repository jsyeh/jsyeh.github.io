//1. 過關  2. 死掉
void setup(){
  size(500,500);
  newLevel();
}
void newLevel(){
  goalX=random(500); goalY=random(500);  success=false;
  level++;
}
float x=100, y=100, goalX, goalY;
boolean success=false;
int level=0;//0, 1, 2, 3, 4, 5
void draw(){
  if(success){
    background(255,255,0);
    if(mousePressed) newLevel();
  }else{
    background(255);
    ellipse(x,y,100,100);
    ellipse(goalX,goalY,100,100);
    //1. 過關
    if( dist(x, y, goalX,goalY)<50 ){
      success=true;
    }
  }
}
void mouseMoved(){
  x=mouseX; y=mouseY;
}
