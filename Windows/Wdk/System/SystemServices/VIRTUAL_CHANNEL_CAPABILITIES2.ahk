#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct VIRTUAL_CHANNEL_CAPABILITIES2 {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - VCArbitrationCapability
     * - RsvdP
     * - VCArbitrationTableOffset
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    VCArbitrationCapability {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    RsvdP {
        get => (this._bitfield >> 8) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 8) | (this._bitfield & ~(0xFFFF << 8))
    }

    /**
     * @type {Integer}
     */
    VCArbitrationTableOffset {
        get => (this._bitfield >> 24) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 24) | (this._bitfield & ~(0xFF << 24))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsULONG', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
