#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW11_FEATURE_ERROR_RECOVERY {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - TLER
     * - DULBE
     * - Reserved0
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    TLER {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    DULBE {
        get => (this._bitfield >> 16) & 0x1
        set => this._bitfield := ((value & 0x1) << 16) | (this._bitfield & ~(0x1 << 16))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 17) & 0x7FFF
        set => this._bitfield := ((value & 0x7FFF) << 17) | (this._bitfield & ~(0x7FFF << 17))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
