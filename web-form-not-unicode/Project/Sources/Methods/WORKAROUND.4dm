//%attributes = {}
/*

problem: 

here we set explicitly specifiy accept-charset="utf-8"
even though the web character set is not utf-8 (it is Shift_JIS)
this works in v19 because we are asking the browser to send utf-8 from a Shift_JIS page
so the command WEB GET FORM V. succeeds

*/

C_TEXT:C284($charset)
WEB GET OPTION:C1209(Web character set:K73:6; $charset)

ASSERT:C1129($charset="Shift_JIS")

$html:="<!DOCTYPE html>"+\
"<html lang=\"ja\"><head><meta charset=\"$4dtext($1)\">"+\
"</head><body><h1>TEST</h1>"+\
"<p><form action=\"/test\" method=\"POST\" accept-charset=\"utf-8\">"+\
"<input  type=\"submit\" name=\"button\" value=\"あいうえお\">"+\
"</form></p>"+\
"</body></html>"

PROCESS 4D TAGS:C816($html; $html; $charset)

Folder:C1567(fk web root folder:K87:15).file($charset+".html").setText($html; $charset)

OPEN URL:C673("http://localhost/"+$charset+".html")