#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_SEL_BUGCHECK_RECOVERY_STATUS_MULTIPLE_BUGCHECK_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    IsBugcheckOwner : BOOLEAN

    RecursionCount : Int8

    IsBugcheckRecoveryOwner : BOOLEAN

}
