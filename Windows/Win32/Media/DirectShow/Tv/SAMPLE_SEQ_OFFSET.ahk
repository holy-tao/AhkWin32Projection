#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct SAMPLE_SEQ_OFFSET {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - Type
     * - Offset
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    Type {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    Offset {
        get => (this._bitfield >> 4) & 0xFFFFF
        set => this._bitfield := ((value & 0xFFFFF) << 4) | (this._bitfield & ~(0xFFFFF << 4))
    }
}
