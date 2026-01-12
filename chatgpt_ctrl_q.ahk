#Requires AutoHotkey v2.0
#SingleInstance Force
DetectHiddenWindows true

^q::{
    static hwnd := 0

    ; Si la fenêtre est déjà cachée → on la remet
    if (hwnd && WinExist("ahk_id " hwnd)) {
        WinShow("ahk_id " hwnd)
        WinActivate("ahk_id " hwnd)
        hwnd := 0
        return
    }

    ; Cherche la fenêtre ChatGPT
    for h in WinGetList("ahk_exe msedgewebview2.exe") {
        title := WinGetTitle("ahk_id " h)
        if InStr(title, "ChatGPT") {
            hwnd := h
            WinHide("ahk_id " hwnd)
            return
        }
    }
}
