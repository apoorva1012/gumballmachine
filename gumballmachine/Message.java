/**
 * Write a description of class Message here.
 *
 * @author Sucheta Mandal
 * @version 1.1
 */
import greenfoot.*;
import java.awt.Color;

public class Message extends Actor
{
    private String message;

    private void updateMessage()
    {
        setImage(new GreenfootImage(this.message, 20, greenfoot.Color.RED, greenfoot.Color.BLACK));
    }
    
    public void setText(String text){
      this.message = text;
      updateMessage();
    }
}
