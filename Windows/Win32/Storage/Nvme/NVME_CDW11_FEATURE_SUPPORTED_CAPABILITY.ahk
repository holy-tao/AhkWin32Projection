#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that are returned by the Get Features command, which describe the supported capabilities of the specified feature.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw11_feature_supported_capability
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW11_FEATURE_SUPPORTED_CAPABILITY {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - SAVE
     * - NSS
     * - MOD
     * - Reserved0
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    SAVE {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    NSS {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    MOD {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 3) & 0x1FFFFFFF
        set => this._bitfield := ((value & 0x1FFFFFFF) << 3) | (this._bitfield & ~(0x1FFFFFFF << 3))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
