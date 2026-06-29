#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_DPC_STATUS_REGISTER {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - TriggerStatus
     * - TriggerReason
     * - InterruptStatus
     * - RpBusy
     * - TriggerReasonExtension
     * - Reserved1
     * - PioFirstErrPointer
     * - Reserved2
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    TriggerStatus {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    TriggerReason {
        get => (this._bitfield >> 1) & 0x3
        set => this._bitfield := ((value & 0x3) << 1) | (this._bitfield & ~(0x3 << 1))
    }

    /**
     * @type {Integer}
     */
    InterruptStatus {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    RpBusy {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    TriggerReasonExtension {
        get => (this._bitfield >> 5) & 0x3
        set => this._bitfield := ((value & 0x3) << 5) | (this._bitfield & ~(0x3 << 5))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }

    /**
     * @type {Integer}
     */
    PioFirstErrPointer {
        get => (this._bitfield >> 8) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 8) | (this._bitfield & ~(0x1F << 8))
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => (this._bitfield >> 13) & 0x7
        set => this._bitfield := ((value & 0x7) << 13) | (this._bitfield & ~(0x7 << 13))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUSHORT', { type: UInt16, offset: 0 })
        this.DeleteProp("__New")
    }
}
