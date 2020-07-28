import java.applet.Applet;
import java.awt.*;

public class Wave4 extends Applet implements Runnable
{
   Thread t;
   boolean flag=false;
int p=0;
int j=1;
String msg="BEST OF LUCK";
Font f=new Font("comic sans ms",Font.BOLD,25);
Color c=new Color(255,255,255);
public void start()
{
t=new Thread(this);
flag=false;
t.start();
}

public void init()
{
setBackground(c);
setForeground(Color.red);
setFont(f);
}

public void stop()
{
flag=true;
t=null;
}

public void run()
{
for(; ; )
{
try{

	repaint();
	Thread.sleep(400);
	if(flag){break;}
    }
     catch(Exception e){}
}
}

public void paint(Graphics g)
{
String s1="";
if(j==0){p--;}
if(j==1){p++;}
for (int i=0;i<msg.length();i++)
{
	if (p==2){j=1;}
	if (p==0){j=0;}
	s1=msg.substring(i,i+1);
	g.drawString(s1,30+30*i,30+20*p);
	if (j==0){p++;}
	if (j==1){p--;}
}

}
}