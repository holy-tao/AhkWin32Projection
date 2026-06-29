#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_CXL_DVSEC_RANGE_BASE_LOW_REGISTER {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - Reserved
     * - MemBaseLow
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    MemBaseLow {
        get => (this._bitfield >> 28) & 0xF
        set => this._bitfield := ((value & 0xF) << 28) | (this._bitfield & ~(0xF << 28))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsULONG', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
