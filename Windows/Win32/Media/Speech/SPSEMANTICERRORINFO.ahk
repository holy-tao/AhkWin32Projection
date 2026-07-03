#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPSEMANTICERRORINFO {
    #StructPack 8

    ulLineNumber : UInt32

    pszScriptLine : PWSTR

    pszSource : PWSTR

    pszDescription : PWSTR

    hrResultCode : HRESULT

}
