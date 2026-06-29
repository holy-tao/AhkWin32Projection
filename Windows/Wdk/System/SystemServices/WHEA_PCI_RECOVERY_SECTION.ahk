#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_PCI_RECOVERY_SECTION {
    #StructPack 1

    SignalType : Int8

    RecoveryAttempted : BOOLEAN

    RecoveryStatus : Int8

}
