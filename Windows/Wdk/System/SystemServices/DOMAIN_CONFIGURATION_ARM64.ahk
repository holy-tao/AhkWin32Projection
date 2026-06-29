#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DOMAIN_CONFIGURATION_ARM64 {
    #StructPack 8

    Ttbr0 : Int64

    Ttbr1 : Int64

    Mair0 : UInt32

    Mair1 : UInt32

    InputSize0 : Int8

    InputSize1 : Int8

    CoherentTableWalks : BOOLEAN

    TranslationEnabled : BOOLEAN

}
