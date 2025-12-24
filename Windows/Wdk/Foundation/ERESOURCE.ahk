#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\Win32\System\Kernel\LIST_ENTRY.ahk

/**
 * @namespace Windows.Wdk.Foundation
 * @version v4.0.30319
 */
class ERESOURCE extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {LIST_ENTRY}
     */
    SystemResourcesList{
        get {
            if(!this.HasProp("__SystemResourcesList"))
                this.__SystemResourcesList := LIST_ENTRY(0, this)
            return this.__SystemResourcesList
        }
    }

    /**
     * @type {Pointer<OWNER_ENTRY>}
     */
    OwnerTable {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ActiveCount {
        get => NumGet(this, 24, "short")
        set => NumPut("short", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Flag {
        get => NumGet(this, 26, "ushort")
        set => NumPut("ushort", value, this, 26)
    }

    /**
     * @type {Integer}
     */
    ReservedLowFlags {
        get => NumGet(this, 26, "char")
        set => NumPut("char", value, this, 26)
    }

    /**
     * @type {Integer}
     */
    WaiterPriority {
        get => NumGet(this, 27, "char")
        set => NumPut("char", value, this, 27)
    }

    /**
     * @type {Pointer<Void>}
     */
    SharedWaiters {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Void>}
     */
    ExclusiveWaiters {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<OWNER_ENTRY>}
     */
    OwnerEntry {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    ActiveEntries {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    ContentionCount {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    NumberOfSharedWaiters {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    NumberOfExclusiveWaiters {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Pointer<Void>}
     */
    Address {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer}
     */
    CreatorBackTraceIndex {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer}
     */
    SpinLock {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
