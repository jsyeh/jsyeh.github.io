
function setup() {
    initializeFields();
    createCanvas(450, 450);
}

// 在 Java 的陣列
var bx;

// 和C/C++/C#不同
var by;

// 現在有 N 的棋子
var N;

function draw() {
    background(color(0xF5, 0xD6, 0x65));
    for (var y = 50; y < 450; y += 50) {
        line(0, y, 450, y);
    }
    for (var x = 50; x < 450; x += 50) {
        line(x, 0, x, 450);
    }
    for (var i = 0; i < N; i++) {
        if (// 2倍數,黑
        i % 2 == 0)
            // 2倍數,黑
            fill(0);
        else
            // 白
            fill(255);
        ellipse(bx[i], by[i], 40, 40);
    }
    if (// 2倍數,黑
    N % 2 == 0)
        // 2倍數,黑
        fill(0);
    else
        // 白
        fill(255);
    ellipse(mouseX, mouseY, 40, 40);
}

function mousePressed() {
    bx[N] = mouseX;
    by[N] = mouseY;
    N++;
}

function initializeFields() {
    bx = new Array(100);
    by = new Array(100);
    N = 0;
}
