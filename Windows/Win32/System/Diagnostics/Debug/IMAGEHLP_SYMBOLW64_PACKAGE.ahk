#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMAGEHLP_SYMBOLW64.ahk" { IMAGEHLP_SYMBOLW64 }
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGEHLP_SYMBOLW64_PACKAGE {
    #StructPack 8

    sym : IMAGEHLP_SYMBOLW64

    name : WCHAR[2001]

}
