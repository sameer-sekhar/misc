import java.awt.*;
import java.applet.*;

public class LoveMeter extends Applet
{    
	public int startAngle = 190;
    	int endAngle = 0;
	Color c1=new Color(100,168,174);
	Color c2=new Color(0,0,0);

	public void init() 
	{
		setBackground(c2);
	}
    
	public void start() 
	{
		repaint();
	}
  
	public void paint(Graphics g)
	{
		Rectangle r = bounds();
		int hlines = r.height / 10;
		int vlines = r.width / 10;
		g.setColor(c1);
	
		
		g.setColor(c1);
		g.fillArc(0, 0, r.width - 1, r.height - 1, startAngle, endAngle);
		g.setColor(c2);
		
		g.drawLine(0, r.height / 2, r.width, r.height / 2);
		g.drawLine(r.width / 2, 0, r.width / 2, r.height);
		g.drawLine(0, 0, r.width, r.height);
		g.drawLine(r.width, 0, 0, r.height);
	}
   
	public void begin(String end) 
	{
		endAngle = Integer.parseInt(end);
		endAngle=(-2)*endAngle;
		repaint();
	}

	public void refresh(int v)
	{
		endAngle=v;
		repaint();
	}
}
