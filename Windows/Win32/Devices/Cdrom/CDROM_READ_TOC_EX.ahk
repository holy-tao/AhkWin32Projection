#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct CDROM_READ_TOC_EX {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - Format
     * - Reserved1
     * - Msf
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    Format {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 4) & 0x7
        set => this._bitfield := ((value & 0x7) << 4) | (this._bitfield & ~(0x7 << 4))
    }

    /**
     * @type {Integer}
     */
    Msf {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }
    SessionTrack : Int8

    Reserved2 : Int8

    Reserved3 : Int8

}
