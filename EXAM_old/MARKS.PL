require "result.pm";
print "Content-type:text/html\n\n";
$flag=0;
$f1="marks.txt";
read(stdin,$data,$ENV{'CONTENT_LENGTH'});
@info=split(/&/,$data);
for($i=0;@info[$i];$i++)
{
	($f,$v)=split(/=/,$info[$i]);
	$v=~tr/+/ /;
	$info[$i]=$v;
}

$info[$marks]*=10;
open(fh,$f1);
while(read(fh,$b2,$recordsize))
{
	@data2=unpack($struct1,$b2);
	for($k=0;$k<($noofelements-1);$k++)
	{
		$data2[$k]=~s/\0//g;
	}
	$r1=$data2[$userid];
	if($r1 eq $info[1])
	{
		$r2=$data2[$registerno];
		if($r2==$info[2])
		{
			$flag=1;
			last;
		}
	}
}
if($flag)
{
	print"<html><head><title>Duplicate Entry</title></head><body bgcolor=\"#cafcbb\"><center><h1>BRAINWORLD.COM</h1></center>
      <img src=\"flower25.gif\" height=\"75\" width=\"75\"        style=\"position:absolute;top:0;left:135;\">
      <hr width=\"100%\" color=\"white\"><center><font color=\"red\"><h2 >Your marks has already been entered .<br>So , don\'t try to cheat  the system .</h3><br><br><h3><a href=\"homepage.htm\">Home</a></h3>
	</font></center></body></html>";
}
else
{
$entry=pack($struct1,@info);

open(fh,">>$f1");
print fh $entry;
print"<html><head><title>Marks information</title></head><body bgcolor=\"#cafcbb\"><center><h1>BRAINWORLD.COM</h1></center>
      <img src=\"flower25.gif\" height=\"75\" width=\"75\"        style=\"position:absolute;top:0;left:135;\">
      <hr width=\"100%\" color=\"white\"><center><h2>Your score is</h2><br><h3><font color=\"blue\"> $info[$marks]</font> out of <font color=\"blue\"> 100</font>.</h3><br>Return to <a href=\"homepage.htm\">HOME</a>
<form action=\"result.pl\" method=\"post\"><input type=hidden name=\"uid1\" value=\"$info[1]\"><input type=hidden  name=\"regno1\" value=$info[2]><input type=submit value=\"Certificate\"style=\"border:0;background:#7b3fbf;color:white\"></form>

</center></body><html>";
}