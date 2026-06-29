#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct DROPSTRUCT {
    #StructPack 8

    hwndSource : HWND

    hwndSink : HWND

    wFmt : UInt32

    dwData : IntPtr

    ptDrop : POINT

    dwControlData : UInt32

}
