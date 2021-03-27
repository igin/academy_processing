void setup() {
    size(640, 360); 
}

void draw() {
    background(51); 
    fill(255, 204);
    
    // move the origin to the bottom center
    translate(width * 0.5, height);
    
    //draw white lines
    stroke(100);
    strokeWeight(5);
    
    //draw a tree with the specified recursion depth
    drawTree(12);
}

// draws a tree recursively with the specified recursion depth
void drawTree(int depth) {
    
    if (depth == 0) {
        // if the recursion depth is zero we stop going deeper and only draw a leaf
        drawLeaf();
    } else {
        // if the recursion depth is not zero we draw a branch and recurse deeper
        drawTrunkWithTrees(depth - 1);
    }
}

void drawLeaf() {
    circle(0, 0, 20);
}

void drawTrunkWithTrees(int depth) {
    // change the angle of the left branch with the frameCount for animation
    float animationSpeed = 0.01;                                // this factor defines how quickly the angle changes
    float maximumAngleOffset = 20;                              // this defines the maxium angle offset
    // the sinus is used to convert the ever growing framecount to a number that changes between -1 and 1
    float angleOffset = sin(frameCount * animationSpeed) * maximumAngleOffset; 
    float leftSubTreeAngle = radians(45.0 + angleOffset);
    
    // now draw the tree as before but use the animated angle
    float trunkLength = 100;
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

