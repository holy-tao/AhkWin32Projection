#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SUB_Q_HEADER.ahk" { SUB_Q_HEADER }

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct SUB_Q_TRACK_ISRC {
    #StructPack 1

    Header : SUB_Q_HEADER

    FormatCode : Int8

    Reserved0 : Int8

    Track : Int8

    Reserved1 : Int8

    /**
     * This bitfield backs the following members:
     * - Reserved2
     * - Tcval
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    Reserved2 {
        get => (this._bitfield >> 0) & 0x7F
        set => this._bitfield := ((value & 0x7F) << 0) | (this._bitfield & ~(0x7F << 0))
    }

    /**
     * @type {Integer}
     */
    Tcval {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }
    TrackIsrc : Int8[15]

}
