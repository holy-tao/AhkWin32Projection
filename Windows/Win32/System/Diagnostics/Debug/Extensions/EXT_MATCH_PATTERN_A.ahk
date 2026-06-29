#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct EXT_MATCH_PATTERN_A {
    #StructPack 8

    Str : PSTR

    Pattern : PSTR

    CaseSensitive : UInt32

}
