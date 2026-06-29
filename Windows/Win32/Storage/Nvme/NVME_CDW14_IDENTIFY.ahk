#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW14_IDENTIFY {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - UUIDIndex
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    UUIDIndex {
        get => (this._bitfield >> 0) & 0x7F
        set => this._bitfield := ((value & 0x7F) << 0) | (this._bitfield & ~(0x7F << 0))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
