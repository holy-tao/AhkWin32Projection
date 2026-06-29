#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_SEL_BUGCHECK_RECOVERY_STATUS_PHASE2_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    BootId : UInt32

    Success : BOOLEAN

}
