#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_AGP_ISOCH_STATUS {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - ErrorCode
     * - Rsvd1
     * - Isoch_L
     * - Isoch_Y
     * - Isoch_N
     * - Rsvd2
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    ErrorCode {
        get => (this._bitfield >> 0) & 0x3
        set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
    }

    /**
     * @type {Integer}
     */
    Rsvd1 {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    Isoch_L {
        get => (this._bitfield >> 3) & 0x7
        set => this._bitfield := ((value & 0x7) << 3) | (this._bitfield & ~(0x7 << 3))
    }

    /**
     * @type {Integer}
     */
    Isoch_Y {
        get => (this._bitfield >> 6) & 0x3
        set => this._bitfield := ((value & 0x3) << 6) | (this._bitfield & ~(0x3 << 6))
    }

    /**
     * @type {Integer}
     */
    Isoch_N {
        get => (this._bitfield >> 8) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 8) | (this._bitfield & ~(0xFF << 8))
    }

    /**
     * @type {Integer}
     */
    Rsvd2 {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }
}
