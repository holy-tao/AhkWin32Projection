#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_FPB_RID_VECTOR_CONTROL2_REGISTER {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - Rsvd0
     * - RidSecondaryStart
     * - Rsvd1
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    Rsvd0 {
        get => (this._bitfield >> 0) & 0x7
        set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    RidSecondaryStart {
        get => (this._bitfield >> 3) & 0x1FFF
        set => this._bitfield := ((value & 0x1FFF) << 3) | (this._bitfield & ~(0x1FFF << 3))
    }

    /**
     * @type {Integer}
     */
    Rsvd1 {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsULONG', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
