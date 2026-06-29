#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHEA_RECOVERY_FAILURE_REASON.ahk" { WHEA_RECOVERY_FAILURE_REASON }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\WHEA_RECOVERY_TYPE.ahk" { WHEA_RECOVERY_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_ERROR_RECOVERY_INFO_SECTION {
    #StructPack 8

    RecoveryKernel : BOOLEAN

    RecoveryAction : IntPtr

    RecoveryType : WHEA_RECOVERY_TYPE

    Irql : Int8

    RecoverySucceeded : BOOLEAN

    FailureReason : WHEA_RECOVERY_FAILURE_REASON

    ProcessName : Int8[20]

}
