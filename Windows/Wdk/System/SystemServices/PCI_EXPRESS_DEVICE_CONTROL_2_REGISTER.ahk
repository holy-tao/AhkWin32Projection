#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_DEVICE_CONTROL_2_REGISTER {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - CompletionTimeoutValue
     * - CompletionTimeoutDisable
     * - AriForwardingEnable
     * - AtomicOpRequesterEnable
     * - AtomicOpEgresBlocking
     * - IDORequestEnable
     * - IDOCompletionEnable
     * - LTRMechanismEnable
     * - Rsvd
     * - OBFFEnable
     * - EndEndTLPPrefixBlocking
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    CompletionTimeoutValue {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    CompletionTimeoutDisable {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    AriForwardingEnable {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    AtomicOpRequesterEnable {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    AtomicOpEgresBlocking {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }

    /**
     * @type {Integer}
     */
    IDORequestEnable {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }

    /**
     * @type {Integer}
     */
    IDOCompletionEnable {
        get => (this._bitfield >> 9) & 0x1
        set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
    }

    /**
     * @type {Integer}
     */
    LTRMechanismEnable {
        get => (this._bitfield >> 10) & 0x1
        set => this._bitfield := ((value & 0x1) << 10) | (this._bitfield & ~(0x1 << 10))
    }

    /**
     * @type {Integer}
     */
    Rsvd {
        get => (this._bitfield >> 11) & 0x3
        set => this._bitfield := ((value & 0x3) << 11) | (this._bitfield & ~(0x3 << 11))
    }

    /**
     * @type {Integer}
     */
    OBFFEnable {
        get => (this._bitfield >> 13) & 0x3
        set => this._bitfield := ((value & 0x3) << 13) | (this._bitfield & ~(0x3 << 13))
    }

    /**
     * @type {Integer}
     */
    EndEndTLPPrefixBlocking {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUSHORT', { type: UInt16, offset: 0 })
        this.DeleteProp("__New")
    }
}
