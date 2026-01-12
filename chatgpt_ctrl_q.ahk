#Requires AutoHotkey v2.0
#SingleInstance Force

^q:: {
    static saved := 0
    DetectHiddenWindows true

    if saved && WinExist("ahk_id " saved) {
        WinShow("ahk_id " saved)
        WinActivate("ahk_id " saved)
        saved := 0
        return
    }

    hwnd := 0
    for h in WinGetList("ahk_exe msedgewebview2.exe")
        if InStr(WinGetTitle("ahk_id " h), "ChatGPT")
            hwnd := h

    if !hwnd
        return

    saved := hwnd
    WinHide("ahk_id " hwnd)
}

