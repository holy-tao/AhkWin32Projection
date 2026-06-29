#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_ROOT_ERROR_STATUS {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - CorrectableErrorReceived
     * - MultipleCorrectableErrorsReceived
     * - UncorrectableErrorReceived
     * - MultipleUncorrectableErrorsReceived
     * - FirstUncorrectableFatal
     * - NonFatalErrorMessagesReceived
     * - FatalErrorMessagesReceived
     * - Reserved
     * - AdvancedErrorInterruptMessageNumber
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    CorrectableErrorReceived {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    MultipleCorrectableErrorsReceived {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    UncorrectableErrorReceived {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    MultipleUncorrectableErrorsReceived {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    FirstUncorrectableFatal {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    NonFatalErrorMessagesReceived {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    FatalErrorMessagesReceived {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    AdvancedErrorInterruptMessageNumber {
        get => (this._bitfield >> 27) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 27) | (this._bitfield & ~(0x1F << 27))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsULONG', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
