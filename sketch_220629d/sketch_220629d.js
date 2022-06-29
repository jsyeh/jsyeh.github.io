//要把 Processing 的 pde 程式
//翻譯成 p5.js JavaScript 
//(0)左邊程式先寫好
//(1) pde2js.herokuapp.com 幫你翻譯
//(2) 貼在這裡
//(3) 測試時, Run
function setup() {
    initializeFields();
    createCanvas(500, 500);
}

// 一開始0個棋子
var N;

var x;

var y;

function draw() {
    background(color(0xF5, 0xDB, 0x48));
    for (var i = 0; i <= 10; i++) {
        line(50 * i, 0, 50 * i, 500);
        line(0, 50 * i, 500, 50 * i);
    }
    // 畫棋盤
    for (var i = 0; i < N; i++) {
        ellipse(x[i], y[i], 45, 45);
    }
    // 手上的棋子
    ellipse(mouseX, mouseY, 45, 45);
}

function mousePressed() {
    // 省空間
    x[N] = mouseX;
    // 省空間
    y[N] = mouseY;
    N++;
}

function initializeFields() {
    N = 0;
    x = new Array(100);
    y = new Array(100);
}
