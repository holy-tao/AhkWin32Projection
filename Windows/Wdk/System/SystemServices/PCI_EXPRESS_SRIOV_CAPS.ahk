#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_SRIOV_CAPS {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - VFMigrationCapable
     * - Reserved1
     * - VFMigrationInterruptNumber
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    VFMigrationCapable {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 1) & 0xFFFFF
        set => this._bitfield := ((value & 0xFFFFF) << 1) | (this._bitfield & ~(0xFFFFF << 1))
    }

    /**
     * @type {Integer}
     */
    VFMigrationInterruptNumber {
        get => (this._bitfield >> 21) & 0x7FF
        set => this._bitfield := ((value & 0x7FF) << 21) | (this._bitfield & ~(0x7FF << 21))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsULONG', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
