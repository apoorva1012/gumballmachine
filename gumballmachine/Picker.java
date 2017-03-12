import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)

/**
 * Write a description of class Picker here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class Picker extends Alien
{
    Message pickerMessage = new Message();
    
    public void pickGumball(){
    Coin coin = getWorldOfType(GumballWorld.class).coinState;
    pickerMessage.setText("I'll pick the ball");
    if(coin==null){
        pickerMessage.setText("Please insert a coun first");
        getWorldOfType(GumballWorld.class).addObject(pickerMessage, 650, 120);
    }
    
    getWorldOfType(GumballWorld.class).coinState = null;
}
    
    /**
     * Act - do whatever the Picker wants to do. This method is called whenever
     * the 'Act' or 'Run' button gets pressed in the environment.
     */
    public void act() 
    {
        // Add your action code here.
    }    
    
}
