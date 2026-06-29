#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct RFC1766INFO {
    #StructPack 4

    lcid : UInt32

    wszRfc1766 : WCHAR[6]

    wszLocaleName : WCHAR[32]

}
