int quarterButtonX, quarterButtonY,crankButtonX, crankButtonY, 
buttonSize=35;

color buttonColor, buttonHoverColor;
boolean hoverOverQuarter = false, hoverOverCrank = false;

String ClickedOver = null;

int blackColor = color(0), grey = color(190), white = color(255);

GumballMachine gumballMachine;

int countOfGumballs;
String status = "Please insert a quarter";

void setup() 
{
  size(800, 600) ;
  background(255) ;
  smooth() ;
  strokeWeight(3);
  strokeCap(ROUND);
 
  // load font
  PFont font;
  font = loadFont("BookAntiqua-48.vlw");
  textFont(font, 32);
  
  //Instantiate a Gumball machine
  gumballMachine = new GumballMachine(5);
  countOfGumballs = 5;
  
  buttonColor =  white; 
  buttonHoverColor = grey;
  quarterButtonX = 75;
  quarterButtonY = 120;
  
  buttonColor =  white;
  buttonHoverColor = grey;
  crankButtonX = 150;
  crankButtonY = 120;
  
 //noLoop();
}

void draw() {
  
  update();
  text("The Gumball Machine", 250, 60);
  PImage image = loadImage("gumball.jpg");
  image(image, (width-image.width)/2, (height-image.height)/2);  
  
  String insertQuarterButtonHeading = "Insert Quarter";
  textSize(11);
  fill(blackColor);
  text(insertQuarterButtonHeading, quarterButtonX, quarterButtonY-28, 60, 90);
  
  String inventoryMessage = "Count of gumballs: ";
  textSize(11);
  fill(blackColor);
  text(inventoryMessage, 10, 10, 120, 80);
   
  fill(255);
  stroke(255);
  rect(140,10,120,80);
  stroke(blackColor); 
   
  textSize(11);
  fill(blackColor);
  text(countOfGumballs+"", 140 , 10, 120, 80);
  
  
  String statusMessage = "Inventory message: ";
  textSize(11);
  fill(blackColor);
  text(statusMessage, 10, 30, 120, 80);
  
  textSize(11);
  fill(blackColor);
  text(status, 140 , 30, 120, 80);
  
  
  String turnCrankButtonHeading = "Turn   Crank";
  textSize(11);
  fill(blackColor);
  text(turnCrankButtonHeading, crankButtonX, crankButtonY-28, 60, 70);
  

  //fill(white);
  
  if(!hoverOverQuarter) {
     fill(white);
     rect(quarterButtonX,quarterButtonY,buttonSize,buttonSize);
     rect(crankButtonX,crankButtonY,buttonSize,buttonSize);
  }
  else {
     fill(grey);
     rect(quarterButtonX,quarterButtonY,buttonSize,buttonSize);
     fill(white);
     rect(crankButtonX,crankButtonY,buttonSize,buttonSize);
  }
     
   if(hoverOverCrank){      
     fill(white);
     rect(quarterButtonX,quarterButtonY,buttonSize,buttonSize);
     fill(grey);
     rect(crankButtonX,crankButtonY,buttonSize,buttonSize);  
   }
   
   if(ClickedOver !=null){
     System.out.println("---------------"+gumballMachine+"---------------");
     System.out.println("actions:--");
     if(ClickedOver.equals("insertQuarterButton")) 
     { 
           gumballMachine.insertQuarter(); 
           fill(blackColor);
           rect(quarterButtonX,quarterButtonY,buttonSize,buttonSize);
     }
     if(ClickedOver.equals("turnCrankButton"))
     {
           gumballMachine.turnCrank();
           fill(blackColor);
           rect(crankButtonX,crankButtonY,buttonSize,buttonSize);
     }
   }
   ClickedOver = null;
 // runTest();
}

public void update()
{
      hoverOverCrank = false;
      hoverOverQuarter = false;
  
  if(hoverTrue(quarterButtonX,quarterButtonY,buttonSize,buttonSize))
  {
    hoverOverQuarter = true;
    hoverOverCrank = false;
  }  
  
  if(hoverTrue(crankButtonX,crankButtonY,buttonSize,buttonSize))
  {
    
     hoverOverCrank = true;
     hoverOverQuarter = false;
  }

}

boolean hoverTrue(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
        return true;
  } else {
    return false;
  }
}

void mousePressed() {
  if (hoverOverQuarter) {
    ClickedOver = "insertQuarterButton";
  }
  if (hoverOverCrank) {
    ClickedOver = "turnCrankButton";
  }
}



public void runTest() {
  GumballMachine gumballMachine = new GumballMachine(5);
  System.out.println("---------------"+gumballMachine+"----------------");
  System.out.println("actions:--"); //normal operation
  gumballMachine.insertQuarter();
  gumballMachine.turnCrank(); //(turn crank with dispense)
  
  System.out.println();
  
  System.out.println("---------------"+gumballMachine+"----------------");
  System.out.println("actions:--");//normal operation
  gumballMachine.insertQuarter();
  gumballMachine.turnCrank(); //(turn crank with dispense)
  
  System.out.println();
  
  System.out.println("---------------"+gumballMachine+"----------------");
  System.out.println("actions:--");//Directly turing crank
  gumballMachine.turnCrank(); //(turn crank with dispense)
  
  System.out.println();
  
  System.out.println("---------------"+gumballMachine+"---------------");
  System.out.println("actions:--");//Inseting two Quarters
  gumballMachine.insertQuarter();
  gumballMachine.insertQuarter();
  gumballMachine.turnCrank(); //(turn crank with dispense)
  
  System.out.println();
  
  System.out.println("---------------"+gumballMachine+"---------------");
  System.out.println("actions:--");//Turing crank twice
  gumballMachine.insertQuarter();
  gumballMachine.turnCrank(); //(turn crank 1)
  gumballMachine.turnCrank(); //(turn crank 2)
  
  System.out.println();
  
  System.out.println("---------------"+gumballMachine+"---------------");
  System.out.println("actions:--");//normal Operation
  gumballMachine.insertQuarter();
  gumballMachine.turnCrank(); //(turn crank with dispense)
  
  System.out.println();
  
  System.out.println("---------------"+gumballMachine+"---------------");
  System.out.println("actions:--");
  gumballMachine.insertQuarter(); 
  System.out.println();
  
  System.out.println("---------------"+gumballMachine+"---------------");
  System.out.println("actions:--");
  gumballMachine.turnCrank(); //(turn crank with dispense)
  System.out.println();
  
  System.out.println("---------------"+gumballMachine+"---------------");
  
}