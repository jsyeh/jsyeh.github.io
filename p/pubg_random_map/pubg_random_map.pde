int [] bx=new int[5];
int [] bz=new int[5];
void setup(){
  size(600,300,P3D);
  for(int i=0; i<5; i++){
    bx[i]=int(random(-5,4));
    bz[i]=int(random(-5,0));
  }
}
void draw(){
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
