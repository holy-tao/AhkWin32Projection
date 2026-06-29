#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPRULE {
    #StructPack 8

    pszRuleName : PWSTR

    ulRuleId : UInt32

    dwAttributes : UInt32

}
