#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\Win32\Foundation\UNICODE_STRING.ahk
#Include ..\..\Win32\System\Kernel\LIST_ENTRY.ahk

/**
 * @namespace Windows.Wdk.Foundation
 * @version v4.0.30319
 */
class FILE_OBJECT extends Win32Struct
{
    static sizeof => 184

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 2, "short")
        set => NumPut("short", value, this, 2)
    }

    /**
     * @type {Pointer<DEVICE_OBJECT>}
     */
    DeviceObject {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<VPB>}
     */
    Vpb {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Void>}
     */
    FsContext {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Void>}
     */
    FsContext2 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<SECTION_OBJECT_POINTERS>}
     */
    SectionObjectPointer {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<Void>}
     */
    PrivateCacheMap {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {NTSTATUS}
     */
    FinalStatus {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {Pointer<FILE_OBJECT>}
     */
    RelatedFileObject {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {BOOLEAN}
     */
    LockOperation {
        get => NumGet(this, 72, "char")
        set => NumPut("char", value, this, 72)
    }

    /**
     * @type {BOOLEAN}
     */
    DeletePending {
        get => NumGet(this, 73, "char")
        set => NumPut("char", value, this, 73)
    }

    /**
     * @type {BOOLEAN}
     */
    ReadAccess {
        get => NumGet(this, 74, "char")
        set => NumPut("char", value, this, 74)
    }

    /**
     * @type {BOOLEAN}
     */
    WriteAccess {
        get => NumGet(this, 75, "char")
        set => NumPut("char", value, this, 75)
    }

    /**
     * @type {BOOLEAN}
     */
    DeleteAccess {
        get => NumGet(this, 76, "char")
        set => NumPut("char", value, this, 76)
    }

    /**
     * @type {BOOLEAN}
     */
    SharedRead {
        get => NumGet(this, 77, "char")
        set => NumPut("char", value, this, 77)
    }

    /**
     * @type {BOOLEAN}
     */
    SharedWrite {
        get => NumGet(this, 78, "char")
        set => NumPut("char", value, this, 78)
    }

    /**
     * @type {BOOLEAN}
     */
    SharedDelete {
        get => NumGet(this, 79, "char")
        set => NumPut("char", value, this, 79)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {UNICODE_STRING}
     */
    FileName{
        get {
            if(!this.HasProp("__FileName"))
                this.__FileName := UNICODE_STRING(88, this)
            return this.__FileName
        }
    }

    /**
     * @type {Integer}
     */
    CurrentByteOffset {
        get => NumGet(this, 104, "int64")
        set => NumPut("int64", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    Waiters {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    Busy {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * @type {Pointer<Void>}
     */
    LastLock {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<KEVENT>}
     */
    Lock {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {Pointer<KEVENT>}
     */
    Event {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * @type {Pointer<IO_COMPLETION_CONTEXT>}
     */
    CompletionContext {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * @type {Pointer}
     */
    IrpListLock {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {LIST_ENTRY}
     */
    IrpList{
        get {
            if(!this.HasProp("__IrpList"))
                this.__IrpList := LIST_ENTRY(160, this)
            return this.__IrpList
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    FileObjectExtension {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }
}
