#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct HARDWAREHOOKSTRUCT {
    #StructPack 8

    hwnd : HWND

    message : UInt32

    wParam : WPARAM

    lParam : LPARAM

}
