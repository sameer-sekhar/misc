#!c:/perl/bin/perl

use Win32::ODBC;

print "Content-type:text/html\n\n";
print "<html><head>sam_test</head>";

$sql="select * from test1";
$dsn="perl_access";

$database = new Win32::ODBC($dsn) || print "<br>error";

$database->sql($sql);

print "<br>till here";

print "<body> <h1>the details are </h1><br>";

while($database->FetchRow())
{ 
($eno,$ename,$job,$sal) = $database->Data("EMPNO","ENAME","JOB","SAL");
print "$eno $ename $job $sal";
print "<br>";

}

$database->Close();

print "</body></html>";