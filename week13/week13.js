// 步驟1: 右上角 Java 改 p5.js
// 步驟2: week13_5_dinner_random 程式 去轉檔
// https://pde2js.herokuapp.com/ 貼在左邊, 按 Convert
// 步驟3: 把右邊程式碼, 貼到 Processing p5.js 這個窗
// Run

function setup() {
    initializeFields();
    // 只做1次
    createCanvas(300, 300);
    fill(color(0x97, 0xC4, 0xFA));
    textSize(50);
    textAlign(CENTER, CENTER);
}

// -1沒選, 0,1,2有選
var choice;

function draw() {
    // 每秒60次
    background(color(0xFF, 0xFA, 0xE8));
    text("Dinner 1", 150, 50);
    text("Dinner 2", 150, 150);
    text("Dinner 3", 150, 250);
    if (choice == 0)
        ellipse(30, 50, 50, 50);
    if (choice == 1)
        ellipse(30, 150, 50, 50);
    if (choice == 2)
        ellipse(30, 250, 50, 50);
}

function mousePressed() {
    // 當mouse按下去時
    // 取出整數0,1,2
    choice = int(random(3));
}

function initializeFields() {
    choice = -1;
}
