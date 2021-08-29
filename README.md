# Windows Terminal Dropdown

## Automatically activate the built-in dropdown mode of Windows Terminal

![windows-terminal](https://user-images.githubusercontent.com/50134239/131228634-f663d656-3826-4cd7-a440-b97ba729bc7b.png)

Windows Terminal has a built-in dropdown mode, but there's no way to passively keep it on in the background at startup. The only way to activate it from my experience is to open an instance of the app, press the hotkey for the dropdown (`` Win+` `` by default) to activate it, press it again to hide it, then close the first instance.

This script does that all in one go, given that `wt.exe` is on the `$PATH`. I've set it as a Startup program since I regularly need the dropdown and manually executing this everytime is inefficient.

PS: This was intended for my personal use only. It may or may not work for you. Please use at your own discretion.

### Usage

1. [Download](https://github.com/cybardev/wt-dropdown/releases/download/v1.0/wt-dropdown.au3) the `wt-dropdown.au3` script
2. Edit the `tabName` variable in the script to the default tab name of your Windows Terminal
3. Make any other changes you may want
4. Install according to the instructions below

### Install

1. Install [AutoIt3](https://www.autoitscript.com/site/autoit/downloads/)
2. Create an executable from the `wt-dropdown.au3` script using the installed tool
3. Place created executable in your startup directory: `C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp`

### Source

- `wt-dropdown.au3` :

<pre><code class="lang-autoit line-numbers">; variables to change
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
</code></pre><br />

### Credits

Windows Terminal icon taken from the [Microsoft/Terminal](https://github.com/Microsoft/Terminal) GitHub repository.

### License

Script and website content: [GPLv3](https://github.com/cybardev/wt-dropdown/blob/main/LICENSE)

Windows Terminal icon and the Jekyll theme for this website have different license terms. Please check them out at their official repositories.
