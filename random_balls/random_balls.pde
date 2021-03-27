void setup() {
    size(640, 360); 
}

void draw() {
    background(51); 
    fill(255, 204);
    
    float startingY = 100;
    float startingX = 100;
    
    // compute the current position with a random offset
    float currentX = startingX + random(50);
    float currentY = startingY + random(50);
    
    // set the color randomly
    fill(random(255), random(255), random(255), 255);
    
    float ballRadius = 43;
    circle(currentX, currentY, ballRadius);
}