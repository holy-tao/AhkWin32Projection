#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_L1_PM_SS_CONTROL_1_REGISTER {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - PciPmL12Enabled
     * - PciPmL11Enabled
     * - AspmL12Enabled
     * - AspmL11Enabled
     * - Rsvd
     * - CommonModeRestoreTime
     * - LtrL12ThresholdValue
     * - Rsvd2
     * - LtrL12ThresholdScale
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    PciPmL12Enabled {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    PciPmL11Enabled {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    AspmL12Enabled {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    AspmL11Enabled {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    Rsvd {
        get => (this._bitfield >> 4) & 0xF
        set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
    }

    /**
     * @type {Integer}
     */
    CommonModeRestoreTime {
        get => (this._bitfield >> 8) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 8) | (this._bitfield & ~(0xFF << 8))
    }

    /**
     * @type {Integer}
     */
    LtrL12ThresholdValue {
        get => (this._bitfield >> 16) & 0x3FF
        set => this._bitfield := ((value & 0x3FF) << 16) | (this._bitfield & ~(0x3FF << 16))
    }

    /**
     * @type {Integer}
     */
    Rsvd2 {
        get => (this._bitfield >> 26) & 0x7
        set => this._bitfield := ((value & 0x7) << 26) | (this._bitfield & ~(0x7 << 26))
    }

    /**
     * @type {Integer}
     */
    LtrL12ThresholdScale {
        get => (this._bitfield >> 29) & 0x7
        set => this._bitfield := ((value & 0x7) << 29) | (this._bitfield & ~(0x7 << 29))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsULONG', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
