#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct SCRIPTINFO {
    #StructPack 4

    ScriptId : Int8

    uiCodePage : UInt32

    wszDescription : WCHAR[48]

    wszFixedWidthFont : WCHAR[32]

    wszProportionalFont : WCHAR[32]

}
