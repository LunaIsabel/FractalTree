private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2; 

public void setup() 
{   
	size(900,900);    
} 
public void draw() 
{   
	background(255, 255, 255);   
	stroke(0);
	line(420,480,420,580);   
	branchAngle = mouseY / (280 / .5);
	drawBranches(420, 480, 130, 3 * Math.PI / 2);
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	//your code here  
	double angle1 = angle + branchAngle + (mouseX - 520) / (320 / .05);
	double angle2 =  angle - branchAngle + (mouseX - 520) / (320 / .05);
	branchLength *= fractionLength;

	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);

	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);

	branchAngle = (Math.random() * .5);
	fractionLength = (Math.random()* .09) + .8;
	//recursion
	double a = (Math.random() * 250) - 0;
	double b = (Math.random() * 250) - 0;
	double c = (Math.random() * 250) - 0; 
	if(branchLength > smallestBranch){
		fill((float)a,(float)b,(float) c);
		drawBranches(endX1, endY1, branchLength, angle1);
		drawBranches(endX2, endY2, branchLength, angle2);
	}

} 
