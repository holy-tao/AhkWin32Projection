#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct VIRTUAL_RESOURCE_CAPABILITY {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - PortArbitrationCapability
     * - RsvdP1
     * - Undefined
     * - RejectSnoopTransactions
     * - MaximumTimeSlots
     * - RsvdP2
     * - PortArbitrationTableOffset
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    PortArbitrationCapability {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    RsvdP1 {
        get => (this._bitfield >> 8) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 8) | (this._bitfield & ~(0x3F << 8))
    }

    /**
     * @type {Integer}
     */
    Undefined {
        get => (this._bitfield >> 14) & 0x1
        set => this._bitfield := ((value & 0x1) << 14) | (this._bitfield & ~(0x1 << 14))
    }

    /**
     * @type {Integer}
     */
    RejectSnoopTransactions {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }

    /**
     * @type {Integer}
     */
    MaximumTimeSlots {
        get => (this._bitfield >> 16) & 0x7F
        set => this._bitfield := ((value & 0x7F) << 16) | (this._bitfield & ~(0x7F << 16))
    }

    /**
     * @type {Integer}
     */
    RsvdP2 {
        get => (this._bitfield >> 23) & 0x1
        set => this._bitfield := ((value & 0x1) << 23) | (this._bitfield & ~(0x1 << 23))
    }

    /**
     * @type {Integer}
     */
    PortArbitrationTableOffset {
        get => (this._bitfield >> 24) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 24) | (this._bitfield & ~(0xFF << 24))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsULONG', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
