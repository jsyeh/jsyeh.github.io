//(0) 在 Java 模式, 先把程式寫好
//(1) 切換 p5.js 模式, 有新視窗
//(2) 利用 pde2js.herokuapp.com 將 Java 轉成 p5.js
//(3) p5.js 貼回 p5.js視窗
//(4) 另存新檔 gopher, 小心還沒放圖檔,放進你的 桌面/gopher 裡
//(5) index.html 裡 第9行 改成 src="gopher.js"
//(6) 把 gopher目錄 拉近 GitHub 的 jsyeh.github.io 專案倉庫

var img1, img2, img3, img4, gopher, soil, bg, stone, stone2;

function setup() {
    initializeFields();
    createCanvas(640, 480);
    bg = loadImage("bg.jpg");
    stone = loadImage("stone1.png");
    stone2 = loadImage("stone2.png");
    soil = loadImage("soil8x24.png");
    img1 = loadImage("groundhogIdle.png");
    img2 = loadImage("groundhogDown.png");
    img3 = loadImage("groundhogLeft.png");
    img4 = loadImage("groundhogRight.png");
    gopher = img1;
}

var a;

var x, y, vx, vy;

function draw() {
    // 背景圖
    image(bg, 0, 0);
    image(soil, 0, 160 - y);
    for (var i = 0; i < 24; i++) {
        // 左手i 對應高度
        for (var j = 0; j < 8; j++) {
            // 右手j 對應x座標
            if (a[i][j] == 1)
                image(stone, j * 80, i * 80 + 160 - y);
            if (a[i][j] == 2) {
                image(stone, j * 80, i * 80 + 160 - y);
                image(stone2, j * 80, i * 80 + 160 - y);
            }
        }
    }
    image(gopher, x, 80);
    x += vx * 6;
    y += vy * 6;
}

function keyPressed() {
    if (keyCode == LEFT_ARROW) {
        vx = -1;
        vy = 0;
        gopher = img3;
    }
    if (keyCode == RIGHT_ARROW) {
        vx = +1;
        vy = 0;
        gopher = img4;
    }
    if (keyCode == DOWN_ARROW) {
        vx = 0;
        vy = 1;
        gopher = img2;
    }
}

function keyReleased() {
    vx = 0;
    vy = 0;
    gopher = img1;
}

function initializeFields() {
    img1 = null;
    img2 = null;
    img3 = null;
    img4 = null;
    gopher = null;
    soil = null;
    bg = null;
    stone = null;
    stone2 = null;
    a = [ [ 1, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 1, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 1 ], [ 0, 1, 1, 0, 0, 1, 1, 0 ], [ 1, 0, 0, 1, 1, 0, 0, 1 ], [ 1, 0, 0, 1, 1, 0, 0, 1 ], [ 0, 1, 1, 0, 0, 1, 1, 0 ], [ 0, 1, 1, 0, 0, 1, 1, 0 ], [ 1, 0, 0, 1, 1, 0, 0, 1 ], [ 1, 0, 0, 1, 1, 0, 0, 1 ], [ 0, 1, 1, 0, 0, 1, 1, 0 ], [ 0, 1, 2, 0, 1, 2, 0, 1 ], [ 1, 2, 0, 1, 2, 0, 1, 2 ], [ 2, 0, 1, 2, 0, 1, 2, 0 ], [ 0, 1, 2, 0, 1, 2, 0, 1 ], [ 1, 2, 0, 1, 2, 0, 1, 2 ], [ 2, 0, 1, 2, 0, 1, 2, 0 ], [ 0, 1, 2, 0, 1, 2, 0, 1 ], [ 1, 2, 0, 1, 2, 0, 1, 2 ] ];
    x = 300;
    y = 0;
    vx = 0;
    vy = 0;
}

function preload() {
// TODO: put method calls that load from files into this method
// I found the following calls that you should move here:
// - on line 4: bg = loadImage("bg.jpg")
// - on line 5: stone = loadImage("stone1.png")
// - on line 6: stone2 = loadImage("stone2.png")
// - on line 7: soil = loadImage("soil8x24.png")
// - on line 8: img1 = loadImage("groundhogIdle.png")
// - on line 9: img2 = loadImage("groundhogDown.png")
// - on line 10: img3 = loadImage("groundhogLeft.png")
// - on line 11: img4 = loadImage("groundhogRight.png")
// (note that line numbers are from your Processing code)
}
