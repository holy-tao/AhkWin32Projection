#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_SANITIZE_STATUS {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - MostRecentSanitizeOperationStatus
     * - NumberCompletedPassesOfOverwrite
     * - GlobalDataErased
     * - Reserved
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    MostRecentSanitizeOperationStatus {
        get => (this._bitfield >> 0) & 0x7
        set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    NumberCompletedPassesOfOverwrite {
        get => (this._bitfield >> 3) & 0xF
        set => this._bitfield := ((value & 0xF) << 3) | (this._bitfield & ~(0xF << 3))
    }

    /**
     * @type {Integer}
     */
    GlobalDataErased {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }
}
