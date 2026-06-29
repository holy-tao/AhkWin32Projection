#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct XPF_MCE_FLAGS {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - MCG_CapabilityRW
     * - MCG_GlobalControlRW
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    MCG_CapabilityRW {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    MCG_GlobalControlRW {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsULONG', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
