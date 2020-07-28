#!c:/perl/bin/perl

use Win32::ODBC;

$dsn="perl_exam";

$database = new Win32::ODBC($dsn) || print "<br>error";

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

<br><br><h2>Brain-World Academy for Competitive Examination ( BACE )</h2> <br><br>

<table border=2 width=\"100\%\" height=\"100\%\">

<tr bgcolor=beige>
<td align=center><font color=brown><b>Serial No :</b></font></td>
<td align=center><font color=brown><b>Name</b></font></td>
<td align=center><font color=brown><b>User Id</b></font></td>
<td align=center><font color=brown><b>Registration No:</b></font></td>
<td align=center><font color=brown><b>Subject</b></font></td>
<td align=center><font color=brown><b>Marks</b></font></td>
<td align=center><font color=brown><b>Grade</b></font></td>
</tr>";

$sql2="select * from try_marks";
$database->sql($sql2);
while($database->FetchRow())
{ 
	($nam1,$uid1,$reg_no1,$sub1,$mar1) = $database->Data("nam","u_id","reg_no","sub","mar");
	$count++;
	if($mar1>90){$grade="A";}
	elsif($mar1>80){$grade="B";}
	elsif($mar1>70){$grade="C";}
	elsif($mar1>60){$grade="D";}
	else{$grade="F";}
	$bg="#cafcbb";
	if($grade eq "F")
	{
		$bg="white";
	}
	
	print"<tr bgcolor=$bg>
<td align=center>$count</td>
<td align=center>$nam1</td>
<td align=center>$uid1</td>
<td align=center>$reg_no1</td>
<td align=center>$sub1</td>
<td align=center>$mar1</td>
<td align=center>$grade</td>
</tr>";
}

print"<tr bgcolor=beige>
<td colspan=7>&nbsp;</td>
</tr>
<tr bgcolor=white>
<td colspan=7 align=center>&nbsp;**&nbsp;&nbsp;FAIL CANDIDATES</td>
</tr>
<tr bgcolor=#cafcbb>
<td colspan=7 align=center>&nbsp;**&nbsp;&nbsp;PASS CANDIDATES</td>
</tr>

</table>

<hr color=\"#64a8ae\"><br>
         <h4>Back to <a href=\"homepage.htm\">HOME</a></h4>
</body></html>";
