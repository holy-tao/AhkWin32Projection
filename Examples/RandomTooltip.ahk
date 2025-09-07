#Requires AutoHotkey v2.0

#Include ..\Windows\Win32\UI\Controls\TOOLTIP_FLAGS.ahk
#Include ..\Windows\Win32\UI\Controls\TTTOOLINFOW.ahk
#Include ..\Windows\Win32\UI\Controls\NMTTDISPINFOW.ahk

;Demonstrates setting a tooltip for a control and handling the GETDISPINFO callback to
;provide a random tooltip value
;https://learn.microsoft.com/en-us/windows/win32/controls/create-a-tooltip-for-a-control

TTN_GETDISPINFOW := 4294966766    ;(TTN_FIRST := 0u-520u) - 10u

testGui := Gui("+Resize", "Example Gui")
btn := testGui.AddButton("", "I've got a tooltip!")

hTip := CreateTipWindow(btn.Hwnd)
toolInfo := CreateToolInfo(testGui.Hwnd, btn.Hwnd)

OnMessage(WM_NOTIFY := 0x4E, OnNotifyHandler)
SendMessage(TTM_ADDTOOLW := 0x0432, 0, toolInfo, hTip)

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
    if(header.hwndFrom != hTip || header.code != TTN_GETDISPINFOW)
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
    toolInfo.hwnd := hParent
    toolInfo.uId := hTip
    toolInfo.lpszText := LPSTR_TEXTCALLBACK

    return toolInfo
}

CreateTipWindow(forHwnd){
    static TTS_ALWAYSTIP := 0x0001
    static WS_POPUP := 0x80000000
    static CW_USEDEFAULT := 0x80000000

    ;https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-createwindowexw
    hTip := DllCall("CreateWindowExW", 
        "UInt", 0, 
        "Str", "tooltips_class32", 
        "Ptr", 0, 
        "UInt", WS_POPUP | TTS_ALWAYSTIP,
        "Int", CW_USEDEFAULT, 
        "Int", CW_USEDEFAULT, 
        "Int", CW_USEDEFAULT, 
        "Int", CW_USEDEFAULT, 
        "Ptr", testGui.Hwnd, 
        "Ptr", 0, 
        "Ptr", 0, 
        "Ptr", 0, 
        "UPtr")

    if(!hTip){
        throw OSError(, , "Failed to create tooltip window")
    }

    return hTip
}

