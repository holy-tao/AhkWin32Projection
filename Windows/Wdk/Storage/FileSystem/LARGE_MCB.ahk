#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FAST_MUTEX.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class LARGE_MCB extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<FAST_MUTEX>}
     */
    GuardedMutex {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    BaseMcb {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
