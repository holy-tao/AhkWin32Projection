#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_ROOT_STATUS_REGISTER {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - PMERequestorId
     * - PMEStatus
     * - PMEPending
     * - Rsvd
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    PMERequestorId {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    PMEStatus {
        get => (this._bitfield >> 16) & 0x1
        set => this._bitfield := ((value & 0x1) << 16) | (this._bitfield & ~(0x1 << 16))
    }

    /**
     * @type {Integer}
     */
    PMEPending {
        get => (this._bitfield >> 17) & 0x1
        set => this._bitfield := ((value & 0x1) << 17) | (this._bitfield & ~(0x1 << 17))
    }

    /**
     * @type {Integer}
     */
    Rsvd {
        get => (this._bitfield >> 18) & 0x3FFF
        set => this._bitfield := ((value & 0x3FFF) << 18) | (this._bitfield & ~(0x3FFF << 18))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsULONG', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
