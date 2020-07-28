#!c:/perl/bin/perl

use Win32::ODBC;

$dsn="perl_exam";

$database = new Win32::ODBC($dsn) || print "<br>error";

print "Content-type:text/html\n\n";

$flag1=0;
$flag2=0;
read(stdin,$data,$ENV{'CONTENT_LENGTH'});
@info=split(/&/,$data);
for($i=0;@info[$i];$i++)
{
	($f,$v)=split(/=/,$info[$i]);
	$v=~tr/+/ /;
	$info[$i]=$v;
}
$sql="select * from us_entry";
$database->sql($sql);

while($database->FetchRow())
{ 
	($uid,$nam,$sub,$e_id,$m_add,$reg_no) = $database->Data("u_id","nam","sub","e_id","m_add","reg_no");
	if ($uid eq $info[0])
	{
		if($reg_no==$info[1])
		{
			$flag1=1;
			last;
		}
	}
}

if($flag1)
{
	$sql2="select * from try_marks";
	$database->sql($sql2);
	while($database->FetchRow())
	{ 
		($nam1,$uid1,$reg_no1,$sub1,$mar1) = $database->Data("nam","u_id","reg_no","sub","mar");
		if($uid1 eq $info[0])
		{
			if($reg_no1==$info[1])
			{
				$flag2=1;
				$n1=$nam1;
				$sub=$sub1;
				$mark=$mar1;
				if($mark>90){$grade="A";$remark="";}
				elsif($mark>80){$grade="B";$remark="";}
				elsif($mark>70){$grade="C";$remark="";}
				elsif($mark>60){$grade="D";$remark="";}
				else{$grade="F";$remark="He\/she has been declared fail";}
	
			}
		}
	}
}
else
{
	print"<html><title>Error Entry</title><body  bgcolor=\"black\">
<div style=\"position:absolute;top:10;left:320;\"><img src=\"brain_ad12.gif\" height=\"75\" width=\"200\"></div>

      <div style=\"position:absolute;top:100;left:0;\">
      <hr width=\"100%\" color=\"#cafcbb\">
         <center><br><h3><font color=\"red\">Un-authenticated Entry....!!!!</font></h3><br><font color=\"white\"> 
 <br><h4>There is no one with these values registered with us.<br>Kindly register yourself to avail our features.<br>Thanks...!!<br></h4><br><hr color=\"gold\"><br>
         <h4>Back to <a href=\"homepage.htm\">HOME</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Click here for <a href=\"register.htm\"><b> New Registration </b></a></h4></center></div></body></html>";
exit;
}

if($flag2)
{

	print"<html>
<head>
<title> Certificate Of Excellence</title>
<style type= \"text/css\">
h2{position:absolute;top:40;left:160;
  text-decorate:blink;font-size:30pt;font:bold;
  color:black;font-family:Monotype Corsiva;
  filter:shadow(color=#fa8834);}
h1{position:absolute;top:100;left:140;
  text-decorate:blink;font-size:20pt;font:bold;
  color:black;font-family:normal;
  filter:glow(color=#fa8834;strength=4);}
p{position:absolute;top:200;left:40;
  text-decorate:blink;font-size:14pt;
  color:green;font-family:normal;
  }

</style>
</head>
<body background=\"q3.gif\">

<img src=\"cer_logo.gif\" style=\"position:absolute;top:7;left:45;\" height=140 width=700><h1 style=\"position:absolute;top:124;left:190;\">CERTIFICATE OF EXCELLENCE</H1>

<p><br>This is to certify that Mr/Miss/Mrs&nbsp;&nbsp;&nbsp;<font color=black>
$n1</font>&nbsp;&nbsp;
&nbsp;registration number&nbsp;&nbsp;&nbsp;&nbsp;<font color=black> $info[1] </font>&nbsp;&nbsp;has appeared for the skill enhancement test regarding the subject of &nbsp;&nbsp;&nbsp;<font color=black> $sub </font>&nbsp;&nbsp;and has secured &nbsp;&nbsp;<font color=black> $mark % </font>&nbsp;&nbsp;&nbsp;marks with Grade &nbsp;&nbsp; <font color=black> $grade </font>.<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:red\">$remark</span></p>

<div style=\"position:absolute;top:110;left:580;\"><p><img src=\"signature.gif\" width=100 height=80 style=\"z-index:-1;\"></p></div>

<div style=\"position:absolute;top:170;left:10;\"><p>General Secretary<br><font color=maroon>Sekhar Sameer</font></p></div>

<div style=\"position:absolute;top:140;left:310;\"><p><img src=\"logo.gif\" width=120 height=100 style=\"z-index:-1;\"></p></div>

<div style=\"position:absolute;top:170;left:570;\"><p>Director<br><font color=maroon>Sameer Sekhar</font></p></div>

<div style=\"position=absolute;top:425;left:35;\">
<hr color=black width=710>
<p><font color=black><center>Copyright : BRAINWORLD International<sup style= \"font-size:15pt\">&copy;</sup><br>#80, 3rd Cross, 5th block <BR>Koramangala Layout, Bangalore - 95<BR></center></font>
<h3><CENTER><a href=\"homepage.htm\">HOME</CENTER></A></H3>
</div>
</body>
</html>";
}
else
{
	$n=ucfirst($nam);
	print"<html><title>InValid Entry</title><body  bgcolor=\"black\">
<div style=\"position:absolute;top:10;left:320;\"><img src=\"brain_ad12.gif\" height=\"75\" width=\"200\"></div>

      <div style=\"position:absolute;top:100;left:0;\">
      <hr width=\"100%\" color=\"#cafcbb\">
         <center><br><h3><font color=\"red\">Invalid Entry....!!!!</font></h3><br><font color=\"white\"> 
 <br><h4><font color=\"red\">$n </font>!  You have not appeared for any examination till date.<br>Kindly appear for a exam in order to generate your certificate .<br>Thanks...!!<br></h4><br><hr color=\"gold\"><br>
         <h4>Back to <a href=\"homepage.htm\">HOME</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Click here for <a href=\"register.htm\"><b> New Registration </b></a></h4></center></div></body></html>";
exit;
}