#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\WPARAM.ahk" { WPARAM }
#Import "..\..\..\Foundation\LPARAM.ahk" { LPARAM }

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct TRANSMSG {
    #StructPack 8

    message : UInt32

    wParam : WPARAM

    lParam : LPARAM

}
