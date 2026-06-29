#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values for the Arbitration Feature that controls command arbitration.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw11_feature_arbitration
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW11_FEATURE_ARBITRATION {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - AB
     * - Reserved0
     * - LPW
     * - MPW
     * - HPW
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    AB {
        get => (this._bitfield >> 0) & 0x7
        set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 3) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 3) | (this._bitfield & ~(0x1F << 3))
    }

    /**
     * @type {Integer}
     */
    LPW {
        get => (this._bitfield >> 8) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 8) | (this._bitfield & ~(0xFF << 8))
    }

    /**
     * @type {Integer}
     */
    MPW {
        get => (this._bitfield >> 16) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 16) | (this._bitfield & ~(0xFF << 16))
    }

    /**
     * @type {Integer}
     */
    HPW {
        get => (this._bitfield >> 24) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 24) | (this._bitfield & ~(0xFF << 24))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
