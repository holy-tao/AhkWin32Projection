#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */
export default struct VK_TO_WCHARS10 {
    #StructPack 2

    VirtualKey : Int8

    Attributes : Int8

    wch : WCHAR[10]

}
