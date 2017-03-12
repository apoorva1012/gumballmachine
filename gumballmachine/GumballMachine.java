import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)

/**
 * Write a description of class GumballMachine here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class GumballMachine extends Actor
{

    public GumballMachine()
    {
        GreenfootImage image = getImage() ;
        image.scale( 350, 350) ; 
    }

    public void act() 
    {
        if (getWorldOfType(GumballWorld.class).coinState==null && Greenfoot.mouseClicked(this)){
            Message putCoin = new Message();
            putCoin.setText("Please insert a coin before turning the crank");
            getWorld().addObject(putCoin, 350, 180);
        }
        
        else if(getWorldOfType(GumballWorld.class).coinState!=null && Greenfoot.mouseClicked(this) ){           
        Coin coin = getWorldOfType(GumballWorld.class).coinState;
            turnCrank(coin);
        }
        
    } 
    
    private void turnCrank(Coin insertedCoin){
       
       //Choose a picker only when a coin is valid
       if(((Inspector)getWorld().getObjects(Inspector.class).get(0)).checkCoin()){
            Picker picker = ((Inspector)getWorld().getObjects(Inspector.class).get(0)).getPicker();
            if(picker !=null){
               picker.pickGumball(); 
            }
        }
    }
}
