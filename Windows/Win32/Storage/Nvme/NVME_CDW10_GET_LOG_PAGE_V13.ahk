#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The NVME_CDW10_GET_LOG_PAGE_V13 structure contains parameters for the Get Log Page command that returns a data buffer containing the requested log page.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw10_get_log_page_v13
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW10_GET_LOG_PAGE_V13 {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - LID
     * - LSP
     * - Reserved0
     * - RAE
     * - NUMDL
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    LID {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    LSP {
        get => (this._bitfield >> 8) & 0xF
        set => this._bitfield := ((value & 0xF) << 8) | (this._bitfield & ~(0xF << 8))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 12) & 0x7
        set => this._bitfield := ((value & 0x7) << 12) | (this._bitfield & ~(0x7 << 12))
    }

    /**
     * @type {Integer}
     */
    RAE {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }

    /**
     * @type {Integer}
     */
    NUMDL {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
