#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains parameters that specify the LBA format to apply to the NVM media as part of the Format NVM command.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_lba_format
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_LBA_FORMAT {
    #StructPack 4

    MS : UInt16

    LBADS : Int8

    /**
     * This bitfield backs the following members:
     * - RP
     * - Reserved0
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    RP {
        get => (this._bitfield >> 0) & 0x3
        set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 2) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 2) | (this._bitfield & ~(0x3F << 2))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
