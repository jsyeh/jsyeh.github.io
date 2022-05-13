//pde2js Processing to p5.js 線上可以轉換
//https://pde2js.herokuapp.com/
//step03-2 Week12_5_web 要放上網頁,可用中文
function setup() {
    initializeFields();
    createCanvas(400, 300);
    textSize(40);
}

// -1:沒選, 0:Choise 1
var choice;

function draw() {
    // 背景色
    background(color(0xDF, 0xEA, 0x45));
    // 字的填充的顏色
    fill(color(0x45, 0x6F, 0xEA));
    if (choice == 0)
        rect(50, 50, 150, 2);
    if (choice == 1)
        rect(50, 100, 150, 2);
    if (choice == 2)
        rect(50, 150, 150, 2);
    text("中餐吃泡麵", 50, 50);
    text("中餐UberEat", 50, 100);
    text("中餐FoodPanda", 50, 150);
}

function mousePressed() {
    // choice = (choice + 1) % 3;
    choice = int(random(3));
}

function initializeFields() {
    choice = -1;
}
