#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KE_PROCESSOR_CHANGE_NOTIFY_STATE.ahk" { KE_PROCESSOR_CHANGE_NOTIFY_STATE }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KE_PROCESSOR_CHANGE_NOTIFY_CONTEXT {
    #StructPack 8

    State : KE_PROCESSOR_CHANGE_NOTIFY_STATE

    NtNumber : UInt32

    Status : NTSTATUS

    ProcNumber : IntPtr

}
