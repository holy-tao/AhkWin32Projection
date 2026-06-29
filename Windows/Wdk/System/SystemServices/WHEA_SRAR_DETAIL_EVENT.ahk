#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_SRAR_DETAIL_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    RecoveryContextFlags : UInt32

    RecoveryContextPa : Int64

    PageOfflineStatus : NTSTATUS

    KernelConsumerError : BOOLEAN

}
