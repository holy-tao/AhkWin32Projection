#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct VIRTUAL_CHANNEL_CONTROL {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - LoadVCArbitrationTable
     * - VCArbitrationSelect
     * - RsvdP
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    LoadVCArbitrationTable {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    VCArbitrationSelect {
        get => (this._bitfield >> 1) & 0x7
        set => this._bitfield := ((value & 0x7) << 1) | (this._bitfield & ~(0x7 << 1))
    }

    /**
     * @type {Integer}
     */
    RsvdP {
        get => (this._bitfield >> 4) & 0xFFF
        set => this._bitfield := ((value & 0xFFF) << 4) | (this._bitfield & ~(0xFFF << 4))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUSHORT', { type: UInt16, offset: 0 })
        this.DeleteProp("__New")
    }
}
