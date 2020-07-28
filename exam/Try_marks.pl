#!c:/perl/bin/perl

use Win32::ODBC;

$dsn="perl_exam";

$database = new Win32::ODBC($dsn) || print "<br>error";

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
$hidden_fields[4]=$mark;

$sql2="select * from try_marks";
$database->sql($sql2);
while($database->FetchRow())
{ 
	($nam1,$uid1,$reg_no1,$sub1,$mar1) = $database->Data("nam","u_id","reg_no","sub","mar");
	if($uid1 eq $hidden_fields[1])
	{
		if($reg_no1==$hidden_fields[2])
		{
			$flag=1;
			last;
		}
	}
}

if($flag)
{

$n=ucfirst($nam1);
	print"<html><title>Duplicate Entry</title><body  bgcolor=\"black\">
<div style=\"position:absolute;top:10;left:320;\"><img src=\"brain_ad12.gif\" height=\"75\" width=\"200\"></div>

      <div style=\"position:absolute;top:100;left:0;\">
      <hr width=\"100%\" color=\"#cafcbb\">
         <center><br><h3><font color=\"red\">Duplicate Entry....!!!!</font></h3><br><font color=\"white\"> 
 <br><h4><font color=\"red\">$n </font>!  Your marks have been already stored for the current examination.<br>To appear again for the exam, please re-register yourself .<br>Thanks !<br></h4><br><hr color=\"gold\"><br>
         <h4>Back to <a href=\"homepage.htm\">HOME</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Click here for <a href=\"register.htm\"><b> New Registration </b></a></h4></center></div></body></html>";
exit;

}

else
{
	$sql2="insert into try_marks values('$hidden_fields[0]','$hidden_fields[1]',$hidden_fields[2],'$hidden_fields[3]',$hidden_fields[4])";
	$database->sql($sql2);
	print"<html><head><title>Marks information</title></head>
<body bgcolor=\"black\">
<div style=\"position:absolute;top:10;left:320;\"><img src=\"brain_ad12.gif\" height=\"75\" width=\"200\"></div>

      <div style=\"position:absolute;top:100;left:0;\"><hr width=\"100%\" color=\"#64a8ae\">

<center><font color=\"white\">
<h2>Your score is</h2><br><h3><font color=\"#cafcbb\"> $hidden_fields[4]</font> out of <font color=\"#cafcbb\"> 100</font>.</h3><br>Return to <a href=\"homepage.htm\">HOME</a>
<form action=\"result.pl\" method=\"post\"><input type=hidden name=\"uid1\" value=\"$hidden_fields[1]\"><input type=hidden  name=\"regno1\" value=$hidden_fields[2]><input type=submit value=\"Certificate\" style=\"border:0;background:#64a8ae;color:white\"></form>
</font></center>

</div></body><html>";

}
$databse->Close();
