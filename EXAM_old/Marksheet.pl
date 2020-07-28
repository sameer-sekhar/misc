require "result.pm";

print "Content-type:text/html\n\n";
$f2="marks.txt";

$count=0;

print"<HTML>
<HEAD>
<TITLE>RESULT</TITLE>
</HEAD>
<BODY BGCOLOR=\"#FFDD99\"><center>
<h2>Enter the User_id and the Registration number to view the result\(Certificate\)</h2><br><br>
<center>
<form method=\"post\" action=\"result.pl\">
<table>
<tr>
<td><font size=4>User_id:</font></td>
<td><input type=\"text\" name=\"uid1\" value=\"\"></td>
</tr>
<tr>
<td><font size=4>Registration number\:</font></td>
<td><input type=\"text\" name=\"regno1\" value=\"\"></td>
</tr>

<tr>
<td colspan=2><center><input type=\"Submit\" value=\"View Certificate\" ></center></td>
</tr>
</table>
</form>

<br><br><h2>BRAINWORLD ACADEMY FOR COMPETITIVE EXAMINATION ( BACE )</h2>
		<br><br><table border=2 width=\"100\%\" height=\"100\%\"><tr bgcolor=beige><td align=center><font color=brown><b>Serial No :</b></font></td><td align=center><font color=brown><b>Name</b></font></td><td align=center><font color=brown><b>User Id</b></font></td><td align=center><font color=brown><b>Registration No:</b></font></td><td align=center><font color=brown><b>Subject</b></font></td><td align=center><font color=brown><b>Marks</b></font></td><td align=center><font color=brown><b>Grade</b></font></td></tr>";



open(fh2,$f2);

while(read(fh2,$b2,$recordsize))
{
	@data=unpack($struct1,$b2);
	for($k=0;$k<($noofelements-1);$k++)
	{
		$data[$k]=~s/\0//g;
	}
	$count++;
	$u1=$data[$userid];
	$r1=$data[$registerno];
	$n1=$data[$name];
	$sub=$data[$subject];
	$mark=$data[$marks];
	if($mark>90){$grade="A";}
	elsif($mark>80){$grade="B";}
	elsif($mark>70){$grade="C";}
	elsif($mark>60){$grade="D";}
	else{$grade="F";}
	$bg="#cafcbb";
	if($grade eq "F")
	{
		$bg="white";
	}
	
	print"<tr bgcolor=$bg><td align=center>$count</td><td align=center>$n1</td><td align=center>$u1</td><td align=center>$r1</td><td align=center>$sub</td><td align=center>$mark</td><td align=center>$grade</td></tr>";
}

print"<tr bgcolor=beige><td colspan=7>&nbsp;</td></tr><tr bgcolor=white><td colspan=7 align=center>&nbsp;**&nbsp;&nbsp;FAIL CANDIDATES</td></tr><tr bgcolor=#cafcbb><td colspan=7 align=center>&nbsp;**&nbsp;&nbsp;PASS CANDIDATES</td></tr></table></body></html>";
