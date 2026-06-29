#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */
export default struct LIGATURE4 {
    #StructPack 2

    VirtualKey : Int8

    ModificationNumber : UInt16

    wch : WCHAR[4]

}
