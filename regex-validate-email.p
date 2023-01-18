USING System.Text.RegularExpressions.*. 
DEFINE VARIABLE regexp                    AS CLASS Regex                    NO-UNDO.
 
// REGEX PARA VALIDAR E-MAIL
regexp = NEW Regex("^[^\x00-\x1F^\(^\)^\<^\>^\@^\,^\;^\:^\\^\~"^\.^\[^\]^\s]+(\.[^\x00-\x1F^\(^\)^\<^\>^\@^\,^\;^\:^\\^\~"^\.^\[^\]^\s]+)*@([^\x00-\x1F^\(^\)^\<^\> ^\@^\,^\;^\:^\\^\~"^\.^\[^\]^\s]+(\.[^\x00-\x1F^\(^\)^\<^\>^\@^\,^\;^\:^\\^\~"^\.^\[^\]^\s]+))+$").

IF regexp:IsMatch("teste@gmail.com")
THEN MESSAGE "OK!":U VIEW-AS ALERT-BOX TITLE "Info".
ELSE MESSAGE "INVALID!":U VIEW-AS ALERT-BOX ERROR TITLE "Error!".

IF regexp:IsMatch("teste@gmail")
THEN MESSAGE "OK!":U VIEW-AS ALERT-BOX TITLE "Info".
ELSE MESSAGE "INVALID!":U VIEW-AS ALERT-BOX ERROR TITLE "Error!".
