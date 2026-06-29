#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW10_RESERVATION_REGISTER {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - RREGA
     * - IEKEY
     * - Reserved
     * - CPTPL
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    RREGA {
        get => (this._bitfield >> 0) & 0x7
        set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    IEKEY {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    CPTPL {
        get => (this._bitfield >> 30) & 0x3
        set => this._bitfield := ((value & 0x3) << 30) | (this._bitfield & ~(0x3 << 30))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
