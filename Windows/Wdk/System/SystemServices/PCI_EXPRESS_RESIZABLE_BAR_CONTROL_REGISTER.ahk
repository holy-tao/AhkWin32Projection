#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_RESIZABLE_BAR_CONTROL_REGISTER {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - BarIndex
     * - Rsvd
     * - NumberOfResizableBars
     * - BarSize
     * - Rsvd2
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    BarIndex {
        get => (this._bitfield >> 0) & 0x7
        set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    Rsvd {
        get => (this._bitfield >> 3) & 0x3
        set => this._bitfield := ((value & 0x3) << 3) | (this._bitfield & ~(0x3 << 3))
    }

    /**
     * @type {Integer}
     */
    NumberOfResizableBars {
        get => (this._bitfield >> 5) & 0x7
        set => this._bitfield := ((value & 0x7) << 5) | (this._bitfield & ~(0x7 << 5))
    }

    /**
     * @type {Integer}
     */
    BarSize {
        get => (this._bitfield >> 8) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 8) | (this._bitfield & ~(0x3F << 8))
    }

    /**
     * @type {Integer}
     */
    Rsvd2 {
        get => (this._bitfield >> 14) & 0x3FFFF
        set => this._bitfield := ((value & 0x3FFFF) << 14) | (this._bitfield & ~(0x3FFFF << 14))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsULONG', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
