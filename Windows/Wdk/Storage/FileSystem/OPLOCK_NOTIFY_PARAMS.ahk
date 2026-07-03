#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\IRP.ahk" { IRP }
#Import ".\OPLOCK_NOTIFY_REASON.ahk" { OPLOCK_NOTIFY_REASON }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct OPLOCK_NOTIFY_PARAMS {
    #StructPack 8

    NotifyReason : OPLOCK_NOTIFY_REASON

    NotifyContext : IntPtr

    Irp : IRP.Ptr

    Status : NTSTATUS

}
