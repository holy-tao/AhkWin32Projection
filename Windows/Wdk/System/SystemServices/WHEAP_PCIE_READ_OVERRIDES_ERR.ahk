#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_PCIE_READ_OVERRIDES_ERR {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    FailureReason : UInt32

    FailureStatus : NTSTATUS

}
