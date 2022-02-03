ARRAY TEXT:C222($anames; 0)
ARRAY TEXT:C222($avalues; 0)
WEB GET VARIABLES:C683($anames; $avalues)

ARRAY TEXT:C222($hnames; 0)
ARRAY TEXT:C222($hvalues; 0)
WEB GET HTTP HEADER:C697($hnames; $hvalues)

$value:=$avalues{Find in array:C230($anames; "button")}

WEB SEND TEXT:C677($value; "text/plain")