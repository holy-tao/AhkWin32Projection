#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains parameters for the Temperature Threshold feature that is used to set an over temperature threshold and an under temperature threshold for up to nine temperature values.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw11_feature_temperature_threshold
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW11_FEATURE_TEMPERATURE_THRESHOLD {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - TMPTH
     * - TMPSEL
     * - THSEL
     * - Reserved0
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    TMPTH {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    TMPSEL {
        get => (this._bitfield >> 16) & 0xF
        set => this._bitfield := ((value & 0xF) << 16) | (this._bitfield & ~(0xF << 16))
    }

    /**
     * @type {Integer}
     */
    THSEL {
        get => (this._bitfield >> 20) & 0x3
        set => this._bitfield := ((value & 0x3) << 20) | (this._bitfield & ~(0x3 << 20))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 22) & 0x3FF
        set => this._bitfield := ((value & 0x3FF) << 22) | (this._bitfield & ~(0x3FF << 22))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
