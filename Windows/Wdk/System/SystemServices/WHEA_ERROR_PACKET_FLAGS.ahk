#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_ERROR_PACKET_FLAGS {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - PreviousError
     * - CriticalEvent
     * - HypervisorError
     * - Simulated
     * - PlatformPfaControl
     * - PlatformDirectedOffline
     * - AddressTranslationRequired
     * - AddressTranslationCompleted
     * - RecoveryOptional
     * - Reserved2
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    PreviousError {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    CriticalEvent {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    HypervisorError {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    Simulated {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    PlatformPfaControl {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    PlatformDirectedOffline {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    AddressTranslationRequired {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    AddressTranslationCompleted {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }

    /**
     * @type {Integer}
     */
    RecoveryOptional {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => (this._bitfield >> 9) & 0x7FFFFF
        set => this._bitfield := ((value & 0x7FFFFF) << 9) | (this._bitfield & ~(0x7FFFFF << 9))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsULONG', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
