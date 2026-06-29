#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_DEVICE_CONTROL_REGISTER {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - CorrectableErrorEnable
     * - NonFatalErrorEnable
     * - FatalErrorEnable
     * - UnsupportedRequestErrorEnable
     * - EnableRelaxedOrder
     * - MaxPayloadSize
     * - ExtendedTagEnable
     * - PhantomFunctionsEnable
     * - AuxPowerEnable
     * - NoSnoopEnable
     * - MaxReadRequestSize
     * - BridgeConfigRetryEnable
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    CorrectableErrorEnable {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    NonFatalErrorEnable {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    FatalErrorEnable {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    UnsupportedRequestErrorEnable {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    EnableRelaxedOrder {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    MaxPayloadSize {
        get => (this._bitfield >> 5) & 0x7
        set => this._bitfield := ((value & 0x7) << 5) | (this._bitfield & ~(0x7 << 5))
    }

    /**
     * @type {Integer}
     */
    ExtendedTagEnable {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }

    /**
     * @type {Integer}
     */
    PhantomFunctionsEnable {
        get => (this._bitfield >> 9) & 0x1
        set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
    }

    /**
     * @type {Integer}
     */
    AuxPowerEnable {
        get => (this._bitfield >> 10) & 0x1
        set => this._bitfield := ((value & 0x1) << 10) | (this._bitfield & ~(0x1 << 10))
    }

    /**
     * @type {Integer}
     */
    NoSnoopEnable {
        get => (this._bitfield >> 11) & 0x1
        set => this._bitfield := ((value & 0x1) << 11) | (this._bitfield & ~(0x1 << 11))
    }

    /**
     * @type {Integer}
     */
    MaxReadRequestSize {
        get => (this._bitfield >> 12) & 0x7
        set => this._bitfield := ((value & 0x7) << 12) | (this._bitfield & ~(0x7 << 12))
    }

    /**
     * @type {Integer}
     */
    BridgeConfigRetryEnable {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }

    /**
     * @type {Integer}
     */
    Anonymous {
        get => (this._bitfield1 >> 0) & 0x7FFF
        set => this._bitfield1 := ((value & 0x7FFF) << 0) | (this._bitfield1 & ~(0x7FFF << 0))
    }

    /**
     * @type {Integer}
     */
    InitiateFunctionLevelReset {
        get => (this._bitfield1 >> 15) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 15) | (this._bitfield1 & ~(0x1 << 15))
    }
    static __New() {
        DefineProp(this.Prototype, '_bitfield1', { type: Int16, offset: 0 })
        DefineProp(this.Prototype, 'AsUSHORT', { type: UInt16, offset: 0 })
        this.DeleteProp("__New")
    }
}
