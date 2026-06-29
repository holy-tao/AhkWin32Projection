#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPVCONTEXT {
    #StructPack 8

    pCategory : PWSTR

    pBefore : PWSTR

    pAfter : PWSTR

}
