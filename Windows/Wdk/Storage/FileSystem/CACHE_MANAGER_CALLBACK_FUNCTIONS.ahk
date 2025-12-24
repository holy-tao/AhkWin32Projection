#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class CACHE_MANAGER_CALLBACK_FUNCTIONS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer<PACQUIRE_FOR_LAZY_WRITE_EX>}
     */
    AcquireForLazyWriteEx {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<PRELEASE_FROM_LAZY_WRITE>}
     */
    ReleaseFromLazyWrite {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PACQUIRE_FOR_READ_AHEAD>}
     */
    AcquireForReadAhead {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<PRELEASE_FROM_READ_AHEAD>}
     */
    ReleaseFromReadAhead {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
