#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains parameters for the Non-Operational Power State Feature that indicates whether permissive mode is enabled for a non-operational power state.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw11_feature_non_operational_power_state
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW11_FEATURE_NON_OPERATIONAL_POWER_STATE {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - NOPPME
     * - Reserved0
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    NOPPME {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 1) & 0x7FFFFFFF
        set => this._bitfield := ((value & 0x7FFFFFFF) << 1) | (this._bitfield & ~(0x7FFFFFFF << 1))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
