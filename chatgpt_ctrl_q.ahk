#Requires AutoHotkey v2.0
#SingleInstance Force

; CTRL + Q = cacher / remettre l'application ChatGPT (Windows app)
^q:: {
    DetectHiddenWindows true

    ; ChatGPT Windows utilise WebView2
    hwnd := WinExist("ahk_exe msedgewebview2.exe")

    if !hwnd
        return

    if DllCall("IsWindowVisible", "ptr", hwnd, "int") {
        WinHide("ahk_id " hwnd)
    } else {
        WinShow("ahk_id " hwnd)
        WinActivate("ahk_id " hwnd)
    }
}
