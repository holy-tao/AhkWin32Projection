#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW10_DISCOVERY_INFO_MGMT {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - TAS
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    TAS {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
