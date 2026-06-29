#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SPWORDHANDLE.ahk" { SPWORDHANDLE }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPWORDENTRY {
    #StructPack 8

    hWord : SPWORDHANDLE

    LangID : UInt16

    pszDisplayText : PWSTR

    pszLexicalForm : PWSTR

    aPhoneId : IntPtr

    pvClientContext : IntPtr

}
