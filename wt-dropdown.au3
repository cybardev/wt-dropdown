; variables to change
$termName = "wt.exe"  ; terminal program
$tabName = "Kali"     ; default tab name
$hotKey = "#`"        ; dropdown hotkey

; start terminal and trigger dropdown
Run($termName)
WinWaitActive($tabName)
Send($hotKey)
WinWaitActive($tabName)

; check for dropdown
If WinGetPos($tabName)[0] < 0 Then
	; hide dropdown then close window
	Send($hotKey)
	WinWaitActive($tabName)
	WinClose($tabName)
Else
	; close window then hide dropdown
	WinClose($tabName)
	WinWaitActive($tabName)
	Send($hotKey)
EndIf
