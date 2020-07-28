require"result.pm";
$f2="marks.txt";

@que_papers=("i_que_ans.txt","j_que_ans.txt","o_que_ans.txt");

$mark=0;
print "Content-type:text/html\n\n";

read(stdin,$data,$ENV{'CONTENT_LENGTH'});
@info=split(/&/,$data);

for($i=0;@info[$i];$i++)
{
	($f,$v)=split(/=/,$info[$i]);
	$v=~tr/+/ /;
	$info[$i]=$v;
	if($i>3)
	{
		$info_que_num[$i-4]=$f;
		$given_ans[$i-4]=$v;
	}
}


for($j=0;$j<4;$j++)
{
	$hidden_fields[$j]=$info[$j];
}


$p=0;

if($hidden_fields[3] eq "iq")
{
	$f1=$que_papers[0];
}
elsif($hidden_fields[3] eq "java")
{
	$f1=$que_papers[1];
}
elsif($hidden_fields[3] eq "oracle")
{
	$f1=$que_papers[2];
}


foreach $sel_que(@info_que_num)
{
	open(fh1,$f1);
	$line=<fh1>;
	while($line ne "")
	{
		($qnum,$answer)=split(/,/,$line);
		if($sel_que eq $qnum)
		{
			if($given_ans[$p] == $answer)
			{
				$mark+=1;
			}
			last;
		}
		$line=<fh1>;
	}
	$p=$p+1;
	close(fh1);
}

$mark*=10;
$hidden_fields[$marks]=$mark;

open(fh,$f2);
while(read(fh,$b2,$recordsize))
{
	@data1=unpack($struct1,$b2);
	for($k=0;$k<($noofelements-1);$k++)
	{
		$data1[$k]=~s/\0//g;
	}
	$a1=$data1[$userid];
	if($a1 eq $hidden_fields[1])
	{
		$a2=$data1[$registerno];
		if($a2==$hidden_fields[2])
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
	$entry=pack($struct1,@hidden_fields);
	open(fh,">>$f2");
	print fh $entry;

	print"<html><head><title>Marks information</title></head><body bgcolor=\"#cafcbb\"><center><h1>BRAINWORLD.COM</h1></center>
      <img src=\"flower25.gif\" height=\"75\" width=\"75\"        style=\"position:absolute;top:0;left:135;\">

      <hr width=\"100%\" color=\"white\">

<center><h2>Your score is</h2><br><h3><font color=\"blue\"> $hidden_fields[$marks]</font> out of <font color=\"blue\"> 100</font>.</h3><br>Return to <a href=\"homepage.htm\">HOME</a>
<form action=\"result.pl\" method=\"post\"><input type=hidden name=\"uid1\" value=\"$hidden_fields[1]\"><input type=hidden  name=\"regno1\" value=$hidden_fields[2]><input type=submit value=\"Certificate\" style=\"border:0;background:#7b3fbf;color:white\"></form>

</center></body><html>";

}
