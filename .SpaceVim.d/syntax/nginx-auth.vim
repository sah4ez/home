syntax region Tag start=+"request":"+ end=+"+he=s

syntax match errorLvl +"\v[4-5]0[0-9]"+
syntax match warnLvl +"\v30[0-9]"+
syntax match debugLvl +"\v20[0-9]"+

syntax region cause start=+"status": "+ end=+"+he=s contains=errorLvl,warnLvl,infoLvl

syntax region String start=+"http_user_agent":"+ end=+"+he=s

syntax region headerUser start=+"x_user_id":"+ end=+"+he=s
syntax region headerSession start=+"x_session_id":"+ end=+"+he=s
syntax region headerTrace start=+"x_trace_id":"+ end=+"+he=s

syntax region timestamp start=+"time_local":"+ end=+"+he=s

hi headerUser ctermfg=51 guifg=Green
hi headerSession ctermfg=51 guifg=Yellow
hi headerTrace ctermfg=51 guifg=Cyan

hi timestamp ctermfg=51 guifg=lightgrey
hi method ctermfg=30 guifg=orange

hi errorLvl ctermfg=70 guifg=red
hi warnLvl ctermfg=70 guifg=orange
hi infoLvl ctermfg=70 guifg=blue
hi debugLvl ctermfg=70 guifg=SeaGreen

hi cause ctermfg=40 guifg=LightCyan
