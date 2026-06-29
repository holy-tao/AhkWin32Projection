#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */
export default struct KBDTABLE_DESC {
    #StructPack 4

    wszDllName : WCHAR[32]

    dwType : UInt32

    dwSubType : UInt32

}
