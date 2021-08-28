Windows Terminal has a built-in dropdown mode, but there's no way to passively keep it on in the background at startup. The only way to activate it from my experience is to open an instance of the app, press the hotkey for the dropdown (`` Win+` `` by default) to activate it, press it again to hide it, then close the first instance.

This script does that all in one go, given that `wt.exe` is on the `$PATH`. I've set it as a Startup program since I regularly need the dropdown and manually executing this everytime is inefficient.

PS: This was intended for my personal use only. It should work for others with minimal tweaking of variables (especially `tabName`) but I don't intend to modify my script as it serves my purpose.

### Usage

1. Install [AutoIt3](https://www.autoitscript.com/site/autoit/downloads/)
2. Create an executable from the `wt-dropdown.au3` script using the installed tool
3. Place created executable in your startup directory: `C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp`

### Source

- `wt-dropdown.au3` :

```autoit
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
```
