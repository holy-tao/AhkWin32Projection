#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains parameters for the Directive Send command.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw11_directive_send
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW11_DIRECTIVE_SEND {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - DOPER
     * - DTYPE
     * - DSPEC
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    DOPER {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    DTYPE {
        get => (this._bitfield >> 8) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 8) | (this._bitfield & ~(0xFF << 8))
    }

    /**
     * @type {Integer}
     */
    DSPEC {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
