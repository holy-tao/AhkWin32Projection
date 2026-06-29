#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The NVME_CDW10_SET_FEATURES structure contains parameters for the Set Features command that sets the attributes of the specified feature.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw10_set_features
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW10_SET_FEATURES {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - FID
     * - Reserved0
     * - SV
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
    Reserved0 {
        get => (this._bitfield >> 8) & 0x7FFFFF
        set => this._bitfield := ((value & 0x7FFFFF) << 8) | (this._bitfield & ~(0x7FFFFF << 8))
    }

    /**
     * @type {Integer}
     */
    SV {
        get => (this._bitfield >> 31) & 0x1
        set => this._bitfield := ((value & 0x1) << 31) | (this._bitfield & ~(0x1 << 31))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
