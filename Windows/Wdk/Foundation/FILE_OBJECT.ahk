#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\VPB.ahk" { VPB }
#Import "..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\SECTION_OBJECT_POINTERS.ahk" { SECTION_OBJECT_POINTERS }
#Import ".\IO_COMPLETION_CONTEXT.ahk" { IO_COMPLETION_CONTEXT }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct FILE_OBJECT {
    #StructPack 8

    Type : Int16

    Size : Int16

    __DeviceObject_ptr : IntPtr
    DeviceObject {
        get => (addr := this.__DeviceObject_ptr) ? DEVICE_OBJECT.At(addr) : unset
        set => this.__DeviceObject_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    __Vpb_ptr : IntPtr
    Vpb {
        get => (addr := this.__Vpb_ptr) ? VPB.At(addr) : unset
        set => this.__Vpb_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    FsContext : IntPtr

    FsContext2 : IntPtr

    SectionObjectPointer : SECTION_OBJECT_POINTERS.Ptr

    PrivateCacheMap : IntPtr

    FinalStatus : NTSTATUS

    RelatedFileObject : FILE_OBJECT.Ptr

    LockOperation : BOOLEAN

    DeletePending : BOOLEAN

    ReadAccess : BOOLEAN

    WriteAccess : BOOLEAN

    DeleteAccess : BOOLEAN

    SharedRead : BOOLEAN

    SharedWrite : BOOLEAN

    SharedDelete : BOOLEAN

    Flags : UInt32

    FileName : IntPtr

    CurrentByteOffset : Int64

    Waiters : UInt32

    Busy : UInt32

    LastLock : IntPtr

    Lock : IntPtr

    Event : IntPtr

    CompletionContext : IO_COMPLETION_CONTEXT.Ptr

    IrpListLock : IntPtr

    IrpList : IntPtr

    FileObjectExtension : IntPtr

}
