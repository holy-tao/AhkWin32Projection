#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

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
