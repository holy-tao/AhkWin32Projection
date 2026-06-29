#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_SRIOV_STATUS {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - VFMigrationStatus
     * - Reserved1
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    VFMigrationStatus {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 1) & 0x7FFF
        set => this._bitfield := ((value & 0x7FFF) << 1) | (this._bitfield & ~(0x7FFF << 1))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUSHORT', { type: UInt16, offset: 0 })
        this.DeleteProp("__New")
    }
}
