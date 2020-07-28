#!c:/perl/bin/perl

use Win32::ODBC;

$dsn="perl_exam";

$database = new Win32::ODBC($dsn) || print "<br>error";

print"content-type:text/html\n\n";

$flag=0;
$flag1=0;

read(STDIN, $data,$ENV{'CONTENT_LENGTH'});
@info=split(/&/,$data);

for($i=0;$i<=($#info);$i++)
{
	($f,$v)=split(/=/,$info[$i]);
	$v=~tr/+/ /;
	$info[$i]=$v;
}

$serfield1=$info[0];

if($serfield1 eq "u_id")
	{$flag1=0;}
if($serfield1 eq "reg_no")
	{$flag1=1;}

$serfield2=$info[2];
if($serfield2 eq "nam"){$y=1;}
if($serfield2 eq "sub"){$y=2;}
if($serfield2 eq "e_id"){$y=3;}

if($serfield1 eq $serfield2)
{
	 print "<html><body>      
         <center><br><h3>Search criteria not fulfilled.</h3><br><hr color=\"gold\"><br>
         <h4>Back to<a href=\"homepage.htm\" target=\"_top\">HOME</a>&nbsp&nbsp&nbsp&nbspClick here for <a href=\"help_content.htm\">Help</a></h4>
</center></body></html>";
exit;

}

$servalue1=$info[1];
$servalue2=$info[3];

if($flag1)
{
	
	$sql1="select * from us_entry where $serfield1 = $servalue1 and $serfield2 = \'$servalue2\'";
}
else
{	
	$sql1="select * from us_entry where $serfield1 = \'$servalue1\' and $serfield2 = \'$servalue2\'";
}

$database->sql($sql1);

while($database->FetchRow())
{ 
	($uid,$nam,$sub,$e_id,$m_add,$reg_no) = $database->Data("u_id","nam","sub","e_id","m_add","reg_no");

	$n=$nam;
	$s=$sub;
	$flag=1;
	last;
}

if(!$flag)
{
		 print "<html><title>Unauthorised entry</title><body>
                   <center><br><h2>No such record exists .</h2><br><hr color=\"gold\"><br>
         <h3>Back to<a href=\"homepage.htm\" target=\"_top\">HOME</a></h3></center></body></html>";

}
else
{
 print "<html><title>Search Result</title><body>
               <center><br><h3>U'r user_id is <font color=\"red\">$uid</font><br>U'r registration number is <font color=\"red\">$reg_no</font></h3><br><hr color=\"gold\"><br>
         <h3>Back to<a href=\"homepage.htm\" target=\"_top\">HOME</a></h3></center></body></html>";

}