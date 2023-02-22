USING System.Text.RegularExpressions.*. 
DEFINE VARIABLE regexp                    AS CLASS Regex                    NO-UNDO.
 
// Thanks to @xuanyuanzhiyuan at https://stackoverflow.com/questions/8571501/how-to-check-whether-a-string-is-base64-encoded-or-not
regexp = NEW Regex("^([A-Za-z0-9+/]{4})*([A-Za-z0-9+/]{3}=|[A-Za-z0-9+/]{2}==)?$").

IF regexp:IsMatch("dGVzdGVAZ21haWwuY29t") // Expected to success
THEN MESSAGE "OK!":U VIEW-AS ALERT-BOX TITLE "Info".
ELSE MESSAGE "INVALID!":U VIEW-AS ALERT-BOX ERROR TITLE "Error!".

IF regexp:IsMatch("teste@gmail.com")     // Expected to fail
THEN MESSAGE "OK!":U VIEW-AS ALERT-BOX TITLE "Info".
ELSE MESSAGE "INVALID!":U VIEW-AS ALERT-BOX ERROR TITLE "Error!".
