#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW10_DEVICE_SELF_TEST {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - STC
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    STC {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
