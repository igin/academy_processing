void setup() {
    size(640, 360); 
}

void draw() {
    background(51); 
    fill(255, 204);
    
    translate(width * 0.5, height);
    
    stroke(100);
    strokeWeight(5);
    
    drawTree(12);
}

// draws a tree recursively with the specified recursion depth
void drawTree(int depth) {
    
    if (depth == 0) {
        drawLeaf();
    } else {
        drawTrunkWithTrees(depth - 1);
    }
}

void drawLeaf() {
    // we want to make this leaf fall straight down.
    // this means we want to move the y coordinate in the original coordinate system to 0.
    // the problem is that first have to know whats the x and y coordinate of the leaf in the original coordinate system.
    // we can do that by using the screenX and screenY functions. they convert coordinates
    // in the current coordinate system to coordinates in the original screen coordinate system.
    // since the leaf coordinates in the current system are 0, 0 we convert these coordinates to screen and use them to draw in the original coordinate system.
    
    float screenLeafX = screenX(0, 0);
    float screenLeafY = screenY(0, 0);
    
    // now that we are in screen coordinates we can animate the y coordinate exactly as we did with the ball
    float fallingSpeed = 0.5;
    screenLeafY = screenLeafY + fallingSpeed * frameCount;
    
    // we check if we reached the bottom of the screen and stop there
    if (screenLeafY > height) {
        screenLeafY = height;
    }
    
    // save the coordinate system and reset to the screen coordinate system
    pushMatrix();
    resetMatrix();
    
    circle(screenLeafX, screenLeafY, 10);
    
    popMatrix();
}

void drawTrunkWithTrees(int depth) {
    float trunkLength = 100;
    float leftSubTreeAngle = radians(45.0);
    float rightSubTreeAngle = radians(30.0);
    float scaleDownFactor = 0.7;
    
    line(0, 0, 0, - trunkLength);
    
    pushMatrix();
    
    translate(0, - trunkLength);
    
    scale(scaleDownFactor);
    
    pushMatrix();
    rotate(- leftSubTreeAngle);
    drawTree(depth - 1);
    popMatrix();
    
    pushMatrix();
    rotate(rightSubTreeAngle);
    drawTree(depth - 1);    
    popMatrix();
    
    popMatrix();
}

