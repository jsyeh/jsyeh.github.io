import processing.serial.*;
Serial myPort;

void setup(){
  size(300,300);
  myPort = new Serial(this, "COM5", 9600);
}
float vx=0, vy=0;
float x=100, y=100;
void draw(){
  while( myPort.available()>=3 ){ //若你 Arduino 傳 3 bytes, while 裡 >=3
    int x = myPort.read();  //那就一次收 3 byte
    int y = myPort.read();  //但不要直接拿收到的(粗糙)資料來用
    int sw = myPort.read();
    
    vx = (x-128)/64; //可以把它變成移動的速度 -2.0 ~ +2.0 中間
    vy = (y-128)/64;
  }
  
  x += vx; //接著要在 while(迴圈) 外面, 利用速度來改變座標
  y += vy; //就會變得比較順
  ellipse( x, y, 100, 100);
  
}
