void setup() {
    size(640, 360); 
}

void draw() {
    background(51); 
    fill(255, 204);
    
    float startingY = 100;
    float startingX = 100;
    float speed = 0.8;
    float currentY = startingY + frameCount * speed;
    
    if (currentY >= height) {
        // if the ball reached the bottom of the screen we stop it there.
        // from then on the y coordinate always stays the same.
        currentY = height;
    }
    
    // draw the ball at the computed y coordinate
    float ballRadius = 50;
    circle(startingX, currentY, ballRadius);
}