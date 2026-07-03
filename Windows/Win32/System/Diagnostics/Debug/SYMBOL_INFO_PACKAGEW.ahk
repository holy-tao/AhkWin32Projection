#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SYMBOL_INFOW.ahk" { SYMBOL_INFOW }
#Import ".\SYMBOL_INFO_FLAGS.ahk" { SYMBOL_INFO_FLAGS }
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @charset Unicode
 */
export default struct SYMBOL_INFO_PACKAGEW {
    #StructPack 8

    si : SYMBOL_INFOW

    name : WCHAR[2001]

}
