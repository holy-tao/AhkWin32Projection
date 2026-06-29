#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct MIMECPINFO {
    #StructPack 4

    dwFlags : UInt32

    uiCodePage : UInt32

    uiFamilyCodePage : UInt32

    wszDescription : WCHAR[64]

    wszWebCharset : WCHAR[50]

    wszHeaderCharset : WCHAR[50]

    wszBodyCharset : WCHAR[50]

    wszFixedWidthFont : WCHAR[32]

    wszProportionalFont : WCHAR[32]

    bGDICharset : Int8

}
