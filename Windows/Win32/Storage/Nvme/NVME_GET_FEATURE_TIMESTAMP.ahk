#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_GET_FEATURE_TIMESTAMP {
    #StructPack 8

    /**
     * This bitfield backs the following members:
     * - Timestamp
     * - Synch
     * - Origin
     * - Reserved
     */
    _bitfield : Int64


    /**
     * @type {Integer}
     */
    Timestamp {
        get => (this._bitfield >> 0) & 0xFFFFFFFFFFFF
        set => this._bitfield := ((value & 0xFFFFFFFFFFFF) << 0) | (this._bitfield & ~(0xFFFFFFFFFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    Synch {
        get => (this._bitfield >> 48) & 0x1
        set => this._bitfield := ((value & 0x1) << 48) | (this._bitfield & ~(0x1 << 48))
    }

    /**
     * @type {Integer}
     */
    Origin {
        get => (this._bitfield >> 49) & 0x7
        set => this._bitfield := ((value & 0x7) << 49) | (this._bitfield & ~(0x7 << 49))
    }
    AsUlonglong : Int64

}
