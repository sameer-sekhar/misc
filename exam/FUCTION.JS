var i=0;
var j=0;
var k=51;
var x=0;
var r1,r2,r3,r4,r5;
var a=0;
var z=0;
function entry(s)
{alert(b);
	//var s="";
	//s=parseInt(b.substring(1,b.length));
	i=i+1;
	if(i>5)
	{ alert("You have already chosen five numbers");
	 i=5;
	}
	else
	{
	  switch(i)
	  {
		case 1:T1.value=s;break;
		case 2:T2.value=s;break;
		case 3:T3.value=s;break;
		case 4:T4.value=s;break;
		case 5:T5.value=s;break;
	   }
	}
}

function clear()
{
   if(z==0)
   {
	i=0;
	T1.value="";
	T2.value="";
	T3.value="";
	T4.value="";
	T5.value="";
    }
}

function play()
{
   if(z==0)
   {
	if(i<5)
	{
		alert("Your Five entries are not yet over");
	}
	else
	{
		r1=Math.ceil(Math.random()*51);
		r2=Math.ceil(Math.random()*51);
		r3=Math.ceil(Math.random()*51);
		r4=Math.ceil(Math.random()*51);
		r5=Math.ceil(Math.random()*51);
		a=setInterval("show()",50);
	}
	z=1;
    }
}

function show()
{
	j=j+1;
	k=k-1;
	if(j<=r1)
	{
	    t1.value=j;
	    if(j==r1)
	    {
		x=x+1;
	     }
	}
	if(k>=r2)
	{
	    t2.value=k;
	    if(k==r2)
	    {
		x=x+1;
	     }
	}
	if(j<=r3)
	{
	    t3.value=j;
	    if(j==r3)
	    {
		x=x+1;
	     }
	}
	if(k>=r4)
	{
	    t4.value=k;
	    if(k==r4)
	    {
		x=x+1;
	     }
	}
	if(j<=r5)
	{
	    t5.value=j;
	    if(j==r5)
	    {
		x=x+1;
	     }
	}
	if(x==5)
	{
		result();
		clearInterval(a);
	}
}

function result()
{
	if((T1.value==r1)&&(T2.value==r2)&&(T3.value==r3)&&(T4.value==r4)&&(T5.value==r5))
	{
		alert("BINGO!You HAve Won The JACKPOT");
	}
	else if(((T1.value==r1)&&(T2.value==r2)&&(T3.value==r3)&&(T4.value==r4))||((T2.value==r2)&&(T3.value==r3)&&(T4.value==r4)&&(T5.value==r5)))
{
	alert("Wow!YOu have Won Yourself A Free Tour To Goa");
}
else if(((T1.value==r1)&&(T2.value==r2)&&(T3.value==r3))||((T2.value==r2))&&((T3.value==r3)&&(T4.value==r4))||((T3.value==r3)&&(T4.value==r4)&&(T5.value==r5)))
{
	alert("Congrats! You Have Won A Free Gift Worth Rs5000");
}
else
{
alert("bad luck this time.But you have been registered for consolation prize draw");
}


}