var i=0;
var p=0;
var a;

function Main()
{	
	setInterval("idimage()",100);
}



function idimage()
{
   
   if (ban.width==200){p=1;}
   if (ban.width==0){p=0;}
   if(p==0)
   {
	ban.height+=5;
	ban.width+=10;
   }
   if(p==1)
   {
	ban.height-=5;
	ban.width-=10;
   }
   
}