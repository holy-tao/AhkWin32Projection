#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The NVME_CDW10_GET_LOG_PAGE structure contains parameters for the Get Log Page command that returns a data buffer containing the requested log page.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw10_get_log_page
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW10_GET_LOG_PAGE {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - LID
     * - Reserved0
     * - NUMD
     * - Reserved1
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
    Reserved0 {
        get => (this._bitfield >> 8) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 8) | (this._bitfield & ~(0xFF << 8))
    }

    /**
     * @type {Integer}
     */
    NUMD {
        get => (this._bitfield >> 16) & 0xFFF
        set => this._bitfield := ((value & 0xFFF) << 16) | (this._bitfield & ~(0xFFF << 16))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 28) & 0xF
        set => this._bitfield := ((value & 0xF) << 28) | (this._bitfield & ~(0xF << 28))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
