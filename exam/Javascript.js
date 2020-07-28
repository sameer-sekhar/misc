var p=0;
var q=0;
var i=0;
var a=0;
var b=0;
var m=0;
var n=0;

function moveheart()
 {
	setInterval("movement()",200);
}

function movement()
{
	if(i==2)
	{
		i=0;
		marque.style.color="red";i++;
	}
	else
	{
		marque.style.color="#000000";i++;
	}

	if(parseInt(divheart1.style.top)+10>400)
		p=0;
	else if(parseInt(divheart1.style.top)-10<0)
		p=1;

	if (parseInt(divheart1.style.left)+10>650)
		q=0;
	else if(parseInt(divheart1.style.left)-10<0)
		q=1;
	
	if(p==0)
		divheart1.style.top=parseInt(divheart1.style.top)-10;
	else 
		divheart1.style.top=parseInt(divheart1.style.top)+10;

	if(q==0)
		divheart1.style.left=parseInt(divheart1.style.left)-10;
	else 
		divheart1.style.left=parseInt(divheart1.style.left)+10;



	if(parseInt(divheart2.style.top)+10>450)
		m=0;
	else if(parseInt(divheart2.style.top)-10<0)
		m=1;

	if (parseInt(divheart2.style.left)+10>500)
		n=0;
	else if(parseInt(divheart2.style.left)-10<0)
		n=1;
	
	if(m==0)
		divheart2.style.top=parseInt(divheart2.style.top)-10;
	else 
		divheart2.style.top=parseInt(divheart2.style.top)+10;

	if(n==0)
		divheart2.style.left=parseInt(divheart2.style.left)-10;
	else 
		divheart2.style.left=parseInt(divheart2.style.left)+10;



	if(parseInt(divheart3.style.top)+10>400)
		a=0;
	else if(parseInt(divheart3.style.top)-10<0)
		a=1;

	if (parseInt(divheart3.style.left)+10>600)
		b=0;
	else if(parseInt(divheart3.style.left)-10<0)
		b=1;
	
	if(a==0)
		divheart3.style.top=parseInt(divheart3.style.top)-10;
	else 
		divheart3.style.top=parseInt(divheart3.style.top)+10;

	if(b==0)
		divheart3.style.left=parseInt(divheart3.style.left)-10;
	else 
		divheart3.style.left=parseInt(divheart3.style.left)+10;

	
	if(parseInt(divheart4.style.top)+10>800)
		a=0;
	else if(parseInt(divheart4.style.top)-10<0)
		a=1;

	if (parseInt(divheart4.style.left)+10>750)
		b=0;
	else if(parseInt(divheart4.style.left)-10<0)
		b=1;
	
	if(a==0)
		divheart4.style.top=parseInt(divheart4.style.top)-10;
	else 
		divheart4.style.top=parseInt(divheart4.style.top)+10;

	if(b==0)
		divheart4.style.left=parseInt(divheart4.style.left)-10;
	else 
		divheart4.style.left=parseInt(divheart4.style.left)+10;
}

function hover()
{
	h1head.style.color="#aa0bff";
}
function hoveroff()
{
	h1head.style.color="#000000";
}

function flame(f)
{
var p=f.name1.value.toUpperCase();
var q=f.name2.value.toUpperCase();
var str="";
n1=new Array(50);
n2=new Array(50);
n3=new Array(50);
var x=0;
var k=0;
var l=0;
for(i=0;i<p.length;i++)
{
   if(x==0)
    {
	for(j=0;j<q.length;j++)
	{
	  n2[j]=q.substring(j,j+1);
	}
	x=1;
    }
    n1[i]=p.substring(i,i+1);
}

for(i=0;i<p.length;i++)
{
	for(j=0;j<q.length;j++)
	{
	  if(n1[i]==n2[j])
	   {
		n3[k]=n1[i];
		k=k+1;
	   }
	}
}

l=k;

for(i=0;i<k;i++)
{
	for(j=i+1;j<k;j++)
	{
	    if(n3[i]==" "){break;}
	    else{
		if(n3[i]==n3[j])
		    {
			n3[j]=" ";l=l-1;
		    }
		}
	}
}
 
if (l==0){f.name3.value="no common behaviours found";}
else if (l==1||l==11||l==14||l==24){f.name3.value="flame says that there may be enimity between the two";}
else if (l==2||l==12||l==16||l==20){f.name3.value="flame says that the two adore each other";}
else if (l==3||l==6||l==7||l==10||l==17||l==21||l==25){f.name3.value="flame says that there is a good chance of marriage between the two";}
else if (l==4||l==8||l==15||l==18||l==19||l==22){f.name3.value="flame says that the two can be nice friends";}
else {f.name3.value="flame says that love is in the air..! So what are you waiting for.....!!!";}
}

function set()
{
f.name1.value="";
f.name2.value="";
f.name3.value="";
}
