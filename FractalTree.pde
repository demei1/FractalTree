private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
public void setup() 
{   
  size(800,800);    
  noLoop(); 
} 
public void draw() 
{   
  background(0);   
  stroke(0,255,0);   
  drawRoot(width/2, height, 140);
  drawBranches(400,400,100,3*Math.PI/2);  //will add later 
} 
public void drawRoot(int x, int y, double rootLength) {
  
  rootLength = rootLength * fractionLength;
  int endY = (int)(y - rootLength);
  strokeWeight((float)(2 * Math.sqrt(rootLength)));
  
  int colorFactor = (int) ((height - y) / (double) height * 100);
  
  stroke(120 + colorFactor, 75 + colorFactor, 20);
  line(x, y, x, (float) endY);
  
  if (rootLength > 10) {
    drawRoot(x, endY, rootLength);
  }
}

public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  //your code here   
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength = branchLength * fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  strokeWeight(2);
  
  
  int colorFactor = (int)((height - y)/(double) height * 50);
  
  stroke(15 + colorFactor, 100 + colorFactor, 65);
  
  line(x,y, endX1, endY1);
  line(x,y, endX2, endY2);
  if (branchLength > smallestBranch){
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
}
