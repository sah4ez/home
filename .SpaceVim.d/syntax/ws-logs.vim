syntax region Tag start=+"caller":"+ end=+"+he=s

syntax region cause start=+"cause":"+ end=+"+he=s

syntax region String start=+"msg":"+ end=+"+he=s

syntax region header start=+"X-User-Id":"+ end=+"+he=s
syntax region header start=+"X-Session-Id":"+ end=+"+he=s

syntax region Comment start=+"details":{+ end=+}+he=s contains=header


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

hi cause ctermfg=40 guifg=LightCyan
