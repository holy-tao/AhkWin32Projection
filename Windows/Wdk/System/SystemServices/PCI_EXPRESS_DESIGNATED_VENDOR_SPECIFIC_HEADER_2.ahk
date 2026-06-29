#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_DESIGNATED_VENDOR_SPECIFIC_HEADER_2 {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - DvsecId
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    DvsecId {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUSHORT', { type: UInt16, offset: 0 })
        this.DeleteProp("__New")
    }
}
