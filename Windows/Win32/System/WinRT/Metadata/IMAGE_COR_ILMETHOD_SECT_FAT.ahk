#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct IMAGE_COR_ILMETHOD_SECT_FAT {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - Kind
     * - DataSize
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    Kind {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    DataSize {
        get => (this._bitfield >> 8) & 0xFFFFFF
        set => this._bitfield := ((value & 0xFFFFFF) << 8) | (this._bitfield & ~(0xFFFFFF << 8))
    }
}
