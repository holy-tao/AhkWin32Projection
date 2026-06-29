#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct XPF_MC_BANK_FLAGS {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - ClearOnInitializationRW
     * - ControlDataRW
     * - Reserved
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    ClearOnInitializationRW {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    ControlDataRW {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUCHAR', { type: Int8, offset: 0 })
        this.DeleteProp("__New")
    }
}
