#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class KAPC_STATE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Array<LIST_ENTRY>}
     */
    ApcListHead{
        get {
            if(!this.HasProp("__ApcListHeadProxyArray"))
                this.__ApcListHeadProxyArray := Win32FixedArray(this.ptr + 0, 2, LIST_ENTRY, "")
            return this.__ApcListHeadProxyArray
        }
    }

    /**
     * @type {Pointer<Pointer>}
     */
    Process {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    InProgressFlags {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }

    /**
     * This bitfield backs the following members:
     * - KernelApcInProgress
     * - SpecialApcInProgress
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    KernelApcInProgress {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    SpecialApcInProgress {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {BOOLEAN}
     */
    KernelApcPending {
        get => NumGet(this, 25, "char")
        set => NumPut("char", value, this, 25)
    }

    /**
     * @type {BOOLEAN}
     */
    UserApcPendingAll {
        get => NumGet(this, 26, "char")
        set => NumPut("char", value, this, 26)
    }

    /**
     * This bitfield backs the following members:
     * - SpecialUserApcPending
     * - UserApcPending
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 26, "char")
        set => NumPut("char", value, this, 26)
    }

    /**
     * @type {Integer}
     */
    SpecialUserApcPending {
        get => (this._bitfield1 >> 0) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 0) | (this._bitfield1 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    UserApcPending {
        get => (this._bitfield1 >> 1) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 1) | (this._bitfield1 & ~(0x1 << 1))
    }
}
