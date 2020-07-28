#!c:/perl/bin/perl

use Win32::ODBC;

$dsn="perl_exam";

$database = new Win32::ODBC($dsn) || print "<br>error";

print "Content-type:text/html\n\n";
$f1="student.txt";
$f2="marks.txt";
$flag1=0;
$flag2=0;

read(stdin,$data,$ENV{'CONTENT_LENGTH'});
@info=split(/&/,$data);
for($i=0;$i<($#info)+1;$i++)
{
	($f,$v)=split(/=/,$info[$i]);
	$v=~tr/+/ /;
	$info[$i]=$v;
}

$sql1="select * from us_entry";
$database->sql($sql1);

while($database->FetchRow())
{ 
	($uid,$nam,$sub,$e_id,$m_add,$reg_no) = $database->Data("u_id","nam","sub","e_id","m_add","reg_no");
	if ($uid eq $info[0])
	{
		if ($reg_no == $info[1])
		{
			$n=$nam;
			$s=$sub;
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
				last;
			}
		}
	}
}
else
{
	 print "<html><title>Unauthorised entry</title><body bgcolor=\"black\">
<div style=\"position:absolute;top:10;left:320;\"><img src=\"brain_ad12.gif\" height=\"75\" width=\"200\"></div>

      <div style=\"position:absolute;top:100;left:0;\">
      <hr width=\"100%\" color=\"#cafcbb\">
         <center><br><h3><font color=\"red\">Un-Authorised Entry....!!!!</font></h3><br><font color=\"white\"> Invalid Username and Registration Number</font><br><br><hr color=\"gold\"><br>
         <h4>Back to<a href=\"homepage.htm\">HOME</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Click here for <a href=\"help.htm\"><b> HELP</b></a></h4></center>
</div></body></html>";

}

if($flag1)
{
if($flag2)
{
$n=ucfirst($n);
	print"<html><title>Duplicate Entry</title><body  bgcolor=\"black\">
<div style=\"position:absolute;top:10;left:320;\"><img src=\"brain_ad12.gif\" height=\"75\" width=\"200\"></div>

      <div style=\"position:absolute;top:100;left:0;\">
      <hr width=\"100%\" color=\"#cafcbb\">
         <center><br><h3><font color=\"red\">Duplicate Entry....!!!!</font></h3><br><font color=\"white\"> 
 <br><h4><font color=\"red\">$n </font>!  You have already given an examination for <font color=\"red\">$sub1</font> .<br>To appear for exam of some other subject,<br>  please ,  re-register yourself .<br>Thanks !<br></h4><br><hr color=\"gold\"><br>
         <h4>Back to <a href=\"homepage.htm\">HOME</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Click here for <a href=\"register.htm\"><b> New Registration </b></a></h4></center></div></body></html>";
exit;
}
else
{
	print"<html>
<head><title>Instruction</title>
<style type=\"text/css\">
	H2{font-family:Copperplate Gothic Bold\;
	   color=red\;
	  }
	H5{font-family:Courier New\;
	   color=red\;
	  }

	.inst{font-family:times new roman\;font-size:12pt\;
	   color:#cafcbb\;
	    }
</style>
</head>
<body background=\"black\" bgcolor=\"black\">

<table border=2 width=100% frame=vsides height=400 bordercolor=\"#64a8ae\">
<tr><td colspan=2><center><img src=\"brain_ad12.gif\" height=\"75\" width=\"200\"></center>
</center></td></tr>

<tr><td rowspan=2 width=300><h2 style=\"position:absolute;top:140;left:34;color:white;\">&nbsp&nbspINSTRUCTIONS . .</h2>
<hr width=270 color=black style=\"position:absolute;top:170;left:35;\">
<span class=\"inst\" style=\"position:absolute;top:180;left:25;\"><b>
1.. You will have to answer 10 question.<br>
2.. Each question carries 10 marks.<br>
3.. After 3 minutes the question paper<br>&nbsp&nbsp&nbsp&nbsp will get locked and you will be<br>&nbsp&nbsp&nbsp&nbsp shown the result.<br>
4.. Time will be continuosly shown on<br>&nbsp&nbsp&nbsp&nbsp the status-bar.<br>
5.. Double click on the question paper<br> &nbsp&nbsp&nbsp&nbspto see the instructions.<br>
6.. Time will start as soon as you <br>&nbsp&nbsp&nbsp&nbsp click the start button.<br>
</b></span>
<hr width=270 color=black style=\"position:absolute;top:399;left:35;\"></td>

<td><form action=\"read.pl\" method=\"post\"> <b><font color=\"#cafcbb\">
&nbsp&nbsp&nbspName  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:&nbsp&nbsp $n <input type=hidden name=nam1 value=\"$n\"><br>
&nbsp&nbsp&nbspUser_id  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:&nbsp&nbsp $info[0]<input type=hidden name=uid1 value=\"$info[0]\" ><br>
&nbsp&nbsp Registration No :&nbsp&nbsp$info[1]<input type=hidden name=regno1 value=$info[1] ><br>
&nbsp&nbsp&nbspSubject &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp :&nbsp&nbsp$s<input type=hidden name=sub1 value=$s ><br>
<input type=submit value=START style=\"position:absolute;top:409;left:130;\">
</font></b></form></td></tr>

<tr><td><center>
<applet code=\"Wave4\" width=100% height=100></applet>
</center> </td></tr>

</table>
</body>
</html>";
}
}
$database->Close();