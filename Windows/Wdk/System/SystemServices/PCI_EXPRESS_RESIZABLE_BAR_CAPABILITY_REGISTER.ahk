#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_RESIZABLE_BAR_CAPABILITY_REGISTER {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - Rsvd
     * - SizesSupported
     * - Rsvd2
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    Rsvd {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    SizesSupported {
        get => (this._bitfield >> 4) & 0xFFFFF
        set => this._bitfield := ((value & 0xFFFFF) << 4) | (this._bitfield & ~(0xFFFFF << 4))
    }

    /**
     * @type {Integer}
     */
    Rsvd2 {
        get => (this._bitfield >> 24) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 24) | (this._bitfield & ~(0xFF << 24))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsULONG', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
