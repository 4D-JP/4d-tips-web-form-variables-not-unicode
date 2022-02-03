//%attributes = {}
/*

problem: 

web character set in NOT utf-8
the HTML form does not explicitly specifiy accept-charset=""
the browser sends the form using the same charset as the server 
which is Shift_JIS in this case
in past versions, the web server would parse web form variables using its web character set
in v19, it always uses utf-8, regardless of the web character set
(web character set is applied to outgoing page only, not incoming form)
so the command WEB GET FORM V. fails

*/

C_TEXT:C284($charset)
WEB GET OPTION:C1209(Web character set:K73:6; $charset)

ASSERT:C1129($charset="Shift_JIS")

$html:="<!DOCTYPE html>"+\
"<html lang=\"ja\"><head><meta charset=\"$4dtext($1)\">"+\
"</head><body><h1>TEST</h1>"+\
"<p><form action=\"/test\" method=\"POST\">"+\
"<input  type=\"submit\" name=\"button\" value=\"あいうえお\">"+\
"</form></p>"+\
"</body></html>"

PROCESS 4D TAGS:C816($html; $html; $charset)

Folder:C1567(fk web root folder:K87:15).file($charset+".html").setText($html; $charset)

OPEN URL:C673("http://localhost/"+$charset+".html")