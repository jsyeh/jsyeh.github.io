int [] bx=new int[5];
int [] bz=new int[5];
void setup(){
  size(500,500, P3D);
  //rectMode(CENTER);
  for(int i=0; i<5; i++){
    bx[i]=int(random(-5,4));
    bz[i]=int(random(-5,0));
  }
}
//float x=250, y=250, angle=0;
float x=0, z=0, vx=0, vz=0, angle=0, vangle=0;
void draw(){
  beginCamera();
  camera(0,0,0, 0,0,-1, 0,1,0);
  rotateY( -radians(angle) );
  translate(-width/2, -height/2, -height/2/tan(PI*30/180) );
  translate(-x, 0, -z);
  endCamera(); 
  x+=vx; z+=vz; angle+=vangle;
  
  
  background(255);
  translate(width/2, height/2);
  
  for(float z=-400; z<=400; z+=100){
    float x=400, y=50;
    line(-x,y,z, x,y,z);
  }
  for(float x=-400; x<=400; x+=100){
    float y=50, z=400;
    line(x,y,z, x,y,-z);
  }
  for(int i=0; i<5; i++){
    pushMatrix();
      translate(bx[i]*100+50,0,bz[i]*100+50);
      box(100);
    popMatrix();
  }

  //pushMatrix();
  //translate(x,y);
  //rotate( radians(angle) );
  //rect(0,0,30,10);
  //ellipse(0,0,3,3);
  //popMatrix();
}
void keyPressed(){
  if(keyCode==LEFT) vangle=1;//angle++;
  if(keyCode==RIGHT) vangle=-1;//angle--;
  if(keyCode==UP){
    vz = -cos(radians(angle));
    vx = -sin(radians(angle));
  }
  if(keyCode==DOWN){
    vz = cos( radians(angle));
    vx = sin( radians(angle));
  }
}
void keyReleased(){
  if(keyCode==UP || keyCode==DOWN) {vx=0; vz=0; }
  if(keyCode==LEFT || keyCode==RIGHT) vangle=0;
}
