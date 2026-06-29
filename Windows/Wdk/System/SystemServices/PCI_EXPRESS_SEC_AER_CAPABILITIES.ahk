#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_SEC_AER_CAPABILITIES {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - SecondaryUncorrectableFirstErrorPtr
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    SecondaryUncorrectableFirstErrorPtr {
        get => (this._bitfield >> 0) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 0) | (this._bitfield & ~(0x1F << 0))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsULONG', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
