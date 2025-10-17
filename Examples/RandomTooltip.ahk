#Requires AutoHotkey v2.0

#Include ..\Windows\Win32\UI\Controls\TOOLTIP_FLAGS.ahk
#Include ..\Windows\Win32\UI\Controls\TTTOOLINFOW.ahk
#Include ..\Windows\Win32\UI\Controls\NMTTDISPINFOW.ahk
#Include ..\Windows\Win32\UI\Controls\Apis.ahk
#Include ..\Windows\Win32\UI\WindowsAndMessaging\Apis.ahk
#Include ..\Windows\Win32\UI\WindowsAndMessaging\WINDOW_STYLE.ahk

;Demonstrates setting a tooltip for a control and handling the GETDISPINFO callback to
;provide a random tooltip value
;https://learn.microsoft.com/en-us/windows/win32/controls/create-a-tooltip-for-a-control

testGui := Gui("+Resize", "Example Gui")
btn := testGui.AddButton("", "I've got a tooltip!")

hTip := CreateTipWindow(btn.Hwnd)
toolInfo := CreateToolInfo(testGui.Hwnd, btn.Hwnd)

OnMessage(WindowsAndMessaging.WM_NOTIFY, OnNotifyHandler)
SendMessage(Controls.TTM_ADDTOOLW, 0, toolInfo, hTip.value)

testGui.Show()

;TTN_GETDISPINFOW comes from the tooltip window, not an AHK control, so we can't
;use OnNotify
OnNotifyHandler(wParam, lParam, msg, hwnd){
    static tooltips := [
        "The quick brown fox jumps over the lazy dog",
        "Sphinx of black quartz, judge my vows",
        "Boxers had zap of gay jock love, quit women",
        "Watch `"Jeopardy!`", Alex Trebek's fun TV quiz game"
    ]

    ;TTN_GETDISPINFOW from our tooltip?
    header := NMHDR(lParam)
    if(header.hwndFrom.value != hTip.value || header.code != Controls.TTN_GETDISPINFOW)
        return 0
    
    ;After checking the notification code, we know it's safe to "cast" header
    ;header is still valid, and points to the same memory location as dispInfo
    dispInfo := NMTTDISPINFOW(lParam)
    dispInfo.szText := tooltips[Random(1, tooltips.Length)]
    return 1
}

CreateToolInfo(hParent, hTip){
    static LPSTR_TEXTCALLBACK := -1

    ;Look ma, no NumPut!
    toolInfo := TTTOOLINFOW()
    toolInfo.uFlags := TOOLTIP_FLAGS.TTF_IDISHWND | TOOLTIP_FLAGS.TTF_SUBCLASS
    toolInfo.hwnd.value := hParent
    toolInfo.uId := hTip
    toolInfo.lpszText := LPSTR_TEXTCALLBACK

    return toolInfo
}

CreateTipWindow(forHwnd){
    return WindowsAndMessaging.CreateWindowExW(
        0, 
        "tooltips_class32",
        0, 
        WINDOW_STYLE.WS_POPUP | Controls.TTS_ALWAYSTIP, 
        WindowsAndMessaging.CW_USEDEFAULT, 
        WindowsAndMessaging.CW_USEDEFAULT, 
        WindowsAndMessaging.CW_USEDEFAULT, 
        WindowsAndMessaging.CW_USEDEFAULT, 
        forHwnd, 
        0, 
        0, 
        0
    )
}

