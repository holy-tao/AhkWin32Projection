#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_ALLOCATIONLIST {
    #StructPack 4

    hAllocation : UInt32

    /**
     * This bitfield backs the following members:
     * - WriteOperation
     * - DoNotRetireInstance
     * - OfferPriority
     * - Reserved
     */
    _bitfield : Int32


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
    static __New() {
        DefineProp(this.Prototype, 'Value', { type: UInt32, offset: 4 })
        this.DeleteProp("__New")
    }
}
