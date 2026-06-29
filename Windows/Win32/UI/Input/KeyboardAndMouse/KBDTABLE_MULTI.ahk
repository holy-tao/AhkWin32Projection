#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KBDTABLE_DESC.ahk" { KBDTABLE_DESC }
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */
export default struct KBDTABLE_MULTI {
    #StructPack 4

    nTables : UInt32

    aKbdTables : KBDTABLE_DESC[8]

}
