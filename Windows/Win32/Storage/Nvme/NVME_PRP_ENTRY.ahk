#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains fields that specify the Page Base Address and Offset (PBAO) of a pointer to a physical memory page.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_prp_entry
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_PRP_ENTRY {
    #StructPack 8

    /**
     * This bitfield backs the following members:
     * - Reserved0
     * - PBAO
     */
    _bitfield : Int64


    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 0) & 0x3
        set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
    }

    /**
     * @type {Integer}
     */
    PBAO {
        get => (this._bitfield >> 2) & 0x3FFFFFFFFFFFFFFF
        set => this._bitfield := ((value & 0x3FFFFFFFFFFFFFFF) << 2) | (this._bitfield & ~(0x3FFFFFFFFFFFFFFF << 2))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlonglong', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
