print"content-type:text/html\n\n";
read(stdin,$data,$ENV{'CONTENT_LENGTH'});
@info=split(/&/,$data);
for($i=0;@info[$i];$i++)
{
	($f,$v)=split(/=/,$info[$i]);
	$v=~tr/+/ /;
	$info[$i]=$v;
}

$subject=$info[3];

if ($subject eq "java" )
{
	print"<html><head><title>Module1-JAVA</title><SCRIPT LANGUAGE=\"javascript\">
var m=0\;
var x=3\;
var y=0\;
var msg=\"                              time left(minutes):-     \"\;
function showtime() 
{
  var now = new Date()\;
  var hours = now.getHours()\;
  var minutes = now.getMinutes()\;
  var seconds = now.getSeconds()\;
  
  var timeValue = \"\" + ((hours >12) \? hours -12 :hours)\;
  timeValue += ((minutes < 10) \? \":0\" : \":\") + minutes\;
  timeValue += ((seconds < 10) \? \":0\" : \":\") + seconds\;
  timeValue += (hours >= 12) ? \" P.M.\" : \" A.M.\"\;
  y++\;
if(y==60){y=0\;x--\;
  if(x==0){clearTimeout()\;alert(\"time ends\")\;alert(\"your marks is \"+m)\;document.forms[0].submit()\;}}
 window.status = timeValue + msg + x\;

  timerID = setTimeout(\"showtime()\",1000)\;
}
 
function sub(){alert(\"your marks is \"+m)\;document.forms[0].submit()\;}

function mark(){var k=0\;if(q1[1].checked) {k=k+1\;}if(q2[2].checked) {k=k+1\;}if(q3[3].checked) {k=k+1\;}if(q4[1].checked) {k=k+1\;}if(q5[2].checked) {k=k+1\;}if(q6[0].checked) {k=k+1\;}if(q7[3].checked) {k=k+1\;} if(q8[2].checked) {k=k+1\;}if(q9[0].checked) {k=k+1\;}
if(q10[2].checked) {k=k+1\;}m=k\;document.forms[0].mark2.value=m\;}

function newwind(){ a=window.open(\"inst.htm\" ,\"win11\",\"toolbar=no,menubar=no,statusbar=no,height=400,width=360,hotkeys=0,resizeable=no,scrollbars=yes,dependent=yes\")\;}</script>

<style type=\"text/css\">
	.text{font-family:Palatino Linotype;font-size:20pt;
		color:brown;
	      }
 	.set{font-family:MS Serif;font-size:15pt;
		color:green;
	      }
</style>

</head>

<body ondblclick=\"newwind()\" onLoad=\"showtime()\">

<form method=\"post\" action=\"marks.pl\" ><input type=hidden value=\"$info[0]\" name=\"nam2\"> <input type=hidden value=\"$info[1]\" name=\"uid2\"><input type=hidden value=$info[2] name=\"regno2\"><input type=hidden value=$info[3] name=\"sub2\"><input type=hidden value=\"\" name=\"mark2\"></form>



<span class=\"text\">
Q1.. When a class \'B\' is declared to be friend<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspof class \'A\' then , the members of class<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspA ( private  and  public ) are _____________<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp to class B .<br></span>
<span class=\"set\"style=\"position:absolute;left:60;top:220;\">	

a.<input type=radio name=q1 onclick=\"mark()\">not accessible<br><br>
b.<input type=radio name=q1 onclick=\"mark()\">accessible<br><br>
c.<input type=radio name=q1 onclick=\"mark()\">sometimes accessible<br><br>
d.<input type=radio name=q1 onclick=\"mark()\">none of the above
</span>

<span class=\"text\" style=\"position:absolute;top:450;\">
Q2.. The value of Y after executing the<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp following program segment is :</span>
<span class=\"set\"style=\"position:absolute;left:90;top:540;\">
float  a = 5 ;<br>float b = 2 ; <br>float Y ;<br>Y=a % b;<br><br><br>

a.<input type=radio name=q2 onclick=\"mark()\">0.0<br><br>
b.<input type=radio name=q2 onclick=\"mark()\">2.0<br><br>
c.<input type=radio name=q2 onclick=\"mark()\">1.0<br><br>
d.<input type=radio name=q2 onclick=\"mark()\">2.5
</span>

<span class=\"text\" style=\"position:absolute;top:850;\">
Q3..With z = 3 , x = 1 and y = 2 , the<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspcontent of x after executing the <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspfollowing statements is :<br></span>
<span class=\"set\"style=\"position:absolute;left:90;top:1000;\">
x = ( x < y && y > z ) ? 2 : 3<br><br>
<br>
a.<input type=radio name=q3 onclick=\"mark()\">0<br><br>
b.<input type=radio name=q3 onclick=\"mark()\">1<br><br>
c.<input type=radio name=q3 onclick=\"mark()\">2<br><br>
d.<input type=radio name=q3 onclick=\"mark()\">3
</span>

<span class=\"text\" style=\"position:absolute;top:1250;\">
Q4.. The value of y after executing <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp the code is :</span>
<span class=\"set\"style=\"position:absolute;left:90;top:1350;\">
int x = 0 ;<br>int y = 5 ;<br> if( x > 0 ) <br>y=2 ;<br>y++ ;

<br><br><br>
a.<input type=radio name=q4 onclick=\"mark()\">5<br><br>
b.<input type=radio name=q4 onclick=\"mark()\">6<br><br>
c.<input type=radio name=q4 onclick=\"mark()\">2<br><br>
d.<input type=radio name=q4 onclick=\"mark()\">3
</span>

<span class=\"text\" style=\"position:absolute;top:1750;\">
Q5.. The value of sum after the execution of loop is :<br></span>
<span class=\"set\"style=\"position:absolute;left:90;top:1850;\">
sum = 0 ;<br>for(int i = 2 ; i < 10 ; i++ ) ;<br>sum += i ;<br>
<br><br>

a.<input type=radio name=q5 onclick=\"mark()\">27<br><br>
b.<input type=radio name=q5 onclick=\"mark()\">35<br><br>
c.<input type=radio name=q5 onclick=\"mark()\">44<br><br>
d.<input type=radio name=q5 onclick=\"mark()\">55
</span>

<span class=\"text\" style=\"position:absolute;top:2200;\">
Q6.. Java treats multi-dimensional array as<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp\"array of arrays\" . This allows to create  <br></span>
<span class=\"set\"style=\"position:absolute;left:90;top:2300;\"><br>

a.<input type=radio name=q6 onclick=\"mark()\">A two dimensional array with same length for each row .<br><br>
b.<input type=radio name=q6 onclick=\"mark()\">A two dimensional array with different length for each row . <br><br>
c.<input type=radio name=q6 onclick=\"mark()\">Array of pointers<br><br>
d.<input type=radio name=q6 onclick=\"mark()\">None of the above
</span>


<span class=\"text\" style=\"position:absolute;top:2650;\">
Q7.. Protected Modifier attached to member<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp of a class : <br></span>
<span class=\"set\"style=\"position:absolute;left:90;top:2780;\"><br>

a.<input type=radio name=q7 onclick=\"mark()\">Allows to access it from any class in the same package .<br><br>
b.<input type=radio name=q7 onclick=\"mark()\">Allows to access it from any class outside the package . <br><br>
c.<input type=radio name=q7 onclick=\"mark()\">Allows to access it from a subclass outside the same package .<br><br>
d.<input type=radio name=q7 onclick=\"mark()\">( a )  &  ( c )
</span>

<span class=\"text\" style=\"position:absolute;top:3000;\">
Q8.. Which of the following is an illegal looping <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp construct ?</span>
<span class=\"set\"style=\"position:absolute;left:90;top:3120;\">

a.<input type=radio name=q8 onclick=\"mark()\">While( int i > 0 )<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp{ i++ ; other statements ;}<br><br>
b.<input type=radio name=q8 onclick=\"mark()\">for ( int i = 10 , int j = 0 ;i+j > 5 ; i = i - 2 , j++) <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp{ body statements }<br><br>
c.<input type=radio name=q8 onclick=\"mark()\">int i = 10 ;<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspwhile( i )<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp{ body statements }<br><br>
d.<input type=radio name=q8 onclick=\"mark()\">int i = 1 , sum = 0 ;<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspdo{ i++;loop statements }<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspwhile( sum < 10 || i < 5 );
</span>


<span class=\"text\" style=\"position:absolute;top:3650;\">
Q9.. In the following code snipplet , which lines of<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp code contains error ?<br></span>
<span class=\"set\"style=\"position:absolute;left:90;top:3760;\">
1.&nbsp&nbsp&nbsp&nbsp int j = 0 ;<br>2.&nbsp&nbsp&nbsp&nbspwhile( j < 10 ){<br>3.&nbsp&nbsp&nbsp&nbspj++ ;<br>4.&nbsp&nbsp&nbsp&nbspif( j == 5) continue;<br>5.&nbsp&nbsp&nbsp&nbspSystem.out.println( \" j is \" + j ) ; }<br><br><br>
a.<input type=radio name=q9 onclick=\"mark()\">line 2<br><br>
b.<input type=radio name=q9 onclick=\"mark()\">line 3 <br><br>
c.<input type=radio name=q9 onclick=\"mark()\">line 4<br><br>
d.<input type=radio name=q9 onclick=\"mark()\">line 5
</span>

<span class=\"text\" style=\"position:absolute;top:4050;\">
Q10.. What is wrong in the following class<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp defination ?<br></span>
<span class=\"set\"style=\"position:absolute;left:90;top:4160;\">
abstract class Print<br>{<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspabstract show( ) ;<br>}<br>class Display extends Print<br>{<br>}<br><br>
a.<input type=radio name=q10 onclick=\"mark()\">Nothing is wrong<br><br>
b.<input type=radio name=q10 onclick=\"mark()\">Wrong , Method show( ) should have a return type . <br><br>
c.<input type=radio name=q10 onclick=\"mark()\">Wrong , Method show( ) is not implemented in display .<br><br>
d.<input type=radio name=q10 onclick=\"mark()\">Wrong , Display does not contain any members
</span>

</body></html>
<div style=\"position:absolute;top:4500;left:300;\">
<input type=button value=\"Submit\" onclick=\"sub()\"></div></body></html>";

}
elsif($subject eq "oops")
{
print"<html>
<head><title>Question Paper on OOPS</title><SCRIPT LANGUAGE=\"javascript\">
var m=0\;
var x=3\;
var y=0\;
var msg=\"                              time left(in minutes):-     \"\;
function showtime() 
{
  var now = new Date()\;
  var hours = now.getHours()\;
  var minutes = now.getMinutes()\;
  var seconds = now.getSeconds()\;
  
  var timeValue = \"\" + ((hours >12) \? hours -12 :hours)
  timeValue += ((minutes < 10) \? \":0\" : \":\") + minutes
  timeValue += ((seconds < 10) \? \":0\" : \":\") + seconds
  timeValue += (hours >= 12) \? \" P.M.\" : \" A.M.\"
 
y++\;
if(y==60){y=0\;x--\;
  if(x==0){clearTimeout()\;alert(\"time ends\")\;document.forms[0].submit()\;}}
 window.status = timeValue + msg + x\;

  timerID = setTimeout(\"showtime()\",1000)\;
}
 
function sub(){alert(\"your marks is \"+m)\;document.forms[0].submit()\;}

function mark(){var k=0\;if(q1[1].checked) {k=k+1\;}if(q2[2].checked) {k=k+1\;}if(q3[3].checked) {k=k+1\;}if(q4[1].checked) {k=k+1\;}if(q5[2].checked) {k=k+1\;}if(q6[0].checked) {k=k+1\;}if(q7[3].checked) {k=k+1\;} if(q8[2].checked) {k=k+1\;}if(q9[0].checked) {k=k+1\;}
if(q10[2].checked) {k=k+1\;}m=k\;document.forms[0].mark2.value=m\;}

function newwind(){ a=window.open(\"inst.htm\" ,\"win11\",\"toolbar=no,menubar=no,statusbar=no,height=400,width=360,hotkeys=0,resizeable=no,scrollbars=yes,dependent=yes\")\;}</script>

<style type=\"text/css\">
	.text{font-family:Palatino Linotype;font-size:20pt;
		color:brown;
	      }
 	.set{font-family:MS Serif;font-size:15pt;
		color:green;
	      }
</style>
</head>
<body background=q.gif bgproperties=fixed ondblclick=\"newwind()\" onload=\"showtime()\">

<form method=\"post\" action=\"marks.pl\" ><input type=hidden value=\"$info[0]\" name=\"nam2\"> <input type=hidden value=\"$info[1]\" name=\"uid2\"><input type=hidden value=$info[2] name=\"regno2\"><input type=hidden value=$info[3] name=\"sub2\"><input type=hidden value=\"\" name=\"mark2\"></form>

<span class=\"text\">
Q1.. Output of this program is  :<br></span>
<span class=\"set\" style=\"position:absolute;left:90;top:70;\">	main()<br>
	{<br>	float a\;<br>
		int x=6 , y=4\;<br>
		a=x/y\;<br>
		printf(\"value of a =%f\",a)\;<br>
	}<br><br>

a.<input type=radio name=q1 value=1.0 onclick=\"mark()\">1.000000<br><br>
b.<input type=radio name=q1 value=1.50 onclick=\"mark()\">1.5000<br><br>
c.<input type=radio name=q1 value=1.5 onclick=\"mark()\">1.5<br><br>
d.<input type=radio name=q1 value=none onclick=\"mark()\">none
</span>

<span class=\"text\" style=\"position:absolute;top:420;\">
Q2.. Use of setdate function in c :<br></span>
<span class=\"set\" style=\"position:absolute;left:90;top:460;\"><br><br>

a.<input type=radio name=q2 onclick=\"mark()\">set dos date<br><br>
b.<input type=radio name=q2 onclick=\"mark()\">set system date<br><br>
c.<input type=radio name=q2 onclick=\"mark()\">a & b both<br><br>
d.<input type=radio name=q2 onclick=\"mark()\">none of the above
</span>

<span class=\"text\" style=\"position:absolute;top:730;\">
Q3.. Use of memory function is to :<br></span>
<span class=\"set\" style=\"position:absolute;left:90;top:780;\"><br><br>

a.<input type=radio name=q3 onclick=\"mark()\">copy a specified number of characters from one buffer to another<br><br>
b.<input type=radio name=q3 onclick=\"mark()\">copy number of characters from one string to another<br><br>
c.<input type=radio name=q3 onclick=\"mark()\">repalce string<br><br>
d.<input type=radio name=q3 onclick=\"mark()\">a & b both
</span>

<span class=\"text\" style=\"position:absolute;top:1050;\">
Q4.. Use of fp-off function is to :<br></span>
<span class=\"set\" style=\"position:absolute;left:90;top:1100;\"><br><br>

a.<input type=radio name=q4 onclick=\"mark()\">returns segment portion of a for pointer<br><br>
b.<input type=radio name=q4 onclick=\"mark()\">returns offset portion of a for pointer<br><br>
c.<input type=radio name=q4 onclick=\"mark()\">a & b both<br><br>
d.<input type=radio name=q4 onclick=\"mark()\">none of above
</span>

<span class=\"text\" style=\"position:absolute;top:1400;\">
Q5.. Reads a character from keyboard using :<br></span>
<span class=\"set\" style=\"position:absolute;left:90;top:1450;\"><br><br>

a.<input type=radio name=q5 onclick=\"mark()\">getch<br><br>
b.<input type=radio name=q5 onclick=\"mark()\">getchar<br><br>
c.<input type=radio name=q5 onclick=\"mark()\">getc<br><br>
d.<input type=radio name=q5 onclick=\"mark()\">a & b both
</span>

<span class=\"text\" style=\"position:absolute;top:1700\;\">
Q6.. gotoxy(int x , int y);<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspthe above function places the <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspcursor at ______________ .<br></span>
<span class=\"set\" style=\"position:absolute;left:90;top:1820;\"><br>

a.<input type=radio name=q6 onclick=\"mark()\">Column = x , Row = y<br><br>
b.<input type=radio name=q6 onclick=\"mark()\">Column = y , Row = x<br><br>
c.<input type=radio name=q6 onclick=\"mark()\">Column = x+y , Row = y<br><br>
d.<input type=radio name=q6 onclick=\"mark()\">Column = x , Row = y+x
</span>

<span class=\"text\" style=\"position:absolute;top:2040;\">
Q7.. What will be the output of the following piece of code when executed  ?</span>
<span class=\"set\" style=\"position:absolute;left:90;top:2150;\">
#include<iostream.h><br>
int main(void)<br>
{<br>
   int factor=5;<br>
   int product=1;<br>
do<br>
{<br>
    ++factor;<br>
     product*=factor;<br>
}  while(factor= =15);<br>

cout<<\"Product is \" <<product <<endl;<br>
return 0;<br>
}<br>
<br><br>

a.<input type=\"radio\" name=\"q7\"  onclick=\"mark()\"> Product is 3024 <br><br>
b.<input type=\"radio\" name=\"q7\"  onclick=\"mark()\">Product is 6<br><br>
c.<input type=\"radio\" name=\"q7\" onclick=\"mark()\">Will generate compile error<br><br>
d.<input type=\"radio\" name=\"q7\" onclick=\"mark()\">None of the above
</span>

<span class=\"text\" style=\"position:absolute;top:2650;\">
Q8.. Determine the output of the Program: </span>
<span class=\"set\" style=\"position:absolute;left:90;top:2750;\">
int diff(int x)  <br>
{  <br>
int s;  <br>
s- = diff(x-1);  <br>
 return (s); <br>
}  <br>
 void main() <br>
{  <br>
    int res= diff(s); <br>
     cout <<res ; <br>
} <br>

<br><br>
a.<input type=\"radio\" name=\"q8\"  onclick=\"mark()\">-15  <br><br>
b.<input type=\"radio\" name=\"q8\"  onclick=\"mark()\">0<br><br>
c.<input type=\"radio\" name=\"q8\"  onclick=\"mark()\">Compilation Error<br><br>
d.<input type=\"radio\" name=\"q8\"  onclick=\"mark()\">Stack Overflow
</span>

<span class=\"text\" style=\"position:absolute;top:3250;\">
Q9. &nbsp&nbsp&nbsp&nbsp&nbsp  Identify the error in the code </span>
<span class=\"set\" style=\"position:absolute;left:90;top:3350;\">
Class  X  <br>
{ <br>
int i ; <br>
public : <br>
int f()  const;  <br>
{  <br>
    &nbsp &nbsp return i++ ; <br>
} ; <br>
 <br> <br>


a.<input type=\"radio\" name=\"q9\"  onclick=\"mark()\">Member Functions  f( )  cannot  be  modified since<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp it doesnot have an access  level associated with it <br><br>
b.<input type=\"radio\" name=\"q9\" onclick=\"mark()\" >Member function f( ) must be static <br><br>
c.<input type=\"radio\" name=\"q9\" onclick=\"mark()\" > You cannot modify the integer since it doesnot have <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp an access level  associated with it<br><br>
d.<input type=\"radio\" name=\"q9\" onclick=\"mark()\" >f( ) is aconst and modifies the state of calling object.  
</span>

<span class=\"text\" style=\"position:absolute;top:3800;\">
Q10.. In a 16-bit word length machine ,  the <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp integer values lies between ___________________  .</span>
<span class=\"set\" style=\"position:absolute;left:90;top:3850;\"><br><br><br>
a.<input type=radio name=q10 onclick=\"mark()\"> - 327655  to 327656<br><br>
b.<input type=radio name=q10 onclick=\"mark()\"> - 32768  to  +32767<br><br>
c.<input type=radio name=q10 onclick=\"mark()\"> - 32767  to  +32767<br><br>
d.<input type=radio name=q10 onclick=\"mark()\"> - 32767  to  +32768
</span>

<div style=\"position:absolute;top:4100;left:300;\">
<input type=button value=\"Submit\" onclick=\"sub()\"></div></body></html>";


}
elsif($subject eq "oracle" )
{
print"<html>
<head><title>Question Paper on Oracle</title>
<SCRIPT LANGUAGE=\"javascript\">
var m=0\;
var x=3\;
var y=0\;
var msg=\"                                 time left(in minutes) :-    \"\;
function showtime()
{
 var now = new Date()\;
  var hours = now.getHours()\;
  var minutes = now.getMinutes()\;
  var seconds = now.getSeconds()\;

    var timeValue = \"\" + ((hours >12) \? hours -12 :hours)
  timeValue += ((minutes < 10) \? \":0\" : \":\") + minutes
  timeValue += ((seconds < 10) \? \":0\" : \":\") + seconds
  timeValue += (hours >= 12) \? \" P.M.\" : \" A.M.\"
 
y++\;
if(y==60){y=0\;x--\;
  if(x==0){clearTimeout()\;alert(\"time ends\")\;alert(\"your marks is \"+m)\;document.forms[0].submit()\;}}
 window.status = timeValue + msg + x\;

  timerID = setTimeout(\"showtime()\",1000)\;
}
 
function sub(){alert(\"your marks is \"+m)\;document.forms[0].submit()\;}

function mark(){var k=0\;if(q1[0].checked) {k=k+1\;}if(q2[2].checked) {k=k+1\;}if(q3[1].checked) {k=k+1\;}if(q4[3].checked) {k=k+1\;}if(q5[2].checked) {k=k+1\;}if(q6[2].checked) {k=k+1\;}if(q7[1].checked) {k=k+1\;} if(q8[2].checked) {k=k+1\;}if(q9[1].checked) {k=k+1\;}
if(q10[2].checked) {k=k+1\;}m=k\;document.forms[0].mark2.value=m\;}

function newwind(){ a=window.open(\"inst.htm\" ,\"win11\",\"toolbar=no,menubar=no,statusbar=no,height=400,width=360,hotkeys=0,resizeable=no,scrollbars=yes,dependent=yes\")\;}</script>





<style type=\"text/css\">
	.text{font-family:Palatino Linotype;font-size:20pt;
		color:brown;
	      }
 	.set{font-family:MS Serif;font-size:15pt;
		color:green;
	      }
</style>
</head>
<body background=q.gif bgproperties=fixed
ondblclick=\"newwind()\" onload=\"showtime()\">

<form method=\"post\" action=\"marks.pl\"><input type=hidden value=\"$info[0]\" name=\"nam2\"> <input type=hidden value=\"$info[1]\" name=\"uid2\"><input type=hidden value=$info[2] name=\"regno2\"><input type=hidden value=$info[3] name=\"sub2\"><input type=hidden value=\"\" name=\"mark2\"></form>

<span class=\"text\">
Q1.. The clause used to specify a condition to<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp retrieve rows of a table is :</span>
<span class=\"set\" style=\"position:absolute;left:90;top:150;\">	

a.<input type=radio name=q1 onclick=\"mark()\">Where<br><br>
b.<input type=radio name=q1 onclick=\"mark()\">Having<br><br>
c.<input type=radio name=q1 onclick=\"mark()\">Group by<br><br>
d.<input type=radio name=q1 onclick=\"mark()\">Order by
</span>

<span class=\"text\" style=\"position:absolute;left:20;top:450;\">
Q2.. Select Ceil ( 230.55 )  from  dual gives  :<br></span>
<span class=\"set\" style=\"position:absolute;left:90;top:500;\"><br><br>

a.<input type=radio name=q2 onclick=\"mark()\">230<br><br>
b.<input type=radio name=q2 onclick=\"mark()\">230.60<br><br>
c.<input type=radio name=q2 onclick=\"mark()\">231<br><br>
d.<input type=radio name=q2 onclick=\"mark()\">230.55
</span>

<span class=\"text\" style=\"position:absolute;top:850;left:20;\">
Q3.. ___________  helps the user to manage the error<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp conditions in the applications by specifing user-defined<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp error numbers and messages .</span>
<span class=\"set\" style=\"position:absolute;left:90;top:950;\"><br><br>

a.<input type=radio name=q3 onclick=\"mark()\">Show errors<br><br>
b.<input type=radio name=q3  onclick=\"mark()\">Raise_Application_error<br><br>
c.<input type=radio name=q3 onclick=\"mark()\">Execute<br><br>
d.<input type=radio name=q3 onclick=\"mark()\">None of the above
</span>

<span class=\"text\" style=\"position:absolute;left:20;top:1250;\">
Q4.. The data dictionary view used to display all<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp tables , views , synonyms and sequence for which<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp user is the owner .</span>
<span class=\"set\" style=\"position:absolute;left:90;top:1360;\"><br><br>

a.<input type=radio name=q4 onclick=\"mark()\">All_users<br><br>
b.<input type=radio name=q4 onclick=\"mark()\">User_Costraints<br><br>
c.<input type=radio name=q4 onclick=\"mark()\">User_Cons_Columns<br><br>
d.<input type=radio name=q4 onclick=\"mark()\">User_catalog
</span>

<span class=
\"text\" style=\"position:absolute;top:1650;left:20;\">
Q5.. _______________  is a modal window that displays<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp a message notifying the user of some application <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp conditions .</span>
<span class=\"set\" style=\"position:absolute;left:90;top:1750;\"><br><br>

a.<input type=radio name=q5 onclick=\"mark()\">Layout editor<br><br>
b.<input type=radio name=q5 onclick=\"mark()\">Properties window<br><br>
c.<input type=radio name=q5 onclick=\"mark()\">Alert<br><br>
d.<input type=radio name=q5 onclick=\"mark()\">PL\/SQL editor
</span>

<span class=\"text\" style=
\"position:absolute;top:2050;left:20;\">
Q6.. When Oracle includes object-oriented concepts<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspand structures the database is reffered to as :</span>
<span class=\"set\" style=\"position:absolute;left:90;top:2200;\"><br>

a.<input type=radio name=q6 onclick=\"mark()\">RDBMS<br><br>
b.<input type=radio name=q6 onclick=\"mark()\">DBMS<br><br>
c.<input type=radio name=q6 onclick=\"mark()\">ORDBMS<br><br>
d.<input type=radio name=q6 onclick=\"mark()\">Object Oriented Database
</span>

<span class=\"text\" style=\"position:absolute;top:2600;left:20;\">
Q7.. The default menu is provided by Oracle forms<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspbut the user, using the menu editor, must<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp create the ___________  menu  .</span>
<span class=\"set\" style=\"position:absolute;left:90;top:2760;\">

a.<input type=radio name=q7 onclick=\"mark()\">Master <br><br>
b.<input type=radio name=q7 onclick=\"mark()\">Custom <br><br>
c.<input type=radio name=q7 onclick=\"mark()\">Detail<br><br>
d.<input type=radio name=q7 onclick=\"mark()\">None of the above
</span>

<span class=\"text\" style=\"position:absolute;top:3100;left:20;\">
Q8.. A report which groups the data such that<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp certain repeating values appear only once<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp at the top of the group .</span>
<span class=\"set\" style=\"position:absolute;left:90;top:3250;\">

a.<input type=radio name=q8 onclick=\"mark()\" >Tabular Report<br><br>
b.<input type=radio name=q8 onclick=\"mark()\" >Matrix Report<br><br>
c.<input type=radio name=q8 onclick=\"mark()\">Break Report <br><br>
d.<input type=radio name=q8onclick=\"mark()\">Both ( a ) and  ( b )
</span>

<span class=\"text\" style=\"position:absolute;top:3600;left:20;\">
Q9..  The variable used to communicate from<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp a PL\/SQl block to  SQL*PLUS . </span>
<span class=\"set\" style=\"position:absolute;left:90;top:3720;\">

a.<input type=radio name=q9 onclick=\"mark()\"> Prompt <br><br>
b.<input type=radio name=q9 onclick=\"mark()\">Bind <br><br>
c.<input type=radio name=q9 onclick=\"mark()\">Print<br><br>
d.<input type=radio name=q9 onclick=\"mark()\" >Define  
</span>

<span class=\"text\" style=\"position:absolute;top:4000;left:20;\">
Q10.. ____________  menu items are useful<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp for creating menu items for standard <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp functions like cut , copy , etc .  </span>
<span class=\"set\" style=\"position:absolute;left:90;top:4160;\">

a.<input type=radio name=q10 onclick=\"mark()\" > Action<br><br>
b.<input type=radio name=q10  onclick=\"mark()\">Block <br><br>
c.<input type=radio name=q10  onclick=\"mark()\">Magic<br><br>
d.<input type=radio name=q10  onclick=\"mark()\">Query  
</span>

<div style=\"position:absolute;top:4250;left:500;\">
<input type=button value=\"Submit\" onclick=\"sub()\"></div></body></html>";

}