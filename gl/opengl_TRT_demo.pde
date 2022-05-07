//2020-04-22 我想做可 Visualize T-R-T 觀念的工具
// Left: 400x400 OpenGL drawing area, 限制最多畫6個彩色物件,以免畫面凌亂
// Right: OpenGL coding area
//2020-04-23 實作trello-like的board移動
//2020-04-22 Idea: 突然想到,可嘗試做 電腦圖學之父 Ivan Sutherland 的 sketchpad
//2020-04-22 Idea: 用 Processing寫出 Text Editor,
//  可scroll可縮放文字, 方便秀程式碼、方便調順序、方便改參數
//Q: Code Board在drag時, Object會突然從半透明變成不透明, 很奇怪, 要查 myDrawNew()
class Board {
  String code;
  int x=0, y=0;//position位置
  int w=100;//textWidth(code)寬度
  int h=40;//text height + 20, ex. textSize(32)則用 40 高度
  boolean bMoving=false;//是否正被mouseDragged拖曳中
  boolean bChoosing=false;
  int ancherX, ancherY;//用來換算mouseDragged時,按下去的ancher點,主要使用 ancherY
  float tx=0,ty=0,tz=0;
  int id=0;//myDrawObject(id)
  boolean bLower=false;//如果是要被擠下去的板子,就設定 bLower
  int glType=0;//0:glPushMatrix(), 1:glPopMatrix(), 2:glTranslatef(), 3:glScalef(), 4:myDrawObject(), 5:glPopMatrix()
  Board(String _code, int _glType, int _x, int _y){
    glType = _glType;
    code=new String(_code);
    x=_x; 
    y=_y;
    w=int(textWidth(code));
  }
  Board(String _code, int _x, int _y) {
    code=new String(_code);
    x=_x; 
    y=_y;
    w=int(textWidth(code));
  }
  Board() {
    code=new String();
  }
  Board(Board sample) {
    code=new String(sample.code);
    x=sample.x;
    y=sample.y;
    w=sample.w;
    h=sample.h;
    bMoving=sample.bMoving;
    ancherX=sample.ancherX;
    ancherY=sample.ancherY;
  }
  boolean insideBoard(int px, int py) {//test if (px,py) inside the board
    if ( x<=px && px<=x+w && y<=py && py<y+h ) return true;//最後1個<=等號刪掉,以免多選
    return false;
  }
  boolean insideRange(int px, int py){
    if( x<=px && px<=x+300 && y<=py && py<y+h ) return true;//最後1個<=等號刪掉,以免多選
    return false;
  }
  void draw() {
    if (bChoosing) {
      pushMatrix();
      translate(x+w/2, y+h/2);
      if(bMoving) rotateZ(radians(-5));//在拖曳移板子時,稍斜-5度,會可愛一些
      fill(255, 0, 0, 128); 
      stroke(0); 
      rect(-w/2, -h/2, w, h);
      fill(0); 
      text(code, -w/2, -h/2);
      popMatrix();
    } else {
      int dy=0;
      if(bLower) dy=h;
      noFill();
      stroke(0); 
      rect(x, y+dy, textWidth(code), 40);
      fill(0); 
      text(code, x, y+dy);
    }
  }
  void updateCode(){
    if(glType==1){
      code = "glTranslate("+nf(tx,1,2)+","+nf(-ty,1,2)+");";
    }
  }
}
String []code={"glPushMatrix", "glTranslate", "glRotatef", "glScalef;", "myDrawObj();", "glPopMatrix"};
ArrayList<Board> currentCode;
Board movingBoard=null;
ArrayList<PVector> curve=null;
ArrayList<ArrayList<PVector>> all;
color [] objC={#FF3700, #FFAF00, #FFF700, #2DFF00, #009FFF, #FF00EF};
int [] bornAngle=new int[6];
int topC=0;
int rotAngle=0;
boolean bKeepRotating=false;
void setup() {
  size(900, 400, P3D);hint(DISABLE_DEPTH_TEST);
  textSize(32);
  textAlign(LEFT, TOP);
  all = new ArrayList<ArrayList<PVector>>();
  currentCode = new ArrayList<Board>();
  int i=0;
  currentCode.add( new Board("glPushMatrix();", 0, 420, 50+40*i++) );
  currentCode.add( new Board("glTranslatef(0,0,0);", 1, 440, 50+40*i++) );
  currentCode.add( new Board("glRotatef(angle,0,0,1);", 2, 440, 50+40*i++) );
  currentCode.add( new Board("glTranslatef(0,0,0);", 1, 440, 50+40*i++) );
  currentCode.add( new Board("glPopMatrix();", 5, 420, 50+40*i++) );
}
void draw() {
  background(255);
  drawAxis(400, 400);
  myDrawNew();//drawObjects();
  drawCode();
  if (bKeepRotating) rotAngle++;
  fill(0); 
  if(rotAngle<10) text("angle=  "+(rotAngle)%360, 730,0);
  else if(rotAngle<100) text("angle= "+(rotAngle)%360, 730,0);
  else text("angle="+(rotAngle)%360, 730,0);
  noFill(); rect(750,350,textWidth("ToDraw"),50);
  fill(255,0,0); text("ToDraw",750,350);
}
void drawCode() {
  for (Board b : currentCode) {
    b.draw();
  }
  if (movingBoard!=null) {
    movingBoard.draw();
  }
}
void drawAxis(int w, int h) {
  fill(0);
  rect(0, 0, w, h);
  stroke(255);
  fill(255);
  line(0, h/2, w, h/2);
  line(w, h/2, w-20, h/2-10);
  line(w, h/2, w-20, h/2+10);
  text("x", w-textWidth("x"), h/2);

  line(w/2, 0, w/2, h);
  line(w/2, 0, w/2+10, 20);
  line(w/2, 0, w/2-10, 20);
  text("y", w/2-textWidth("y"), 0);
  text("0", w/2-textWidth("0"), h/2);
}
void myDrawNew(){
  pushMatrix();
  translate(200,200);//從左上角 放回Axis的中心  
  for(Board b : currentCode){
    //0:glPushMatrix(), 1:glPopMatrix(), 2:glTranslatef(), 3:glScalef(), 4:myDrawObject(), 5:glPopMatrix()
    if(b.glType==0) pushMatrix();
    if(b.glType==1){ellipse(0,0,3,3); translate(b.tx*200, b.ty*200, b.tz*200);}
    if(b.glType==2) rotateZ(radians(rotAngle));
    //if(b.glType==3) scale(b.tx,b.ty,b.tz);
    if(b.glType==4) myDrawObject(b.id);
    if(b.glType==5) popMatrix();
  }
  if(movingBoard!=null){
    myDrawObject(movingBoard.id);
  }
  popMatrix();
  fill(255, 128);//這是正在畫的物件
  strokeWeight(1);
  if (curve!=null) {
    beginShape();
    for (PVector pt : curve) {
      vertex(pt.x, pt.y);
    }
    endShape();
  }
}
void myDrawObject(int obj){
  if(obj >= all.size() ) return ;
  ArrayList<PVector> one = all.get(obj);

  fill(#ff0000); ellipse(0,0, 10,10);//畫出物件中心
  fill(objC[obj], 200);
  pushMatrix();
    translate(-200,-200);//把東西放左上角的(0,0)位置
    beginShape();
    for(PVector pt : one){
      vertex(pt.x, pt.y);
    }
    endShape(CLOSE);
  popMatrix();
}
void drawObjects() {
  strokeWeight(2);
  for (int c=0; c<all.size(); c++) {//all.size() is always less than 6
    ArrayList<PVector> one = all.get(c);
    pushMatrix();
    translate(200, 200);
    rotateZ(radians(rotAngle-bornAngle[c]));//誕生後,才會加入轉動
    translate(-200, -200);
    fill(objC[c], 200);
    beginShape();
    for (PVector pt : one) {
      vertex(pt.x, pt.y);
    }
    endShape(CLOSE);
    popMatrix();
  }
  fill(255, 128);
  strokeWeight(1);
  if (curve!=null) {
    beginShape();
    for (PVector pt : curve) {
      vertex(pt.x, pt.y);
    }
    endShape();
  }
}
int nowState=0;//1: draw curve, 2: select code, 3: translate
Board candidate=null;
void mousePressed() {
  candidate=null;
  for(Board b : currentCode){
    if(b.bChoosing==true){
      candidate=b;
      if(b.glType==1) nowState=3;//for translate
    }
  }//這裡要思考一下, 我打算當 bChoosing是translate時, 把dragged拿來增加translate的tx,ty
  //這時候需要另一個dragged
  
  for (int i=0; i<currentCode.size(); i++) {
    Board now = currentCode.get(i);
    now.bChoosing=false;
    if ( now.insideBoard(mouseX, mouseY) && now.glType!=0 && now.glType!=5 ) {
      nowState=2;
      movingBoard = currentCode.get(i);
      movingBoard.bMoving=true;
      now.bChoosing=true;
      movingBoard.ancherX=mouseX-movingBoard.x;
      movingBoard.ancherY=mouseY-movingBoard.y;
      for(int k=i+1; k<currentCode.size(); k++){
        Board next = currentCode.get(k);
        next.y -= next.h;
        next.bLower=true;
      }
      currentCode.remove(i);
      //break;
    }
  }
  if (mouseX<400 & nowState==3){  } //這是要移動 candidate裡的tx,ty
  else if (mouseX<400 & topC<6) nowState=1;//in the drawing area
  
  if (nowState==1) {
    curve = new ArrayList<PVector>();
  }
}
void mouseDragged() {
  if (nowState==3) {
    candidate.tx += (mouseX-pmouseX)/200.0;
    candidate.ty += (mouseY-pmouseY)/200.0;
    candidate.updateCode();
  }
  if (nowState==1) {
    curve.add(new PVector(mouseX, mouseY));
  } else if (nowState==2) {
    movingBoard.y += (mouseY-movingBoard.y-movingBoard.ancherY);
    for(int i=0; i<currentCode.size(); i++){
      Board b = currentCode.get(i);
      b.bLower=false;
      if(b.insideRange(mouseX,mouseY)){
        for(int k=i; k<currentCode.size();k++){
          currentCode.get(k).bLower=true;
        }
        break;
      }
    }
  }
}
void mouseReleased() {
  if (nowState==3) nowState=0;
  if (nowState==1) {
    all.add(curve);
    curve=null;
    nowState=0;
    bornAngle[topC]=rotAngle;
    Board obj = new Board("myDrawObject("+topC+");", 4, 440, 50);
    obj.id=topC;
    currentCode.add(0, obj); 
    for(int i=1; i<currentCode.size();i++){
      Board b = currentCode.get(i);
      b.y += b.h;
    }
    topC++;
  } else if (nowState==2) {
    for(int i=0;i<currentCode.size();i++){
      Board b = currentCode.get(i);
      if(b.insideRange(mouseX,mouseY)){
        for(int k=i;k<currentCode.size();k++){
          Board b2=currentCode.get(k);
          b2.bLower=false;
          b2.bChoosing=false;
          b2.bMoving=false;
          b2.y+=b2.h;
        }
        movingBoard.y=b.y-b.h;
        movingBoard.bMoving=false;
        currentCode.add(i, movingBoard);
        movingBoard=null;
        nowState=0;
        break;
      }//problem: 在放開時, movingBoard如果在下方,會有問題
    }
    if(nowState==2){//沒有放在任何一個board的位置,所以沒插在前面
      Board last = currentCode.get(currentCode.size()-1);
      movingBoard.y = last.y + last.h;
      movingBoard.bMoving=false;
      currentCode.add(movingBoard);
      movingBoard=null;
      nowState=0;
    }
  }
}
void keyPressed() {
  if (key==' ') bKeepRotating = !bKeepRotating;
  if (key=='1' && movingBoard==null) {
    movingBoard=new Board("glPushMatrix();", mouseX, mouseY);
  }
}
