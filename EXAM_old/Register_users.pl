require"us_entry.pm";
$userfile= "student.txt";
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
&inc_entry unless ($info[$u_id]);
if($q==0)
{
	&inc_entry unless ($info[$nam]);
}
if($r==0)
{
	&inc_entry unless ($info[$m_add]);
}
if($p==1){exit;}

open(fh1,$userfile);
	while(read(fh1,$buffer,$rec_size))
	{	
		@data1=unpack($entrystruct,$buffer);
		for ($j=0;$j<($total_elements-1);$j++)
		{
			$data1[$j]=~s/\0//g;
		}
		$w1=$data1[$u_id];
		if ($w1 eq $info[$u_id])
		{
			$flag=1;
			last;
		}
	}

if(!$flag)
{
	$info[$reg_no]=$data1[$reg_no]+1;
	$entry=pack($entrystruct,@info);
	open(fh2,">>$userfile") || die"sorry database not found";
	print fh2 $entry;
	close (fh2);
	$n=ucfirst($info[$nam]);
	print "<html><title>Welcome</title><body bgcolor=\"#cafcbb\"><center><h1>BRAINWORLD.COM</h1></center>
      <img src=\"flower25.gif\" height=\"75\" width=\"75\"        style=\"position:absolute;top:0;left:135;\">
       <hr width=\"100%\" color=\"white\">
         
<h2><br><center>CONGRATS!<br><br>
		<font color=\"red\">$n</font>. Your entry has been successfully received<br>Now you are one of our registered users<br>
		Welcome to our world...The BRAIN WORLD<hr color=\"gold\"><br>Your user id is <font color=\"red\">$info[$u_id]</font><br>
		Your registration number is <font color=\"red\">$info[$reg_no]</font>.
<br><br>



<sup>**</sup>User_id and Registration number are required at the time of login.<br>So do note them down<br>
         <hr width=\"100%\" color=\"gold\"><h3>Back to<a href=\"homepage.htm\">HOME</a>
<form action=\"login1.pl\" method=\"post\"><input type=hidden name=\"uid\" value=\"$info[$u_id]\"><input type=hidden  name=\"rno\" value=$info[$reg_no]><input type=submit value=\"Continue for Examination  \"style=\"border:0;background:#7b3fbf;color:white\"></form>

</center></h2></body></html>";


}
else
{
	print "<html><title>Welcome</title><body bgcolor=\"#cafcbb\"><center><h1>BRAINWORLD.COM</h1></center>
      <img src=\"flower25.gif\" height=\"75\" width=\"75\"        style=\"position:absolute;top:0;left:135;\">
       <hr width=\"100%\" color=\"white\"><br>
         <h3><center>$info[$u_id] has already been choosen by someone else.<br>
		So please choose something else<br>
		Click here to return <br><h3>Back to<a href=\"register1.htm\"> Registration form</a>&nbsp&nbsp&nbsp&nbspBack to<a href=\"homepage.htm\">HOME</a></center></h3></body></html>";
}

sub inc_entry
{
	print "<html><title>Welcome</title><body bgcolor=\"#cafcbb\"><center><h1>BRAINWORLD.COM</h1></center>
      <img src=\"flower25.gif\" height=\"75\" width=\"75\"        style=\"position:absolute;top:0;left:135;\">
       <hr width=\"100%\" color=\"white\"><br><center>You have not filled the form properly.<br>
		<hr><br>
		Click here to return <a href=\"register1.htm\">Back to registration form</a> and fill it completely</center></body></html>";	
	$q=1;$r=1;$p=1;
	
}