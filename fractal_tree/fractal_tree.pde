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
    float trunkLength = 100;
    float leftSubTreeAngle = radians(45.0);
    float rightSubTreeAngle = radians(30.0);
    float scaleDownFactor = 0.7;
    
    // draw the trunk as a line (negative y coordinate so the tree points up)
    line(0, 0, 0, - trunkLength);
    
    // save the current transformation so we can get back to it later
    pushMatrix();
    
    // move the origin to the end of the trunk
    translate(0, - trunkLength);
    
    // scale down so the subtree trunks get a bit shorter than the original
    scale(scaleDownFactor);
    
    // origin is now at the end of the trunk. save this transformation so we can come back when drawing the second subtree
    pushMatrix();
    
    // rotate to the left for the left subtree
    rotate(- leftSubTreeAngle);
    
    // draw the left subtree with one less depth
    drawTree(depth - 1);
    
    // rotate back to the initial orientation and save that transformation again
    popMatrix();
    pushMatrix();
    
    // rotate to the right for the right subtree
    rotate(rightSubTreeAngle);
    
    // draw the right subtree with one less depth
    drawTree(depth - 1);
    
    // rotate back to the initial orientation
    popMatrix();
    
    // move back to the base of the trunk
    popMatrix();
}

