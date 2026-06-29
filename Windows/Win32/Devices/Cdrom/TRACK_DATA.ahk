#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct TRACK_DATA {
    #StructPack 1

    Reserved : Int8

    /**
     * This bitfield backs the following members:
     * - Control
     * - Adr
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    Control {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    Adr {
        get => (this._bitfield >> 4) & 0xF
        set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
    }
    TrackNumber : Int8

    Reserved1 : Int8

    Address : Int8[4]

}
