strComputer = "localhost"

Set objConnection = CreateObject("ADODB.Connection")

objConnection.Open _
    "Provider=SQLOLEDB;Data Source=" & strComputer & ";" & _
        "Trusted_Connection=Yes;Initial Catalog=Master"

Set objRecordset = objConnection.Execute("SELECT Name, is_disabled FROM master.sys.server_principals")
If objRecordset.Recordcount = 0 Then
    Wscript.Echo ""
Else

    Do Until objRecordset.EOF
		Wscript.Echo "<DBUSERS>"
        Wscript.Echo "<NAME>" & objRecordset.Fields("Name") & "</NAME>"
        Wscript.Echo "<IS_DISABLED>" & objRecordset.Fields("is_disabled") & "</IS_DISABLED>"
        objRecordset.MoveNext
		rem objFilename.MoveNext
		Wscript.Echo "</DBUSERS>"
    Loop
End If
