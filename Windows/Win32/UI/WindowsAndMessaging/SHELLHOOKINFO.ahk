#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct SHELLHOOKINFO {
    #StructPack 8

    hwnd : HWND

    rc : RECT

}
