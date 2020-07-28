require "result.pm";
require "us_entry.pm";
print "Content-type:text/html\n\n";
$f2="marks.txt";
$f1="student.txt";
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
open(fh1,$f1);

while(read(fh1,$b1,$rec_size))
{
	@data1=unpack($entrystruct,$b1);
	for($j=0;$j<($total_elements-1);$j++)
	{
		$data1[$j]=~s/\0//g;
	}
	$p=$data1[$u_id];
	$x=$info[0];

	if($p eq $x)
	{
		
		$t2=$data1[$reg_no];
		if($t2==$info[1])
		{
			
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
				$n1=$data2[$name];
				$sub=$data2[$subject];
				$mark=$data2[$marks];
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
	print"<html><head><title>Error</title></head><body bgcolor=\"#cafcbb\"><center><h1>BRAINWORLD.COM</h1></center>
      <img src=\"flower25.gif\" height=\"75\" width=\"75\"        style=\"position:absolute;top:0;left:135;\">
       <hr width=\"100%\" color=\"white\"><center><h2>There is no one with these values registered with us.</h2><br><hr color=\"gold\"><br><h2>Back to<a href=\"homepage.htm\">Home</a>&nbsp&nbsp&nbsp&nbsp&nbsp Click here for<a href=\"help1.htm\">Help</a></h2></center></body></html>";
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

<img src=\"cer_logo.gif\" style=\"position:absolute;top:10;left:45;\" height=150 width=700><h1 style=\"position:absolute;top:130;left:190;\">CERTIFICATE OF EXCELLENCE</H1>

<p><br><br>This is to certify that Mr/Miss/Mrs&nbsp;&nbsp;&nbsp;<font color=black>
$n1</font>&nbsp;&nbsp;
&nbsp;registration number&nbsp;&nbsp;&nbsp;&nbsp;<font color=black> $info[1] </font>&nbsp;&nbsp;has appeared for the skill enhancement test regarding the subject of &nbsp;&nbsp;&nbsp;<font color=black> $sub </font>&nbsp;&nbsp;and has secured &nbsp;&nbsp;<font color=black> $mark % </font>&nbsp;&nbsp;&nbsp;marks with Grade &nbsp;&nbsp; <font color=black> $grade </font>.<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:blue\">$remark</span></p>

<div style=\"position:absolute;top:185;left:580;\"><p><img src=\"signature.gif\" width=100 height=80 style=\"z-index:-1;\"></p></div>

<div style=\"position:absolute;top:180;left:10;\"><p>General Secretary<br><font color=maroon>Chotu Raja</font></p></div>

<div style=\"position:absolute;top:180;left:310;\"><p><img src=\"logo.gif\" width=100 height=80 style=\"z-index:-1;\"></p></div>

<div style=\"position:absolute;top:180;left:570;\"><p>Director<br><font color=maroon>Sameer Sekhar</font></p></div>

<div style=\"position=absolute;top:460;left:35;\">
<hr color=black width=710>
<p><h5><font color=black><center>Copyright : BRAINWORLD International<sup style= \"font-size:15pt\">&copy;</sup><br>SEC 6/A, 3437<BR>BOKARO STEEL CITY<BR>JHARKHAND</center></font></h5>
<h3><CENTER><a href=\"homepage.htm\"> BACK TO HOME</CENTER></A></H3>
</div>
</body>
</html>";
}
else
{
	print"<html><head><title>Error</title></head><body bgcolor=\"#ffffb0\"><center><h1>BRAINWORLD.COM</h1></center>
      <img src=\"flower25.gif\" height=\"75\" width=\"75\"        style=\"position:absolute;top:0;left:135;\">
       <hr width=\"100%\" color=\"white\"><center><h2>This user has till date not given any exam<br><hr color=\"gold\"><br><h2>Back to<a href=\"homepage.htm\">Home</a></h2></center></body></html>";
}