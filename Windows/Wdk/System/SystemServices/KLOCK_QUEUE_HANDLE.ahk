#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class KLOCK_QUEUE_HANDLE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<KSPIN_LOCK_QUEUE>}
     */
    LockQueue {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    OldIrql {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }
}
