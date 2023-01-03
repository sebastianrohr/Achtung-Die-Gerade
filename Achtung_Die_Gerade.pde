//Press Cmd + Shift + R To Start//


import processing.sound.*;
SoundFile startFile;
SoundFile victoryFile;
boolean isStartFileLooping = false;
boolean isVictoryFileLooping = false;

int gameState = 0;
int colorStart = 0;
int farveTekst = 0;
int timerStart;
PFont font;
PFont font2; //æøå font
int oneSnakeScore = 0;
int twoSnakeScore = 0;
int threeSnakeScore = 0;
int fourSnakeScore = 0;
int endTime;
int numPlayers = 2;

Snake oneSnake;
Snake twoSnake;
Snake threeSnake;
Snake fourSnake;

void setup() {
    size(800, 600);
    background(0);
    frameRate(15);
    startFile = new SoundFile(this, "start.mp3");
    victoryFile = new SoundFile (this, "victory.mp3");
}

void draw() {
    if (gameState == 0) {
        gameStart();
    }
    if (gameState == 9) {
        resetScore();
    }
    if (gameState == 10) {
        gameControls();
    }   
    if (gameState == 18) {
        gameSetup();
    }
    if (gameState == 20) {
        gamePlay();
    }
    if (gameState == 26) {
        restartTimerFour();
    }
    if (gameState == 27) {
        restartTimerThree();
    }
    if (gameState == 28) {
        restartTimerTwo();
    }
    if (gameState == 29) {
        restartTimerOne();
    }
    if (gameState == 30) {
        gameEndOne();
    }
    if (gameState == 31) {
        gameEndTwo();
    }
    if (gameState == 32) {
        gameEndThree();
    }
    if (gameState == 33) {
        gameEndFour();
    }
}
void gameStart() {
    background(0);
    font = createFont("font.ttf", 50);
    font2 = createFont("uni0553-webfont.ttf", 20);

    textSize(60);
    textAlign(CENTER);
    fill(255);
    textFont(font);
    text("ACHTUNG DIE GERADE", width/2, height/2.75);

    fill(farveTekst);
    textSize(25);
    textAlign(CENTER);
    text("Press Space To Continue", width/2, height/1.25);

    //blink
    colorStart = colorStart +12;
    if (colorStart >= 255) {
        colorStart = 0;
    }
    if (colorStart < 127.5) {
        farveTekst = 255;
    }    
    if (colorStart > 127.5) {
        farveTekst = 0;
    }
}

void resetScore() {

    oneSnakeScore = 0;
    twoSnakeScore = 0;
    threeSnakeScore = 0;
    fourSnakeScore = 0;

    gameState = 10;
}

void gameControls() {
    background(0);
    textSize(20);
    textAlign(LEFT);

    if (key == ('2')) {
        numPlayers = 2;
    }
    if (key == ('3')) {
        numPlayers = 3;
    }
    if (key == ('4')) {
        numPlayers = 4;
    }

    fill(0, 0, 255);
    text("Player 2 controls", 25, height/4.5);
    text("wasd", 25, height/3.95);

    if (numPlayers>2) {
        fill(0, 255, 0);
        text("Player 3 controls", 25, height/2.25);
        text("yghj", 25, height/2.1);
    }


    textAlign(RIGHT);
    fill(255, 0, 0);
    text("Player 1 controls", width-25, height/2.25);
    text("ARROW KEYS", width-25, height/2.1);
    if (numPlayers>3) {
        fill(255, 255, 0);
        text("Player 4 controls", width-25, height/4.5);
        textFont(font2);
        text("PLÆØ", width-25, height/3.95);
    }

    fill(255);
    textFont(font);
    textAlign(CENTER);
    textSize(17.5);
    text("Press '2' for 2 player", width/2, height/2-250);
    text("Press '3' for 3 player", width/2, height/2-225);
    text("Press '4' for 4 player", width/2, height/2-200);
    fill(farveTekst);
    textSize(25);
    text("Press Space To Continue", width/2, height/1.25);

    colorStart = colorStart +12;
    if (colorStart >= 255) {
        colorStart = 0;
    }
    if (colorStart < 127.5) {
        farveTekst = 255;
    }    
    if (colorStart > 127.5) {
        farveTekst = 0;
    }
}

void gameSetup() {
    timerStart = millis();
    oneSnake = new Snake();
    twoSnake = new Snake();
    if (numPlayers>2) {
        threeSnake = new Snake();
    }
    fourSnake = new Snake();
    oneSnake.death = false;
    twoSnake.death = false;
    if (numPlayers>2) {
        threeSnake.death = false;
    }
    if (numPlayers>3) {
        fourSnake.death = false;
        fourSnake.posX = width/2*1.5-30;
        fourSnake.posY = height/3.33+30;
    }
    if (numPlayers>2) {
        threeSnake.posX = 210;
        threeSnake.posY = height/2*1.5-30;
    }
    twoSnake.posX = 210;
    twoSnake.posY = height/3.33+30;
    oneSnake.posX = width/2*1.5-30;
    oneSnake.posY = height/2*1.5-30;
    oneSnake.velocityX = -15;
    twoSnake.velocityX = 15;
    if (numPlayers>2) {
        threeSnake.velocityY = -15;
    }
    if (numPlayers>3) {
        fourSnake.velocityY = 15;
    }
    startFile.play();

    gameState = 20;
}

void gamePlay() {
    background(0);
    fill(255, 0, 0);
    oneSnake.display();
    fill(0, 0, 255);
    twoSnake.display();
    fill(0, 255, 0);
    if (numPlayers>2) {
        threeSnake.display();
    }
    fill(255, 255, 0);
    if (numPlayers>3) {
        fourSnake.display();
    }

    //grid
    stroke(75);
    int i;
    for (i = 15; i < width - 15; i = i + 15)
        line(i, 60, i, height - 15); //y streger
    for (i = 60; i < height + 15; i = i + 15)
        line(15, i, width-20, i); //x streger

    //outline
    stroke(236, 100, 255);
    line(15, height-15, 15, 60); // left line
    line(15, 60, width-20, 60); // top line
    line(width-20, 60, width-20, height-15); // right line
    line(width-20, height-15, 15, height-15); // bottom line

    //timer
    fill(255);
    textSize(35);
    int elapsedTimeSinceTimerStart = millis() - timerStart;
    int elapsedTimeInSeconds = floor(elapsedTimeSinceTimerStart/1000) - 3;
    text(elapsedTimeInSeconds, width/1.1, 35);

    if (elapsedTimeInSeconds < 0) {
        noStroke();
        fill(0);
        rect(width/1.1-1, 20, 15, 30);
        fill(255);
        textSize(14);
        text("Starting In:", 625, 30);
    }

    //freezetime && kill when dead
    if (elapsedTimeInSeconds > -1) {
        if (oneSnake.death == false) {
            oneSnake.move();
        }
        if (twoSnake.death == false) {
            twoSnake.move();
        }
        if (numPlayers>2) {
            if (threeSnake.death == false) {
                threeSnake.move();
            }
        }
        if (numPlayers>3) {
            if (fourSnake.death == false) {
                fourSnake.move();
            }
        }
    }  

    // sorry for being a cheeky lad
    noStroke();
    fill(0);
    rect(0, 0, 15, height); // left
    rect(15, 45, width, 15); // top
    rect(width-19, 0, 20, height); // right
    rect(15, height-14, width, 15); // bottom
    fill(255);

    //Scoreboard
    textSize(20);
    textAlign(LEFT);
    fill(255, 0, 0);
    text("Player 1:", 50, 30);
    text(oneSnakeScore, 90, 50);
    fill(0, 0, 255);
    text("Player 2:", 200, 30);
    text(twoSnakeScore, 240, 50);
    fill(0, 255, 0);
    if (numPlayers>2) {
        text("Player 3:", 350, 30);
        text(threeSnakeScore, 390, 50);
    }
    fill(255, 255, 0);
    if (numPlayers>3) {
        text("Player 4:", 500, 30);
        text(fourSnakeScore, 540, 50);
    }


    if (numPlayers>3) {
        if (twoSnake.death == true && threeSnake.death == true && fourSnake.death == true) {
            oneSnakeScore = oneSnakeScore +1;
            gameState = 18;
        }
        if (oneSnake.death == true && threeSnake.death == true && fourSnake.death == true) {
            twoSnakeScore = twoSnakeScore +1;
            gameState = 18;
        }
        if (twoSnake.death == true && oneSnake.death == true && fourSnake.death == true) {
            threeSnakeScore = threeSnakeScore +1;  
            gameState = 18;
        }
        if (twoSnake.death == true && threeSnake.death == true && oneSnake.death == true) {
            fourSnakeScore = fourSnakeScore +1;   
            gameState = 18;
        }
    }
    if (numPlayers>2 && numPlayers<4) {
        if (twoSnake.death == true && threeSnake.death == true) {
            oneSnakeScore = oneSnakeScore +1;
            gameState = 18;
        }
        if (oneSnake.death == true && threeSnake.death == true) {
            twoSnakeScore = twoSnakeScore +1;
            gameState = 18;
        }
        if (twoSnake.death == true && oneSnake.death == true) {
            threeSnakeScore = threeSnakeScore +1;  
            gameState = 18;
        }
    }
    if (numPlayers>1 && numPlayers<3) {
        if (twoSnake.death == true) {
            oneSnakeScore = oneSnakeScore +1;
            gameState = 18;
        }
        if (oneSnake.death == true) {
            twoSnakeScore = twoSnakeScore +1;
            gameState = 18;
        }
    }
    if (oneSnakeScore == 5) {
        gameState = 29;
    }
    if (twoSnakeScore == 5) {
        gameState = 28;
    }
    if (threeSnakeScore == 5) {
        gameState = 27;
    }
    if (fourSnakeScore == 5) {
        gameState = 26;
    }
}



void restartTimerOne() {
    victoryFile.play();
    endTime = millis();
    gameState = 30;
}
void restartTimerTwo() {
    victoryFile.play();
    endTime = millis();
    gameState = 31;
}
void restartTimerThree() {
    victoryFile.play();
    endTime = millis();
    gameState = 32;
}
void restartTimerFour() {
    victoryFile.play();
    endTime = millis();
    gameState = 33;
}

void gameEndOne() {
    background(0);
    textAlign(CENTER);
    textSize(50);
    fill(255);
    text("The Winner Is", width/2, height/2.5);
    fill(255, 0, 0);
    text("Player 1", width/2, height/2);
    textSize(20);
    textAlign(LEFT);
    fill(255, 0, 0);
    text("Player 1:", 50, 30);
    text(oneSnakeScore, 90, 50);
    fill(0, 0, 255);
    text("Player 2:", 200, 30);
    text(twoSnakeScore, 240, 50);
    if (numPlayers>2) {
        fill(0, 255, 0);
        text("Player 3:", 350, 30);
        text(threeSnakeScore, 390, 50);
    }
    if (numPlayers>3) {
        fill(255, 255, 0);
        text("Player 4:", 500, 30);
        text(fourSnakeScore, 540, 50);
    }
    if (millis() > endTime + 3000) {
        textSize(25);
        textAlign(CENTER);
        fill(255);
        text("Press Space To Go To Main Menu", width/2, height/1.25);
        if (keyPressed) {
            gameState = 9;
        }
    }
}


void gameEndTwo() {
    background(0);
    textAlign(CENTER);
    textSize(50);
    fill(255);
    text("The Winner Is", width/2, height/2.5);
    fill(0, 0, 255);
    text("Player 2", width/2, height/2);
    textSize(20);
    textAlign(LEFT);
    fill(255, 0, 0);
    text("Player 1:", 50, 30);
    text(oneSnakeScore, 90, 50);
    fill(0, 0, 255);
    text("Player 2:", 200, 30);
    text(twoSnakeScore, 240, 50);
    if (numPlayers>2) {
        fill(0, 255, 0);
        text("Player 3:", 350, 30);
        text(threeSnakeScore, 390, 50);
    }
    if (numPlayers>3) {
        fill(255, 255, 0);
        text("Player 4:", 500, 30);
        text(fourSnakeScore, 540, 50);
    }
    if (millis() > endTime + 3000) {
        textSize(25);
        textAlign(CENTER);
        fill(255);
        text("Press Space To Go To Main Menu", width/2, height/1.25);
        if (keyPressed) {
            gameState = 9;
        }
    }
}
void gameEndThree() {
    background(0);
    textAlign(CENTER);
    textSize(50);
    fill(255);
    text("The Winner Is", width/2, height/2.5);
    fill(0, 255, 0);
    text("Player 3", width/2, height/2);
    textSize(20);
    textAlign(LEFT);
    fill(255, 0, 0);
    text("Player 1:", 50, 30);
    text(oneSnakeScore, 90, 50);
    fill(0, 0, 255);
    text("Player 2:", 200, 30);
    text(twoSnakeScore, 240, 50);
    if (numPlayers>2) {
        fill(0, 255, 0);
        text("Player 3:", 350, 30);
        text(threeSnakeScore, 390, 50);
    }
    if (numPlayers>3) {
        fill(255, 255, 0);
        text("Player 4:", 500, 30);
        text(fourSnakeScore, 540, 50);
    }
    if (millis() > endTime + 3000) {
        textSize(25);
        textAlign(CENTER);
        fill(255);
        text("Press Space To Go To Main Menu", width/2, height/1.25);
        if (keyPressed) {
            gameState = 9;
        }
    }
}
void gameEndFour() {    
    background(0);
    textAlign(CENTER);
    textSize(50);
    fill(255);
    text("The Winner Is", width/2, height/2.5);
    fill(255, 255, 0);
    text("Player 4", width/2, height/2);
    textSize(20);
    textAlign(LEFT);
    fill(255, 0, 0);
    text("Player 1:", 50, 30);
    text(oneSnakeScore, 90, 50);
    fill(0, 0, 255);
    text("Player 2:", 200, 30);
    text(twoSnakeScore, 240, 50);
    if (numPlayers>2) {
        fill(0, 255, 0);
        text("Player 3:", 350, 30);
        text(threeSnakeScore, 390, 50);
    }
    if (numPlayers>3) {
        fill(255, 255, 0);
        text("Player 4:", 500, 30);
        text(fourSnakeScore, 540, 50);
    }
    if (millis() > endTime + 3000) {
        textSize(25);
        textAlign(CENTER);
        fill(255);
        text("Press Space To Go To Main Menu", width/2, height/1.25);
        if (keyPressed) {
            gameState = 9;
        }
    }
}
