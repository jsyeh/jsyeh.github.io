//請用 Ctrl-N開新的Processing PDE介面
//再按右上角,把Java換成 p5.js
//會得到空白的 funciton setup(){...}
//再利用 processing to p5.js converter來轉
//如下, 小心, if後面 一定要加大括號
//再按 三角形 執行 Ctrl-R
function setup(){//設定只做1次
  createCanvas(400,200);
}
function draw(){//畫圖,每秒60frame
  let s = second();//0..59 秒
  if( s%2==0 ){
    background(255,0,0);
  }else{
    background(58,114,191);
  }
}
