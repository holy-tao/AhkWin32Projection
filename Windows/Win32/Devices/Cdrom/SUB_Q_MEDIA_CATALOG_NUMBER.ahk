#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SUB_Q_HEADER.ahk" { SUB_Q_HEADER }

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct SUB_Q_MEDIA_CATALOG_NUMBER {
    #StructPack 1

    Header : SUB_Q_HEADER

    FormatCode : Int8

    Reserved : Int8[3]

    /**
     * This bitfield backs the following members:
     * - Reserved1
     * - Mcval
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 0) & 0x7F
        set => this._bitfield := ((value & 0x7F) << 0) | (this._bitfield & ~(0x7F << 0))
    }

    /**
     * @type {Integer}
     */
    Mcval {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }
    MediaCatalog : Int8[15]

}
