#!c:/perl/bin/perl

use Win32::ODBC;


$dsn="perl_exam";

$database = new Win32::ODBC($dsn) || print "<br>error";

###################################################
$flag=0;
$p=0;
$q=0;
$r=0;
print "content-type:text/html\n\n";
read (stdin,$data,$ENV{'CONTENT_LENGTH'});
@info=split(/&/,$data);
for ($i=0;@info[$i];$i++)
    {
	($name,$value)=split(/=/,$info[$i]);
	$value=~tr/+/ /;
	$info[$i]=$value;
    }
&inc_entry unless ($info[0]);
if($q==0)
{
	&inc_entry unless ($info[1]);
}
if($r==0)
{
	&inc_entry unless ($info[4]);
}
if($p==1){exit;}

$sql="select * from us_entry";
$database->sql($sql);

while($database->FetchRow())
{ 
	($uid,$nam,$sub,$e_id,$m_add,$reg_no) = $database->Data("u_id","nam","sub","e_id","m_add","reg_no");
	if ($uid eq $info[0])
	{
		$flag=1;
		last;
	}
}

if(!$flag)
{
	$info[5]=$reg_no+1;
	$insrt="insert into us_entry values('$info[0]','$info[1]','$info[2]','$info[3]','$info[4]',$info[5])";
	$database->sql($insrt);
	$n=ucfirst($info[1]);
	print "<html><title>Welcome</title><body bgcolor=\"white\"><h3><center> CONGRATS..!!! 	<br></h3>
	<font size=\"3pt\">

<font color=\"red\" >$n</font>. Your entry has been successfully received<br>Now you are one of our registered users<br>
		Welcome to our world...The BRAIN WORLD<hr color=\"gold\"><br>Your user id is <font color=\"red\">$info[0]</font><br>
		Your registration number is <font color=\"red\">$info[5]</font>.
<br><br>
<sup>** </sup> User_id and Registration number are required at the time of login.<br>
<sup>** </sup> To Continue for examination login from the homepage.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
        <hr width=\"100%\" color=\"gold\">
<a href=\"homepage.htm\" target=\"_top\">HOME</a>

</font></center></body></html>";


}
else
{
	print "<html><title>Welcome</title><body><center><h4>Duplicate Entry.....!!!!</h4><br><hr width=\"100%\" color=\"gold\"><br>
         <font size=\"3pt\"><font color=\"red\" ><b>$info[$u_id]</b></font> has already been choosen by someone.<br>
		Kindly choose a different User Id.<br><b>Thanks...!!</b><br><hr width=\"100%\" color=\"gold\">
		<br><a href=\"register_content.htm\" title=\"Back to Registration Form\"> Registration form</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"homepage.htm\" target=\"_top\" title=\"Return to Homepage\">Home</a></center></font></body></html>";
}
$database->Close();


sub inc_entry
{
	print "<html><title>Welcome</title><body><center>You have not filled the form properly.<br>
		<hr><br>
		Click here to return <a href=\"register_content.htm\">Back to registration form</a> and fill it completely</center></body></html>";	
	$q=1;$r=1;$p=1;
	
}