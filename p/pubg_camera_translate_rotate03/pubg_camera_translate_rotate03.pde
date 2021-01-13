int [] bx=new int[5];
int [] bz=new int[5];
void setup(){
  size(600,300,P3D);
  for(int i=0; i<5; i++){
    bx[i]=int(random(-5,4));
    bz[i]=int(random(-5,0));
  }
}
float x=0, z=0, vx=0, vz=0;
void draw(){
  beginCamera();
  camera(0,0,0, 0,0,-1, 0,1,0);
  rotateY( radians(mouseX) );
  translate(-width/2, -height/2, -height/2/tan(PI*30/180) );
  x+=vx; z+=vz;
  translate(-x, 0, -z);
  endCamera();

  background(255);
  translate(width/2, height/2);
  
  for(float z=-400; z<=400; z+=100){
    float x=400, y=100;
    line(-x,y,z, x,y,z);
  }
  for(float x=-400; x<=400; x+=100){
    float y=100, z=400;
    line(x,y,z, x,y,-z);
  }
  for(int i=0; i<5; i++){
    pushMatrix();
      translate(bx[i]*100+50,100-50,bz[i]*100+50);
      box(100);
    popMatrix();
  }
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
