#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_PMCSR {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - PowerState
     * - Rsvd1
     * - NoSoftReset
     * - Rsvd2
     * - PMEEnable
     * - DataSelect
     * - DataScale
     * - PMEStatus
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    PowerState {
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
    NoSoftReset {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    Rsvd2 {
        get => (this._bitfield >> 4) & 0xF
        set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
    }

    /**
     * @type {Integer}
     */
    PMEEnable {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }

    /**
     * @type {Integer}
     */
    DataSelect {
        get => (this._bitfield >> 9) & 0xF
        set => this._bitfield := ((value & 0xF) << 9) | (this._bitfield & ~(0xF << 9))
    }

    /**
     * @type {Integer}
     */
    DataScale {
        get => (this._bitfield >> 13) & 0x3
        set => this._bitfield := ((value & 0x3) << 13) | (this._bitfield & ~(0x3 << 13))
    }

    /**
     * @type {Integer}
     */
    PMEStatus {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }
}
