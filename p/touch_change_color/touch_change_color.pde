   
void setup(){
  size(500,500);
}
void draw(){
  background(255);
  
  if(touch1) fill(255,0,0);//如果變數1有碰到,變紅色
  else fill(255);
  ellipse( 150, 250, 100, 100);//第1個物體
  
  if(touch2) fill(255,0,0);//如果變數2有碰到,變紅色
  else fill(255);
  ellipse( 350, 250, 100, 100);//第2個物體
}
boolean touch1=false, touch2=false;//變數
void mouseMoved(){
  if( dist(mouseX,mouseY, 150,250)<50 ) touch1=true;//變數1
  else touch1=false;
  
  if( dist(mouseX,mouseY, 350,250)<50 ) touch2=true;//變數2
  else touch2=false;
  
}
