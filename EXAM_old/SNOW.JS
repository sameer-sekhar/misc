function start_movement()
 {
	setInterval("snowfall1()",5);
	setInterval("snowfall2()",20);
	setInterval("snowfall3()",70);
}

function snowfall1()
{
	
	s3.style.top=parseInt(s3.style.top)+1;
	s5.style.top=parseInt(s5.style.top)+1;

	s9.style.top=parseInt(s9.style.top)+1;
	s12.style.top=parseInt(s12.style.top)+1;
	s13.style.top=parseInt(s13.style.top)+1;
	s14.style.top=parseInt(s14.style.top)+1;
	
	s18.style.top=parseInt(s18.style.top)+1;
	
	if(parseInt(s3.style.top)>400)
		s3.style.top=-10;
	if(parseInt(s5.style.top)>400)
		s5.style.top=-5;
	
	if(parseInt(s9.style.top)>400)
		s9.style.top=-10;
	if(parseInt(s12.style.top)>400)
		s12.style.top=-5;
	if(parseInt(s14.style.top)>400)
		s14.style.top=-10;
	
	if(parseInt(s18.style.top)>400)
		s18.style.top=-5;
	if(parseInt(s13.style.top)>400)
		s13.style.top=-10;
}

function snowfall2()
{
	s02.style.top=parseInt(s02.style.top)+1;
	
	s6.style.top=parseInt(s6.style.top)+1;
	s8.style.top=parseInt(s8.style.top)+1;
	
	s11.style.top=parseInt(s11.style.top)+1;
	s15.style.top=parseInt(s15.style.top)+1;
	s17.style.top=parseInt(s17.style.top)+1;

	
	if(parseInt(s02.style.top)>400)
		s02.style.top=-10;
	
	if(parseInt(s6.style.top)>400)
		s6.style.top=-5;
	if(parseInt(s8.style.top)>400)
		s8.style.top=-10;
	
	if(parseInt(s11.style.top)>400)
		s11.style.top=-5;
	if(parseInt(s15.style.top)>400)
		s15.style.top=-10;
	if(parseInt(s17.style.top)>400)
		s17.style.top=-5;
	


}

function snowfall3()
{
	s01.style.top=parseInt(s01.style.top)+1;	
	s4.style.top=parseInt(s4.style.top)+1;
	s7.style.top=parseInt(s7.style.top)+1;
	s10.style.top=parseInt(s10.style.top)+1;	
	s16.style.top=parseInt(s16.style.top)+1;
	s19.style.top=parseInt(s19.style.top)+1;

	if(parseInt(s01.style.top)>400)
		s01.style.top=-10;	
	if(parseInt(s4.style.top)>400)
		s4.style.top=-5;
	if(parseInt(s7.style.top)>400)
		s7.style.top=-10;
	if(parseInt(s10.style.top)>400)
		s10.style.top=-5;
	if(parseInt(s16.style.top)>400)
		s16.style.top=-10;
	if(parseInt(s19.style.top)>400)
		s19.style.top=-5;
	
}
