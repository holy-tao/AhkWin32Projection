#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW11_FEATURE_IO_COMMAND_SET_PROFILE {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - IOCSCI
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    IOCSCI {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
