#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\UI\WindowsAndMessaging\HICON.ahk" { HICON }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PROPSHEETUI_GETICON_INFO {
    #StructPack 8

    cbSize : UInt16 := this.Size

    Flags : UInt16

    cxIcon : UInt16

    cyIcon : UInt16

    hIcon : HICON

}
