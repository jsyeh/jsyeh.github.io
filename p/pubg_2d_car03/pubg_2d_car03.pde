void setup(){
  size(500,500);
  rectMode(CENTER);
}
float x=250, y=250, angle=0;
void draw(){
  //background(255);
 
  pushMatrix();
  translate(x,y);
  rotate( radians(angle) );
  rect(0,0,30,10);
  ellipse(0,0,3,3);
  popMatrix();
}
void keyPressed(){
  if(keyCode==LEFT) angle--;
  if(keyCode==RIGHT) angle++;
  if(keyCode==UP){
    x += cos(radians(angle))*10;
    y += sin(radians(angle))*10;
  }
  if(keyCode==DOWN){
    x -= cos( radians(angle))*10;
    y -= sin( radians(angle))*10;
  }
}
