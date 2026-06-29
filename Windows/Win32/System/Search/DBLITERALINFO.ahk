#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
export default struct DBLITERALINFO {
    #StructPack 8

    pwszLiteralValue : PWSTR

    pwszInvalidChars : PWSTR

    pwszInvalidStartingChars : PWSTR

    lt : UInt32

    fSupported : BOOL

    cchMaxLen : UInt32

}
