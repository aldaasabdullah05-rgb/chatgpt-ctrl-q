#Requires AutoHotkey v2.0
#SingleInstance Force

; CTRL + Q ferme l'application ChatGPT
^q::
{
    WinGetTitle title, "A"
    if InStr(title, "ChatGPT")
    {
        WinClose("A")
    }
}
