boolean keyPressRecorded = false;

void keyPressed() {
    if (keyCode == UP) {
        oneSnake.moveUp = true;
    }
    if (keyCode == DOWN) {
        oneSnake.moveDown = true;
    }
    if (keyCode == RIGHT) {
        oneSnake.moveRight = true;
    }
    if (keyCode == LEFT) {
        oneSnake.moveLeft = true;
    }
    if (key == 'w') {
        twoSnake.moveUp = true;
    }
    if (key == 's') {
        twoSnake.moveDown = true;
    }
    if (key == 'd') {
        twoSnake.moveRight = true;
    }
    if (key == 'a') {
        twoSnake.moveLeft = true;
    }
    if (key == 'y') {
        threeSnake.moveUp = true;
    }
    if (key == 'h') {
        threeSnake.moveDown = true;
    }
    if (key == 'j') {
        threeSnake.moveRight = true;
    }
    if (key == 'g') {
        threeSnake.moveLeft = true;
    }
    if (key == 'p') {
        fourSnake.moveUp = true;
    }
    if (key == 'æ') {
        fourSnake.moveDown = true;
    }
    if (key == 'ø') {
        fourSnake.moveRight = true;
    }
    if (key == 'l') {
        fourSnake.moveLeft = true;
    }

    if (gameState == 10) {
        if (keyPressed && keyPressRecorded == false) {
            if (key == ' ') {
                gameState = 18;
            }
        }
    }
    if (gameState == 0){
        if (key == ' ') {
            gameState = 9;
            keyPressRecorded = true;
        }
    }
}

void keyReleased() {
    keyPressRecorded = false;

    if (keyCode == UP) {
        oneSnake.moveUp = false;
    }
    if (keyCode == DOWN) {
        oneSnake.moveDown = false;
    }
    if (keyCode == RIGHT) {
        oneSnake.moveRight = false;
    }
    if (keyCode == LEFT) {
        oneSnake.moveLeft = false;
    }
    if (key == 'w') {
        twoSnake.moveUp = false;
    }
    if (key == 's') {
        twoSnake.moveDown = false;
    }
    if (key == 'd') {
        twoSnake.moveRight = false;
    }
    if (key == 'a') {
        twoSnake.moveLeft = false;
    }
    if (key == 'y') {
        threeSnake.moveUp = false;
    }
    if (key == 'h') {
        threeSnake.moveDown = false;
    }
    if (key == 'j') {
        threeSnake.moveRight = false;
    }
    if (key == 'g') {
        threeSnake.moveLeft = false;
    }
    if (key == 'p') {
        fourSnake.moveUp = false;
    }
    if (key == 'æ') {
        fourSnake.moveDown = false;
    }
    if (key == 'ø') {
        fourSnake.moveRight = false;
    }
    if (key == 'l') {
        fourSnake.moveLeft = false;
    }
    
}
