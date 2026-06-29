#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW11_FEATURE_CLEAR_FW_UPDATE_HISTORY {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - Reserved0
     * - Clear
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 0) & 0x7FFFFFFF
        set => this._bitfield := ((value & 0x7FFFFFFF) << 0) | (this._bitfield & ~(0x7FFFFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    Clear {
        get => (this._bitfield >> 31) & 0x1
        set => this._bitfield := ((value & 0x1) << 31) | (this._bitfield & ~(0x1 << 31))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
