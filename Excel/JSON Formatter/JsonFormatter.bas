Attribute VB_Name = "Module1"
Sub test()
Dim regEx As New RegExp
Dim strPattern As String: strPattern = "\,(\s*?[\}\]])" '"^[0-9]{1,2}"
Dim strReplace As String: strReplace = "$1"
Dim strInput As String
'strInput = "The following example macro looks at the value in cell A1 to see if the first 1 or 2 characters are digits. If so, they are removed and the rest of the string is displayed"
'strInput = "12Sam"
strInput = "{" & vbNewLine & vbTab & "'key1':'value1'," & vbNewLine & vbTab & "'key2':'value2'," & vbNewLine & vbTab & "'key3':{" & vbNewLine & vbTab & vbTab & "'key4':'value4'," & vbNewLine & vbTab & vbTab & "'key5':'value5'," & vbNewLine & vbTab & "}," & vbNewLine & vbTab & "'key6':[" & vbNewLine & vbTab & vbTab & "'val1'," & vbNewLine & vbTab & vbTab & "'val2'," & vbNewLine & vbTab & "]," & vbNewLine & "}"
Debug.Print strInput
Debug.Print "####################################"
With regEx
    .Global = True
    .MultiLine = True
    .IgnoreCase = False
    .Pattern = strPattern
End With

If regEx.test(strInput) Then
    Debug.Print regEx.Replace(strInput, strReplace)
Else
    Debug.Print "Not matched"
End If
'Debug.Print "hello"
End Sub

