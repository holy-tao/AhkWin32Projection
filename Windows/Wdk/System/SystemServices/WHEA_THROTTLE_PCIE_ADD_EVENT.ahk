#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_THROTTLE_PCIE_ADD_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    Address : IntPtr

    Mask : UInt32

    Updated : BOOLEAN

    Status : NTSTATUS

}
