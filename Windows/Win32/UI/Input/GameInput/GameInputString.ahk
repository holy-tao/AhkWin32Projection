#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputString {
    #StructPack 8

    sizeInBytes : UInt32

    codePointCount : UInt32

    data : PSTR

}
