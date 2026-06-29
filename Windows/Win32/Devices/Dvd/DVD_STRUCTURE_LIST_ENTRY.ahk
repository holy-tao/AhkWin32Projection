#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_STRUCTURE_LIST_ENTRY {
    #StructPack 1

    FormatCode : Int8

    /**
     * This bitfield backs the following members:
     * - Reserved0
     * - Readable
     * - Sendable
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 0) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 0) | (this._bitfield & ~(0x3F << 0))
    }

    /**
     * @type {Integer}
     */
    Readable {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    Sendable {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }
    FormatLength : Int8[2]

}
