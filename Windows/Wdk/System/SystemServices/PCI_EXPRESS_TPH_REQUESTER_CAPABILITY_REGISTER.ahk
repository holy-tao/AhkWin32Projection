#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_TPH_REQUESTER_CAPABILITY_REGISTER {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - NoStModeSupported
     * - InteruptVectorModeSupported
     * - DeviceSpecificModeSupported
     * - Rsvd
     * - ExtendedTPHRequesterSupported
     * - StTableLocation
     * - Rsvd2
     * - StTableSize
     * - Rsvd3
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    NoStModeSupported {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    InteruptVectorModeSupported {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    DeviceSpecificModeSupported {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    Rsvd {
        get => (this._bitfield >> 3) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 3) | (this._bitfield & ~(0x1F << 3))
    }

    /**
     * @type {Integer}
     */
    ExtendedTPHRequesterSupported {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }

    /**
     * @type {Integer}
     */
    StTableLocation {
        get => (this._bitfield >> 9) & 0x3
        set => this._bitfield := ((value & 0x3) << 9) | (this._bitfield & ~(0x3 << 9))
    }

    /**
     * @type {Integer}
     */
    Rsvd2 {
        get => (this._bitfield >> 11) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 11) | (this._bitfield & ~(0x1F << 11))
    }

    /**
     * @type {Integer}
     */
    StTableSize {
        get => (this._bitfield >> 16) & 0x7FF
        set => this._bitfield := ((value & 0x7FF) << 16) | (this._bitfield & ~(0x7FF << 16))
    }

    /**
     * @type {Integer}
     */
    Rsvd3 {
        get => (this._bitfield >> 27) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 27) | (this._bitfield & ~(0x1F << 27))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsULONG', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
