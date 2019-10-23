strComputer = "localhost"

Set objConnection = CreateObject("ADODB.Connection")

objConnection.Open _
    "Provider=SQLOLEDB;Data Source=" & strComputer & ";" & _
        "Trusted_Connection=Yes;Initial Catalog=Master"

Set objRecordset = objConnection.Execute("SELECT name, create_date, modify_date, default_database_name FROM master.sys.server_principals WHERE TYPE NOT IN ('A', 'G', 'R', 'X', 'U', 'C')")
If objRecordset.Recordcount = 0 Then
    Wscript.Echo ""
Else

    Do Until objRecordset.EOF
		Wscript.Echo "<DBUSERS>"
        Wscript.Echo "<NAME>" & objRecordset.Fields("name") & "</NAME>"
		Wscript.Echo "<CREATE_DATE>" & objRecordset.Fields("create_date") &  "</CREATE_DATE>"
		Wscript.Echo "<MODIFY_DATE>" & objRecordset.Fields("modify_date") & "</MODIFY_DATE>"
		Wscript.Echo "<DEFAULT_DATABASE_NAME>" & objRecordset.Fields("default_database_name") &  "</DEFAULT_DATABASE_NAME>"
        objRecordset.MoveNext
		rem objFilename.MoveNext
		Wscript.Echo "</DBUSERS>"
    Loop


End If
