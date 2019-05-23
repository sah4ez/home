syntax region Tag start=+"caller":"+ end=+"+he=s

syntax region cause start=+"cause":"+ end=+"+he=s

syntax region String start=+"msg":"+ end=+"+he=s

syntax region headerUser start=+"X-User-Id":"+ end=+"+he=s
syntax region headerUser start=+"userID":"+ end=+"+he=s
syntax region headerSession start=+"X-Session-Id":"+ end=+"+he=s
syntax region headerSession start=+"sessID":"+ end=+"+he=s
syntax region headerTrace start=+"X-Trace-Id":"+ end=+"+he=s
syntax region headerTrace start=+"traceID":"+ end=+"+he=s
syntax region headerAuthorization start=+"Authorization":"+ end=+"+he=s

syntax region Comment start=+"details":{+ end=+}+he=s contains=headerAuthorization,headerUser,headerSession,headerTrace


syntax match errorLvl +error+
syntax match warnLvl +warn+
syntax match infoLvl +info+
syntax match debugLvl +debug+

syntax region Constant start=+"level":"+ end=+"+he=s contains=errorLvl,warnLvl,infoLvl,debugLvl

syntax region timestamp start=+"@timestamp":"+ end=+"+he=s

syntax region Error start=+"err":"+ end=+"+he=s

syntax region method start=+"method":"+ end=+"+he=s

hi header ctermfg=51 guifg=lightgreen
hi timestamp ctermfg=51 guifg=lightgrey
hi method ctermfg=30 guifg=orange

hi errorLvl ctermfg=70 guifg=red
hi warnLvl ctermfg=70 guifg=orange
hi infoLvl ctermfg=70 guifg=blue
hi debugLvl ctermfg=70 guifg=SeaGreen

hi headerAuthorization ctermfg=80 guifg=#414141
hi headerUser ctermfg=51 guifg=Green
hi headerSession ctermfg=51 guifg=Yellow
hi headerTrace ctermfg=51 guifg=Cyan

hi cause ctermfg=40 guifg=LightCyan
