PImage img;
void setup(){
  fullScreen();//size(800,400); //Step01
  orientation(LANDSCAPE);       //Step02
  img = loadImage("your_image.jpg");
}
int x=0, y=0, w=800, h=400;//your image position
void draw(){
  //image( img, x, y, w, h);
  int x2=x*width/800, y2=y*height/400;//Step03
  int w2=w*width/800, h2=h*height/400;//Step03
  image( img, x2, y2, w2, h2);//Step04
  //rect(x2,y2,w2,h2);
  //ellipse(x2,y2,w2,h2);
}
