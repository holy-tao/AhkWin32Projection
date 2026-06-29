#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_XPF_MS_CHECK {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - ErrorTypeValid
     * - ProcessorContextCorruptValid
     * - UncorrectedValid
     * - PreciseIPValid
     * - RestartableIPValid
     * - OverflowValid
     * - ReservedValue
     * - ErrorType
     * - ProcessorContextCorrupt
     * - Uncorrected
     * - PreciseIP
     * - RestartableIP
     * - Overflow
     * - Reserved
     */
    _bitfield : Int64


    /**
     * @type {Integer}
     */
    ErrorTypeValid {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    ProcessorContextCorruptValid {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    UncorrectedValid {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    PreciseIPValid {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    RestartableIPValid {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    OverflowValid {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    ReservedValue {
        get => (this._bitfield >> 6) & 0x3FF
        set => this._bitfield := ((value & 0x3FF) << 6) | (this._bitfield & ~(0x3FF << 6))
    }

    /**
     * @type {Integer}
     */
    ErrorType {
        get => (this._bitfield >> 16) & 0x7
        set => this._bitfield := ((value & 0x7) << 16) | (this._bitfield & ~(0x7 << 16))
    }

    /**
     * @type {Integer}
     */
    ProcessorContextCorrupt {
        get => (this._bitfield >> 19) & 0x1
        set => this._bitfield := ((value & 0x1) << 19) | (this._bitfield & ~(0x1 << 19))
    }

    /**
     * @type {Integer}
     */
    Uncorrected {
        get => (this._bitfield >> 20) & 0x1
        set => this._bitfield := ((value & 0x1) << 20) | (this._bitfield & ~(0x1 << 20))
    }

    /**
     * @type {Integer}
     */
    PreciseIP {
        get => (this._bitfield >> 21) & 0x1
        set => this._bitfield := ((value & 0x1) << 21) | (this._bitfield & ~(0x1 << 21))
    }

    /**
     * @type {Integer}
     */
    RestartableIP {
        get => (this._bitfield >> 22) & 0x1
        set => this._bitfield := ((value & 0x1) << 22) | (this._bitfield & ~(0x1 << 22))
    }

    /**
     * @type {Integer}
     */
    Overflow {
        get => (this._bitfield >> 23) & 0x1
        set => this._bitfield := ((value & 0x1) << 23) | (this._bitfield & ~(0x1 << 23))
    }
    static __New() {
        DefineProp(this.Prototype, 'XpfMsCheck', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
