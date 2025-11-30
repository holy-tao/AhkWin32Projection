#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\Win32\System\Kernel\LIST_ENTRY.ahk

/**
 * @namespace Windows.Wdk.Foundation
 * @version v4.0.30319
 */
class KMUTANT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Pointer<DISPATCHER_HEADER>}
     */
    Header {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {LIST_ENTRY}
     */
    MutantListEntry{
        get {
            if(!this.HasProp("__MutantListEntry"))
                this.__MutantListEntry := LIST_ENTRY(8, this)
            return this.__MutantListEntry
        }
    }

    /**
     * @type {Pointer<Pointer>}
     */
    OwnerThread {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    MutantFlags {
        get => NumGet(this, 32, "char")
        set => NumPut("char", value, this, 32)
    }

    /**
     * This bitfield backs the following members:
     * - Abandoned
     * - Spare1
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 32, "char")
        set => NumPut("char", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Abandoned {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Spare1 {
        get => (this._bitfield >> 1) & 0x7F
        set => this._bitfield := ((value & 0x7F) << 1) | (this._bitfield & ~(0x7F << 1))
    }

    /**
     * @type {Integer}
     */
    ApcDisable {
        get => NumGet(this, 33, "char")
        set => NumPut("char", value, this, 33)
    }
}
