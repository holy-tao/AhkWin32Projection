#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_ATTEMPT_RECOVERY_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    ErrorHeader : IntPtr

    ArchitecturalRecovery : BOOLEAN

    PshedRecovery : BOOLEAN

    Status : NTSTATUS

}
