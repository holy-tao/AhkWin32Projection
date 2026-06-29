#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_AGP_APERTURE_PAGE_SIZE {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - PageSizeMask
     * - Rsvd1
     * - PageSizeSelect
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    PageSizeMask {
        get => (this._bitfield >> 0) & 0x7FF
        set => this._bitfield := ((value & 0x7FF) << 0) | (this._bitfield & ~(0x7FF << 0))
    }

    /**
     * @type {Integer}
     */
    Rsvd1 {
        get => (this._bitfield >> 11) & 0x1
        set => this._bitfield := ((value & 0x1) << 11) | (this._bitfield & ~(0x1 << 11))
    }

    /**
     * @type {Integer}
     */
    PageSizeSelect {
        get => (this._bitfield >> 12) & 0xF
        set => this._bitfield := ((value & 0xF) << 12) | (this._bitfield & ~(0xF << 12))
    }
}
