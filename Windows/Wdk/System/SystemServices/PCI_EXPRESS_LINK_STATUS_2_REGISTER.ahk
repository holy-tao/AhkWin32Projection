#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_LINK_STATUS_2_REGISTER {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - Rsvd0_15
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    Rsvd0_15 {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUSHORT', { type: UInt16, offset: 0 })
        this.DeleteProp("__New")
    }
}
