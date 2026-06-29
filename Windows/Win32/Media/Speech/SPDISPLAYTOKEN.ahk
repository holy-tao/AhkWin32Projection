#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPDISPLAYTOKEN {
    #StructPack 8

    pszLexical : PWSTR

    pszDisplay : PWSTR

    bDisplayAttributes : Int8

}
