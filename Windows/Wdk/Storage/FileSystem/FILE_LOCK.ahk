#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_LOCK extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Pointer<PCOMPLETE_LOCK_IRP_ROUTINE>}
     */
    CompleteLockIrpRoutine {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<PUNLOCK_ROUTINE>}
     */
    UnlockRoutine {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {BOOLEAN}
     */
    FastIoIsQuestionable {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Array<BOOLEAN>}
     */
    SpareC{
        get {
            if(!this.HasProp("__SpareCProxyArray"))
                this.__SpareCProxyArray := Win32FixedArray(this.ptr + 17, 3, Primitive, "char")
            return this.__SpareCProxyArray
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    LockInformation {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<FILE_LOCK_INFO>}
     */
    LastReturnedLockInfo {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Void>}
     */
    LastReturnedLock {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    LockRequestsInProgress {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }
}
