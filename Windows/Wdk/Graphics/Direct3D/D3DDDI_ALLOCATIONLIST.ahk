#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DDDI_ALLOCATIONLIST extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    hAllocation {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This bitfield backs the following members:
     * - WriteOperation
     * - DoNotRetireInstance
     * - OfferPriority
     * - Reserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    WriteOperation {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    DoNotRetireInstance {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    OfferPriority {
        get => (this._bitfield >> 2) & 0x7
        set => this._bitfield := ((value & 0x7) << 2) | (this._bitfield & ~(0x7 << 2))
    }

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
