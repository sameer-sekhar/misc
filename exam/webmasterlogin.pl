#!c:/perl/bin/perl

use Win32::ODBC;

$f1="hitcounter.txt";

$dsn="perl_exam";

$database = new Win32::ODBC($dsn) || print "<br>error";

print "Content-type:text/html\n\n";

$flag1=0;

read(stdin,$data,$ENV{'CONTENT_LENGTH'});
@info=split(/&/,$data);
for($i=0;$i<($#info)+1;$i++)
{
	($f,$v)=split(/=/,$info[$i]);
	$v=~tr/+/ /;
	$info[$i]=$v;
}

$sql1="select * from webmaster";
$database->sql($sql1);

while($database->FetchRow())
{ 
	($wid,$pasw) = $database->Data("w_id","pasw");
	if ($wid eq $info[0])
	{
		if ($pasw eq $info[1])
		{
			$flag1=1;
			last;
		}
	}
}

if($flag1)
{
	print "<html><body bgcolor=\"#cafcbb\"><br><br><font color=red size=4> Hit Counter ...............................................................................................  ";


open(fh1,$f1);
$r1=<fh1>;
print "$r1";
close(fh1);

print "</font></body</html>";

}
else
{
	 print "<html><body bgcolor=\"#cafcbb\">      
         <center><br><h3><font color=\"red\">Invalid WebMaster ID or Password</font></h3><br><hr color=\"gold\"><br>
         <h3>Access Denied....</h3></center></body></html>";

}

$database->Close();