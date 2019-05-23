syntax region Tag start=+{"+ end=+}+he=s
syntax region Tag start=+apiSended}: {\n+ end=+}\n+he=s
syntax match Tag +{}+

syntax match cause +\v(SOCKET DISCONNECTED)+
syntax match String +\v(did connect|socket state connected)+

syntax region String start=+\v(GET|POST|PATCH|PUT|DELETE)+ end=+\n+he=s

syntax region headerUser start=+userId:+ end=+\v("\)|\n)+he=s
syntax region headerSession start=+"X-Session-Id" = "+ end=+"+he=s
syntax region headerSession start=+session + end=+\n+he=s
syntax region headerTrace start=+x-trace-id: + end=+\n+he=s
syntax region headerAuthorization start=+Authorization =+ end=+";+he=s
syntax region headerAuthorization start=+FirebaseAuthenticationService+ end=+\n+he=s

syntax region Comment start=+"details":{+ end=+}+he=s contains=header

syntax match errorLvl +ERR+
syntax match errorLvl +\v (4|5)[0-9]{2} +
syntax match errorLvl +\v(did disconnect with error|session exists|Invalid HTTP upgrade)+
syntax match warnLvl +INF+
syntax match infoLvl +info+
syntax match debugLvl +debug+
syntax match debugLvl +\v 2[0-9]{2} +

syntax region Constant start=+"level":"+ end=+"+he=s contains=errorLvl,warnLvl,infoLvl,debugLvl

syntax match timestamp "\v[0-9]{4}/[0-9]{2}/[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}:[0-9]{3}"

syntax region Error start=+"err":"+ end=+"+he=s

syntax region method start=+"method":"+ end=+"+he=s

hi header ctermfg=51 guifg=lightgreen
hi timestamp ctermfg=51 guifg=lightgrey
hi method ctermfg=30 guifg=orange

hi errorLvl ctermfg=70 guifg=red
hi warnLvl ctermfg=70 guifg=orange
hi infoLvl ctermfg=70 guifg=blue
hi debugLvl ctermfg=70 guifg=SeaGreen

hi headerUser ctermfg=51 guifg=Green
hi headerSession ctermfg=51 guifg=Yellow
hi headerTrace ctermfg=51 guifg=Cyan
hi headerAuthorization ctermfg=80 guifg=#414141

hi cause ctermfg=40 guifg=LightCyan
