#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct SCRIPTFONTINFO {
    #StructPack 8

    scripts : Int64

    wszFont : WCHAR[32]

}
