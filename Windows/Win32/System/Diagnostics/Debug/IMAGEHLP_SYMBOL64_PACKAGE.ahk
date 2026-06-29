#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMAGEHLP_SYMBOL64.ahk" { IMAGEHLP_SYMBOL64 }
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGEHLP_SYMBOL64_PACKAGE {
    #StructPack 8

    sym : IMAGEHLP_SYMBOL64

    name : CHAR[2001]

}
