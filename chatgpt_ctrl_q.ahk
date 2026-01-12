#Requires AutoHotkey v2.0
#SingleInstance Force
DetectHiddenWindows true

^q::{
    static saved := 0

    ; Si on a déjà caché → on remet
    if saved && WinExist("ahk_id " saved) {
        WinShow("ahk_id " saved)
        WinActivate("ahk_id " saved)
        saved := 0
        return
    }

    ; Sinon on cherche une fenêtre WebView2 dont le titre contient ChatGPT
    for h in WinGetList("ahk_exe msedgewebview2.exe") {
        if InStr(WinGetTitle("ahk_id " h), "ChatGPT") {
            saved := h
            WinHide("ahk_id " h)
            return
        }
    }
}
