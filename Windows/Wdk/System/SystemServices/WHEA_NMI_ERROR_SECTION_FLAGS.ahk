#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_NMI_ERROR_SECTION_FLAGS {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - HypervisorError
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    HypervisorError {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsULONG', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
