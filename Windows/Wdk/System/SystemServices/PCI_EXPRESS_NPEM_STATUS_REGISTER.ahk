#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_NPEM_STATUS_REGISTER {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - CommandCompleted
     * - Rsvd
     * - EnclosureSpecificStatus
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    CommandCompleted {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Rsvd {
        get => (this._bitfield >> 1) & 0x7FFFFF
        set => this._bitfield := ((value & 0x7FFFFF) << 1) | (this._bitfield & ~(0x7FFFFF << 1))
    }

    /**
     * @type {Integer}
     */
    EnclosureSpecificStatus {
        get => (this._bitfield >> 24) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 24) | (this._bitfield & ~(0xFF << 24))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsULONG', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
