void setup() {
    size(640, 360); 
}

void draw() {
    background(51); 
    fill(255, 204);
    
    float startingY = 100;
    float startingX = 100;
    
    float animationSpeed = 0.05;
    
    // compute the current position with a random offset
    float randomX = noise(frameCount * animationSpeed);
    // to get a different number for the y coordinate we need to have a different input. thats why we add some number
    float randomY = noise(frameCount * animationSpeed + 42); 
    
    float currentX = startingX + randomX * 50;
    float currentY = startingY + randomY * 50;
    
    // set the color randomly
    float randomRed = noise(frameCount * animationSpeed);
    float randomGreen = noise(frameCount * animationSpeed + 123); // the numbers that we add don't matter. we just add something so its different from the others
    float randomBlue = noise(frameCount * animationSpeed + 32343);
    
    fill(randomRed * 255, randomGreen * 255, randomBlue * 255, 255);
    
    float ballRadius = 43;
    circle(currentX, currentY, ballRadius);
}