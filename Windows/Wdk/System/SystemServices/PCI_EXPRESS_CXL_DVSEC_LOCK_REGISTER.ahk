#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_CXL_DVSEC_LOCK_REGISTER {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - ConfigLock
     * - Reserved
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    ConfigLock {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUSHORT', { type: UInt16, offset: 0 })
        this.DeleteProp("__New")
    }
}
