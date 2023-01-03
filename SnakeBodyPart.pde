class SnakeBodyPart {
    float posX, posY;
    float diameter = 15;

    //constructor
    SnakeBodyPart(float x, float y) {
        posX = x;
        posY = y;
    }

    void display() {
        rect(posX, posY, diameter, diameter);
    }
}
