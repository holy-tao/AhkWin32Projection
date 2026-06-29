#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains parameters for the Format NVM command that is used to low level format the NVM media.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw10_format_nvm
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW10_FORMAT_NVM {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - LBAF
     * - MS
     * - PI
     * - PIL
     * - SES
     * - ZF
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    LBAF {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    MS {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    PI {
        get => (this._bitfield >> 5) & 0x7
        set => this._bitfield := ((value & 0x7) << 5) | (this._bitfield & ~(0x7 << 5))
    }

    /**
     * @type {Integer}
     */
    PIL {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }

    /**
     * @type {Integer}
     */
    SES {
        get => (this._bitfield >> 9) & 0x7
        set => this._bitfield := ((value & 0x7) << 9) | (this._bitfield & ~(0x7 << 9))
    }

    /**
     * @type {Integer}
     */
    ZF {
        get => (this._bitfield >> 12) & 0x3
        set => this._bitfield := ((value & 0x3) << 12) | (this._bitfield & ~(0x3 << 12))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
