require "result.pm";
require "us_entry.pm";
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

open(fh1,$f1) || die"database not found";

while(read(fh1,$b,$rec_size))
{
	@data1=unpack($entrystruct,$b);
	for ($j=0;$j<($total_elements-1);$j++)
		{
			$data1[$j]=~s/\0//g;
		}
		
	$p=$data1[$u_id];
	
	if($p eq $info[0])
	{
		$q=$data1[$reg_no];
		
		if ($q == $info[1])
		{
			$s=$data1[2];
			$n=$data1[$nam];
			$flag1=1;
			last;
		}
	}

}

if($flag1)
{

	open(fh2,$f2);
	while(read(fh2,$b2,$recordsize))
	{
		@data2=unpack($struct1,$b2);
		for($k=0;$k<($noofelements-1);$k++)
		{
			$data2[$k]=~s/\0//g;
		}

		$r1=$data2[$userid];
		if($r1 eq $info[0])
		{
			$r2=$data2[$registerno];
			if($r2==$info[1])
			{
				$flag2=1;
				last;
			}
		}
	}
}
else
{
	 print "<html><title>Unauthorised entry</title><body bgcolor=\"#cafcbb\"><center><h1>BRAINWORLD.COM</h1></center>
      <img src=\"flower25.gif\" height=\"75\" width=\"75\"        style=\"position:absolute;top:0;left:135;\">
      <hr width=\"100%\" color=\"white\">
         <center><br><h3><font color=\"red\">Invalid UserName & Registration Number</font></h3><br><hr color=\"gold\"><br>
         <h3>Back to<a href=\"homepage.htm\">HOME</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Click here for <a href=\"help1.htm\"><b> HELP</b></a></h3></center></body></html>";

}

if($flag1)
{
if($flag2)
{
$n=ucfirst($n);
	print"<html><title>Duplicate Entry</title><body bgcolor=\"#cafcbb\"><center><h1>BRAINWORLD.COM</h1></center>
      <img src=\"flower25.gif\" height=\"75\" width=\"75\"        style=\"position:absolute;top:0;left:135;\">
      <hr width=\"100%\" color=\"white\"><center>
 <br><h2>$n !  You have already given an examination for $s .<br>To appear for exam of some other subject,<br>  please ,  re-register yourself .<br>Thanks !<br></h2><br><hr color=\"gold\"><br>
         <h3>Back to<a href=\"homepage.htm\">HOME</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Click here for <a href=\"register1.htm\"><b> New Registration </b></a></h3></center></body></html>";
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

	.inst{font-family:batang\;font-size:12pt\;
	   color:green\;
	    }
</style>
</head>
<body>

<table border=2 width=100% frame=vsides height=400>
<tr><td colspan=2><center><h1>BRAINWORLD.COM</h1></center>
<img src=\"flower25.gif\" height=70 width=60 style=\"position:absolute;top:10;left:132;\">
<hr width=100% color=\"white\"></center></td></tr>

<tr><td rowspan=2 width=300><h2 style=\"position:absolute;top:140;left:34;\">&nbsp&nbspINSTRUCTIONS . .</h2>
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

<td><form action=\"read.pl\" method=\"post\"> <b>
&nbsp&nbsp&nbspName  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:&nbsp&nbsp$n <input type=hidden name=nam1 value=\"$n\"><br>
&nbsp&nbsp&nbspUser_id  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:&nbsp&nbsp$info[0]<input type=hidden name=uid1 value=\"$info[0]\" ><br>
&nbsp&nbsp Registration No :&nbsp&nbsp$info[1]<input type=hidden name=regno1 value=$info[1] ><br>
&nbsp&nbsp&nbspSubject &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp :&nbsp&nbsp$s<input type=hidden name=sub1 value=$s ><br>
<input type=submit value=START style=\"position:absolute;top:409;left:130;\">
</b></form></td></tr>

<tr><td><center>
<applet code=\"Wave4\" width=100% height=100></applet>
</center> </td></tr>

</table>
</body>
</html>";
}
}