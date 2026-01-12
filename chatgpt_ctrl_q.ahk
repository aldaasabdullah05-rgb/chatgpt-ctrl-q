#Requires AutoHotkey v2.0
#SingleInstance Force

; CTRL+Q : cacher / remettre ChatGPT (Windows app WebView2)
^q:: {
    static savedHwnd := 0
    DetectHiddenWindows true

    ; 1) Si on a déjà caché une fenêtre, on essaye de la remettre
    if savedHwnd && WinExist("ahk_id " savedHwnd) {
        WinShow("ahk_id " savedHwnd)
        WinActivate("ahk_id " savedHwnd)
        savedHwnd := 0
        return
    }

    ; 2) Sinon, on cherche la bonne fenêtre (celle dont le titre contient "ChatGPT")
    hwnd := 0
    for h in WinGetList("ahk_exe msedgewebview2.exe") {
        t := WinGetTitle("ahk_id " h)
        if InStr(t, "ChatGPT") {
            hwnd := h
            break
