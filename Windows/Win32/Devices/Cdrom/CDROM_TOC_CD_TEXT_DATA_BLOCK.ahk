#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct CDROM_TOC_CD_TEXT_DATA_BLOCK {
    #StructPack 2

    PackType : Int8

    /**
     * This bitfield backs the following members:
     * - TrackNumber
     * - ExtensionFlag
     */
    _bitfield1 : Int8


    /**
     * @type {Integer}
     */
    TrackNumber {
        get => (this._bitfield1 >> 0) & 0x7F
        set => this._bitfield1 := ((value & 0x7F) << 0) | (this._bitfield1 & ~(0x7F << 0))
    }

    /**
     * @type {Integer}
     */
    ExtensionFlag {
        get => (this._bitfield1 >> 7) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 7) | (this._bitfield1 & ~(0x1 << 7))
    }
    SequenceNumber : Int8

    /**
     * This bitfield backs the following members:
     * - CharacterPosition
     * - BlockNumber
     * - Unicode
     */
    _bitfield2 : Int8


    /**
     * @type {Integer}
     */
    CharacterPosition {
        get => (this._bitfield2 >> 0) & 0xF
        set => this._bitfield2 := ((value & 0xF) << 0) | (this._bitfield2 & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    BlockNumber {
        get => (this._bitfield2 >> 4) & 0x7
        set => this._bitfield2 := ((value & 0x7) << 4) | (this._bitfield2 & ~(0x7 << 4))
    }

    /**
     * @type {Integer}
     */
    Unicode {
        get => (this._bitfield2 >> 7) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 7) | (this._bitfield2 & ~(0x1 << 7))
    }
    Text : Int8[12]

    CRC : Int8[2]

    static __New() {
        DefineProp(this.Prototype, 'WText', { type: WCHAR[6], offset: 4 })
        this.DeleteProp("__New")
    }
}
