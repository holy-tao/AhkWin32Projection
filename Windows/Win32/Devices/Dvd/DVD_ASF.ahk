#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_ASF {
    #StructPack 1

    Reserved0 : Int8[3]

    /**
     * This bitfield backs the following members:
     * - SuccessFlag
     * - Reserved1
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    SuccessFlag {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 1) & 0x7F
        set => this._bitfield := ((value & 0x7F) << 1) | (this._bitfield & ~(0x7F << 1))
    }
}
