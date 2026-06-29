#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains fields that specify the version number of the NVM Express specification that the controller implementation supports.
 * @remarks
 * Valid versions of the NVM Express specification are: 1.0, 1.1, and 1.2.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_version
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_VERSION {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - TER
     * - MNR
     * - MJR
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    TER {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    MNR {
        get => (this._bitfield >> 8) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 8) | (this._bitfield & ~(0xFF << 8))
    }

    /**
     * @type {Integer}
     */
    MJR {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
