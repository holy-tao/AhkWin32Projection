#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains parameters used in the Firmware Commit command.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw10_firmware_activate
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW10_FIRMWARE_ACTIVATE {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - FS
     * - AA
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    FS {
        get => (this._bitfield >> 0) & 0x7
        set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    AA {
        get => (this._bitfield >> 3) & 0x3
        set => this._bitfield := ((value & 0x3) << 3) | (this._bitfield & ~(0x3 << 3))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
