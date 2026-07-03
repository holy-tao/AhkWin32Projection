#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @charset ANSI
 */
export default struct MCI_ANIM_OPEN_PARMSA {
    #StructPack 8

    dwCallback : IntPtr

    wDeviceID : UInt32

    lpstrDeviceType : PSTR

    lpstrElementName : PSTR

    lpstrAlias : PSTR

    dwStyle : UInt32

    hWndParent : HWND

}
