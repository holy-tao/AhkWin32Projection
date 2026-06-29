#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_DUAL_LAYER_MIDDLE_ZONE_START_ADDRESS {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - Reserved0
     * - InitStatus
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 0) & 0x7F
        set => this._bitfield := ((value & 0x7F) << 0) | (this._bitfield & ~(0x7F << 0))
    }

    /**
     * @type {Integer}
     */
    InitStatus {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }
    Reserved1 : Int8[3]

    ShiftedMiddleAreaStartAddress : Int8[4]

}
