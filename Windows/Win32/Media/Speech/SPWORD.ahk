#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPWORDTYPE.ahk" { SPWORDTYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SPWORDPRONUNCIATION.ahk" { SPWORDPRONUNCIATION }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPWORD {
    #StructPack 8

    pNextWord : SPWORD.Ptr

    LangID : UInt16

    wReserved : UInt16

    eWordType : SPWORDTYPE

    pszWord : PWSTR

    pFirstWordPronunciation : SPWORDPRONUNCIATION.Ptr

}
