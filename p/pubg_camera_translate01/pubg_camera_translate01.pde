void setup(){
  size(200,200,P3D);
  noFill();
}
float x=0, z=0, vx=0, vz=0;
void draw(){
  background(255);
  
  beginCamera();
  camera();
  x+=vx; z+=vz;
  translate(-x, 0, -z);
  endCamera();
  
  translate(100,100, 0);
  box(50);
}
void keyPressed(){
  if(keyCode==LEFT) vx=-1;
  if(keyCode==RIGHT) vx=+1;
  if(keyCode==UP) vz=-1;
  if(keyCode==DOWN) vz=+1;
}
void keyReleased(){
  if(keyCode==LEFT || keyCode==RIGHT) vx=0;
  if(keyCode==UP || keyCode==DOWN) vz=0;
}
