print "Content-type:text/html\n\n";
@question_iq=("qi1.txt","qi2.txt","qi3.txt","qi4.txt","qi5.txt","qi6.txt","qi7.txt","qi8.txt","qi9.txt","qi10.txt","qi11.txt","qi12.txt","qi13.txt","qi14.txt","qi15.txt","qi16.txt");

@question_java=("qj1.txt","qj2.txt","qj3.txt","qj4.txt","qj5.txt","qj6.txt","qj7.txt","qj8.txt","qj9.txt","qj10.txt","qj11.txt","qj12.txt","qj13.txt","qj14.txt","qj15.txt","qj16.txt");

@question_oracle=("qo1.txt","qo2.txt","qo3.txt","qo4.txt","qo5.txt","qo6.txt","qo7.txt","qo8.txt","qo9.txt","qo10.txt","qo11.txt","qo12.txt","qo13.txt","qo14.txt","qo14.txt","qo14.txt");

$f1="start.txt";
$total_questions=16;
$questions_displayed=10;
read(stdin,$data,$ENV{'CONTENT_LENGTH'});
@info=split(/&/,$data);

for($i=0;@info[$i];$i++)
{
	($f,$v)=split(/=/,$info[$i]);
	$v=~tr/+/ /;
	$info[$i]=$v;
}

$subject=$info[3];

$form_variable="<form method=\"post\" action=\"try_marks.pl\" >
<input type=hidden value=\"$info[0]\" name=\"nam2\"> 
<input type=hidden value=\"$info[1]\" name=\"uid2\">
<input type=hidden value=\"$info[2]\" name=\"regno2\">
<input type=hidden value=\"$info[3]\" name=\"sub2\">";

open(fh1,$f1);
$r1=<fh1>;
while($r1 ne "")
{
	print "$r1";
	$r1=<fh1>;
}

print"$form_variable";


$X=0;
$qno=0;
srand(time);
while($qno < $questions_displayed)
{
	$qrand=int(rand($total_questions)+0);
	foreach $num(@gen_arr)
	{
		if($qrand == $num)
		{
			$X=1;
			last;
		}
	}
	if ($X==1)
	{
		$X=0;
		redo;
	}
	else
	{
		$qno_prn=$qno+1;
		print"&nbsp&nbsp&nbsp&nbsp&nbsp$qno_prn";
		$gen_arr[$qno]=$qrand;

		if($subject eq "java")
		{
			$f2=$question_java[$qrand];
		}
		elsif($subject eq "oracle")
		{
			$f2=$question_oracle[$qrand];
		}
		elsif($subject eq "iq")
		{
			$f2=$question_iq[$qrand];
		}
		open(fh2,$f2);
		
		$r2=<fh2>;
		while($r2 ne "")
		{ 
			print "$r2";
			$r2=<fh2>;
		}
		$qno+=1;
		close(fh2);
		print"<br><br><br><br><br><br>";
	}
}

print"</form><input type=\"button\" value=\"Submit\" onclick=\"sub()\"></body></html>";