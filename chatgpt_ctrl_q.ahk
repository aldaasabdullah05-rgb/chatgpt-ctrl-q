#Requires AutoHotkey v2.0
#SingleInstance Force

; CTRL + Q ferme l'application ChatGPT (fenêtre active)
^q:: {
    try {
        title := WinGetTitle("A")
        if InStr(title, "ChatGPT")
            WinClose("A")
    }
}
