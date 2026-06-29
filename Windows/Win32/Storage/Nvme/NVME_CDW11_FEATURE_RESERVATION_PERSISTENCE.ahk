#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW11_FEATURE_RESERVATION_PERSISTENCE {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - PTPL
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    PTPL {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }
}
