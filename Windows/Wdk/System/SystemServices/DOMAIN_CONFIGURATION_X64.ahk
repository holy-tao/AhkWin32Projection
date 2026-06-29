#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DOMAIN_CONFIGURATION_X64 {
    #StructPack 8

    FirstLevelPageTableRoot : Int64

    TranslationEnabled : BOOLEAN

}
