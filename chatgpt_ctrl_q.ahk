#Requires AutoHotkey v2.0
#SingleInstance Force

; CTRL + Q : cacher / remettre ChatGPT
^q:: {
    DetectHiddenWindows true
    hwnd := WinExist("ChatGPT")

    if !hwnd
        return

    if WinGetMinMax("ahk_id " hwnd) = -1 {
        WinShow("ahk_id " hwnd)
        WinActivate("ahk_id " hwnd)
    } else {
        WinHide("ahk_id " hwnd)
    }
}
