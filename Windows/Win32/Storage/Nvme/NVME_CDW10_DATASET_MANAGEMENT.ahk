#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The NVME_CDW10_DATASET_MANAGEMENT structure contains parameters for the Dataset Management command that indicates attributes for ranges of logical blocks.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw10_dataset_management
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW10_DATASET_MANAGEMENT {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - NR
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    NR {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
