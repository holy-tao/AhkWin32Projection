#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains parameters for specifying and enabling directives in the Directive Send command.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw12_directive_send_identify_enable_directive
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW12_DIRECTIVE_SEND_IDENTIFY_ENABLE_DIRECTIVE {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - ENDIR
     * - Reserved0
     * - DTYPE
     * - Reserved1
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    ENDIR {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 1) & 0x7F
        set => this._bitfield := ((value & 0x7F) << 1) | (this._bitfield & ~(0x7F << 1))
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
    Reserved1 {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
