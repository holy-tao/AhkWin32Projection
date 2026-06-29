#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct MIMECSETINFO {
    #StructPack 4

    uiCodePage : UInt32

    uiInternetEncoding : UInt32

    wszCharset : WCHAR[50]

}
