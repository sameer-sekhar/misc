function cardvalidation(f)
{
   if (f.bname.value=="")
   {
	alert("Please enter the name of the bank before submitting. Thanks!");
	f.bname.focus(); 
   }
  else
  { 
   if ((f.bname.value=="ICICI")|(f.bname.value=="icici")|(f.bname.value=="HDFC")|(f.bname.value=="hdfc")|(f.bname.value=="SBI")|(f.bname.value=="sbi"))
   {
     if(f.cno.value=="")
     {
	alert ("Please Enter atleast the fake credit card number if not the real one");
	f.cno.focus();
     }
     else
     {
	a=window.open("","window1","toolbar=no,menubar=no,status=no,size=2");
	
	a.document.write("<center><h2>Welcome to the world of gambling <h1>" + f.nam.value + " !</h1></h2></center>");
	a.document.bgColor="#aaffdd";
	a.document.write("<center><a href=gambling.html>Click here to Play</a></center>");
     }
   }
   else
   {
      alert ("Sorry! We do not deal with this bank. But you Please Keep enjoying our other features. Thanks!");
   }
  }
}

function constamount(f)
{
	alert(" Sorry! You can not change this amount. This is the price you have to pay to dare");
	f.amt.value="Rs    100";
}