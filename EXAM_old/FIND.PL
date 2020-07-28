require "us_entry.pm";
print"content-type:text/html\n\n";

$searchfile="student.txt";
$flag=0;
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
	{$x=0;}
if($serfield1 eq "reg_no")
	{$x=5;}

$serfield2=$info[2];
if($serfield2 eq "u_id"){$y=0;}
if($serfield2 eq "nam"){$y=1;}
if($serfield2 eq "sub"){$y=2;}
if($serfield2 eq "e_id"){$y=3;}

if($serfield1 eq $serfield2)
{
	 print "<html><title>Illegal Search Criteria</title><body       bgcolor=\"#cafcbb\"><center><h1>BRAINWORLD.COM</h1></center>
      
         <center><br><h2>Search criteria not fulfilled.</h2><br><hr color=\"gold\"><br>
         <h3>Back to<a href=\"homepage.htm\">HOME</a>&nbsp&nbsp&nbsp&nbspClick here for <a href=\"help1.htm\">Help</a></h3>
</center></body></html>";
exit;

}

$servalue1=$info[1];
$servalue2=$info[3];


open(fhser,$searchfile);
while(read(fhser,$buf,$rec_size))
{
	@data1=unpack($entrystruct,$buf);
	for ($j=0;$j<($total_elements);$j++)
		{
			$data1[$j]=~s/\0//g;
		}
	if ($data1[$x] eq $info[1])
	{
		
		$q=$data1[$y];
		if($q eq $info[3])
		{
			$flag=1;
			$res1=$data1[$u_id];
			$res2=$data1[$reg_no];
			last;
		}
	 }
}






if(!$flag)
{
		 print "<html><title>Unauthorised entry</title><body       bgcolor=\"#cafcbb\"><center><h1>BRAINWORLD.COM</h1></center>
         <img src=\"flower25.gif\" height=\"75\" width=\"75\"        style=\"position:absolute;top:0;left:135;\">
      <hr width=\"100%\" color=\"white\">
         <center><br><h2>No such record exists .</h2><br><hr color=\"gold\"><br>
         <h3>Back to<a href=\"homepage.htm\">HOME</a></h3></center></body></html>";

}
else
{
 print "<html><title>Search Result</title><body       bgcolor=\"#cafcbb\"><center><h1>BRAINWORLD.COM</h1></center>
      <img src=\"flower25.gif\" height=\"75\" width=\"75\"        style=\"position:absolute;top:0;left:135;\">
      <hr width=\"100%\" color=\"white\">
         <center><br><h2>U'r user_id is <font color=\"red\">$res1</font><br>U'r registration number is <font color=\"red\">$res2</font></h2><br><hr color=\"gold\"><br>
         <h3>Back to<a href=\"homepage.htm\">HOME</a></h3></center></body></html>";

}