#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values for the Power Management Feature that allows the host to configure the power state.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw11_feature_power_management
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW11_FEATURE_POWER_MANAGEMENT {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - PS
     * - Reserved0
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    PS {
        get => (this._bitfield >> 0) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 0) | (this._bitfield & ~(0x1F << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 5) & 0x7FFFFFF
        set => this._bitfield := ((value & 0x7FFFFFF) << 5) | (this._bitfield & ~(0x7FFFFFF << 5))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
