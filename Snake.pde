class Snake {
    float posX, posY;
    float velocityX, velocityY;
    float diameter = 15;

    boolean moveUp = false;
    boolean moveDown = false;
    boolean moveRight = false;
    boolean moveLeft = false;

    boolean death = false;

    ArrayList<SnakeBodyPart> snakeBodyPartList = new ArrayList<SnakeBodyPart>();


    void move() {
        //death on the sides
        if (posX > width-35) {
            death = true;
        }
        if (posX < 10) {
            death = true;
        }
        if (posY  > height -20) {
            death = true;
        }
        if (posY < 57) {
            death = true;
        }
        if (death == false) {
            if (moveUp) {
                velocityY = -15;
                velocityX = 0;
            }
            if (moveDown) {
                velocityY = 15;
                velocityX = 0;
            }
            if (moveRight) {
                velocityX = 15;
                velocityY = 0;
            }
            if (moveLeft) {
                velocityX = -15;
                velocityY = 0;
            }
                                    //Detect the color in front of snake. if it's not black; die.
          
            if(get(int(posX+velocityX+7),int(posY+velocityY+7)) == color(0)){     
           }else{
               death = true;
           }

            posX = posX + velocityX;
            posY = posY + velocityY;
            addBodyPart();
        }
    }

    void display() {


        rect(posX, posY, diameter, diameter);

        for (int i = 0; i < snakeBodyPartList.size(); i = i + 1) {
            snakeBodyPartList.get(i).display();
        }
    }

    void addBodyPart() {
        snakeBodyPartList.add (new SnakeBodyPart(posX, posY));
    
    }
}
