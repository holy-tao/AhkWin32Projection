#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPSHORTCUTTYPE.ahk" { SPSHORTCUTTYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPSHORTCUTPAIR {
    #StructPack 8

    pNextSHORTCUTPAIR : SPSHORTCUTPAIR.Ptr

    LangID : UInt16

    shType : SPSHORTCUTTYPE

    pszDisplay : PWSTR

    pszSpoken : PWSTR

}
