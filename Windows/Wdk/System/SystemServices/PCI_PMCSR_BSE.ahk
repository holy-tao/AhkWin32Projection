#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_PMCSR_BSE {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - Rsvd1
     * - D3HotSupportsStopClock
     * - BusPowerClockControlEnabled
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    Rsvd1 {
        get => (this._bitfield >> 0) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 0) | (this._bitfield & ~(0x3F << 0))
    }

    /**
     * @type {Integer}
     */
    D3HotSupportsStopClock {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    BusPowerClockControlEnabled {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }
}
