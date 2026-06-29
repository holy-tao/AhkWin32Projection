#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW11_FEATURE_READONLY_WRITETHROUGH_MODE {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - Reserved0
     * - EOLBehavior
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 0) & 0x3FFFFFFF
        set => this._bitfield := ((value & 0x3FFFFFFF) << 0) | (this._bitfield & ~(0x3FFFFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    EOLBehavior {
        get => (this._bitfield >> 30) & 0x3
        set => this._bitfield := ((value & 0x3) << 30) | (this._bitfield & ~(0x3 << 30))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
