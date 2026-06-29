#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_AGP_CONTROL {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - Rsvd1
     * - GTLB_Enable
     * - AP_Enable
     * - CAL_Disable
     * - Rsvd2
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    Rsvd1 {
        get => (this._bitfield >> 0) & 0x7F
        set => this._bitfield := ((value & 0x7F) << 0) | (this._bitfield & ~(0x7F << 0))
    }

    /**
     * @type {Integer}
     */
    GTLB_Enable {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }

    /**
     * @type {Integer}
     */
    AP_Enable {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }

    /**
     * @type {Integer}
     */
    CAL_Disable {
        get => (this._bitfield >> 9) & 0x1
        set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
    }

    /**
     * @type {Integer}
     */
    Rsvd2 {
        get => (this._bitfield >> 10) & 0x3FFFFF
        set => this._bitfield := ((value & 0x3FFFFF) << 10) | (this._bitfield & ~(0x3FFFFF << 10))
    }
}
