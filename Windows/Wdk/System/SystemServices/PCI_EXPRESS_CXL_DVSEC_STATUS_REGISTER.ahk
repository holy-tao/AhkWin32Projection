#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_CXL_DVSEC_STATUS_REGISTER {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - Reserved0
     * - ViralStatus
     * - Reserved1
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 0) & 0x3FFF
        set => this._bitfield := ((value & 0x3FFF) << 0) | (this._bitfield & ~(0x3FFF << 0))
    }

    /**
     * @type {Integer}
     */
    ViralStatus {
        get => (this._bitfield >> 14) & 0x1
        set => this._bitfield := ((value & 0x1) << 14) | (this._bitfield & ~(0x1 << 14))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUSHORT', { type: UInt16, offset: 0 })
        this.DeleteProp("__New")
    }
}
