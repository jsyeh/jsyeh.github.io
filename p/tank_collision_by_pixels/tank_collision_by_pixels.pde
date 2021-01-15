color [] table = new color[500*500];
void setup(){
  size(500,500);
  background(255);
  fill(0);
  rect(100,100, 300,300);
}
int tankX=0, tankY=0, vx=0, vy=0;
void draw(){
  background(255);
  fill(0);
  rect(100,100, 300,300);
  if(frameCount==1){
    loadPixels();
    for(int i=0; i<500*500;i++){
      table[i] = pixels[i];
      if(i==30) println(pixels[a(300,300)]);
    }
  }
  rect(tankX, tankY, 50,50);
  if( touchedFourCorners(tankX,tankY)==false &&
      touchedFourCorners(tankX+vx, tankY+vy)==false){
    tankX += vx;
    tankY += vy;  
  }
}
void keyPressed(){
  if(keyCode==RIGHT){vx=1; vy=0;}
  if(keyCode==LEFT){vx=-1; vy=0;}
  if(keyCode==UP){vx=0; vy=-1;}
  if(keyCode==DOWN){vx=0; vy=+1;}
}
void keyReleased(){
  if(keyCode==RIGHT || keyCode==LEFT) vx=0;
  if(keyCode==UP || keyCode==DOWN) vy=0;
}
boolean touchedFourCorners(int tankX, int tankY){
  if( touchedOneCorner(tankX,tankY) ) return true;
  if( touchedOneCorner(tankX+50,tankY) ) return true;
  if( touchedOneCorner(tankX,tankY+50) ) return true;
  if( touchedOneCorner(tankX+50,tankY+50) ) return true;
  return false;
}
int a(int x, int y){ return x+y*width; }
boolean touchedOneCorner(int x, int y){
  if(table[ a(x,y) ]== -16777216 ) return true;
  return false;
}
