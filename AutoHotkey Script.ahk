#CommentFlag ; Change language 
CapsLock::Send, {Shift Down}{Alt Down}{Alt Up}{Shift Up}
GetKeyState("CapsLock", "P"), GetKeyState("Shift", "P") ? "{CapsLock Down}" :"$"
#CommentFlag ; Close window
#+q::Send, {LAlt Down}{F4}
#CommentFlag ; Volume
#+m::Send, {Volume_Mute}
#+=::Send, {Volume_Up 5}
#+-::Send, {Volume_Down 5}
#=::Send, {Volume_Up}
#-::Send, {Volume_Down}
#j::Send, {LAlt Down}{Tab}{LAlt Up}
#;::Send, {LAlt Down}{LShift Down}{Tab Down}{Tab Up}{Alt up}{Shift Up}
