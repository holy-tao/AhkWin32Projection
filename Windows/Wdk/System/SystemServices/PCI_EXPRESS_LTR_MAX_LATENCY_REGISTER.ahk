#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_LTR_MAX_LATENCY_REGISTER {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - MaxSnoopLatencyValue
     * - MaxSnoopLatencyScale
     * - Rsvd
     * - MaxSnoopRequirement
     * - MaxNoSnoopLatencyValue
     * - MaxNoSnoopLatencyScale
     * - Rsvd2
     * - MaxNoSnoopRequirement
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    MaxSnoopLatencyValue {
        get => (this._bitfield >> 0) & 0x3FF
        set => this._bitfield := ((value & 0x3FF) << 0) | (this._bitfield & ~(0x3FF << 0))
    }

    /**
     * @type {Integer}
     */
    MaxSnoopLatencyScale {
        get => (this._bitfield >> 10) & 0x7
        set => this._bitfield := ((value & 0x7) << 10) | (this._bitfield & ~(0x7 << 10))
    }

    /**
     * @type {Integer}
     */
    Rsvd {
        get => (this._bitfield >> 13) & 0x3
        set => this._bitfield := ((value & 0x3) << 13) | (this._bitfield & ~(0x3 << 13))
    }

    /**
     * @type {Integer}
     */
    MaxSnoopRequirement {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }

    /**
     * @type {Integer}
     */
    MaxNoSnoopLatencyValue {
        get => (this._bitfield >> 16) & 0x3FF
        set => this._bitfield := ((value & 0x3FF) << 16) | (this._bitfield & ~(0x3FF << 16))
    }

    /**
     * @type {Integer}
     */
    MaxNoSnoopLatencyScale {
        get => (this._bitfield >> 26) & 0x7
        set => this._bitfield := ((value & 0x7) << 26) | (this._bitfield & ~(0x7 << 26))
    }

    /**
     * @type {Integer}
     */
    Rsvd2 {
        get => (this._bitfield >> 29) & 0x3
        set => this._bitfield := ((value & 0x3) << 29) | (this._bitfield & ~(0x3 << 29))
    }

    /**
     * @type {Integer}
     */
    MaxNoSnoopRequirement {
        get => (this._bitfield >> 31) & 0x1
        set => this._bitfield := ((value & 0x1) << 31) | (this._bitfield & ~(0x1 << 31))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsULONG', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
