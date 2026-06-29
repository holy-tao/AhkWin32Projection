#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct CDROM_PERFORMANCE_HEADER {
    #StructPack 1

    DataLength : Int8[4]

    /**
     * This bitfield backs the following members:
     * - Except
     * - Write
     * - Reserved1
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    Except {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Write {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 2) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 2) | (this._bitfield & ~(0x3F << 2))
    }
    Reserved2 : Int8[3]

    Data : Int8[1]

}
