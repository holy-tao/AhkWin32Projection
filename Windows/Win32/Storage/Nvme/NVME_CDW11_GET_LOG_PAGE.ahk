#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The NVME_CDW11_GET_LOG_PAGE structure contains parameters for the Get Log Page command that returns a data buffer containing the requested log page.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw11_get_log_page
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW11_GET_LOG_PAGE {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - NUMDU
     * - LogSpecificIdentifier
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    NUMDU {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    LogSpecificIdentifier {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
