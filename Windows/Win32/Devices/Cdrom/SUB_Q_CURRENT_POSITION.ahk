#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SUB_Q_HEADER.ahk" { SUB_Q_HEADER }

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct SUB_Q_CURRENT_POSITION {
    #StructPack 1

    Header : SUB_Q_HEADER

    FormatCode : Int8

    /**
     * This bitfield backs the following members:
     * - Control
     * - ADR
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
    ADR {
        get => (this._bitfield >> 4) & 0xF
        set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
    }
    TrackNumber : Int8

    IndexNumber : Int8

    AbsoluteAddress : Int8[4]

    TrackRelativeAddress : Int8[4]

}
