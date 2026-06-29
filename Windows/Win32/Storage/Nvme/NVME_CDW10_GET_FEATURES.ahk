#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains parameters for the Get Features command that retrieves the attributes of the specified feature.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw10_get_features
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW10_GET_FEATURES {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - FID
     * - SEL
     * - Reserved0
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    FID {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    SEL {
        get => (this._bitfield >> 8) & 0x7
        set => this._bitfield := ((value & 0x7) << 8) | (this._bitfield & ~(0x7 << 8))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 11) & 0x1FFFFF
        set => this._bitfield := ((value & 0x1FFFFF) << 11) | (this._bitfield & ~(0x1FFFFF << 11))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
