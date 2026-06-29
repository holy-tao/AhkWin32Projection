#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The NVME_CDW11_DATASET_MANAGEMENT structure contains parameters for the Dataset Management command that indicates attributes for ranges of logical blocks.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw11_dataset_management
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW11_DATASET_MANAGEMENT {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - IDR
     * - IDW
     * - AD
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    IDR {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    IDW {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    AD {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
