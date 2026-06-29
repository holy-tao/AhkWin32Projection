#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_MEMORY_THROTTLE_SUMMARY_FAILED_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    Status : NTSTATUS

}
