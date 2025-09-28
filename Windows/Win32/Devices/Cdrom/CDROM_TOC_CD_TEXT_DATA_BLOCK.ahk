#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class CDROM_TOC_CD_TEXT_DATA_BLOCK extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    PackType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * This bitfield backs the following members:
     * - TrackNumber
     * - ExtensionFlag
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

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

    /**
     * @type {Integer}
     */
    SequenceNumber {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * This bitfield backs the following members:
     * - CharacterPosition
     * - BlockNumber
     * - Unicode
     * @type {Integer}
     */
    _bitfield2 {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

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

    /**
     * @type {Array<Byte>}
     */
    Text{
        get {
            if(!this.HasProp("__TextProxyArray"))
                this.__TextProxyArray := Win32FixedArray(this.ptr + 8, 12, Primitive, "char")
            return this.__TextProxyArray
        }
    }

    /**
     * @type {String}
     */
    WText {
        get => StrGet(this.ptr + 8, 5, "UTF-16")
        set => StrPut(value, this.ptr + 8, 5, "UTF-16")
    }

    /**
     * @type {Array<Byte>}
     */
    CRC{
        get {
            if(!this.HasProp("__CRCProxyArray"))
                this.__CRCProxyArray := Win32FixedArray(this.ptr + 20, 2, Primitive, "char")
            return this.__CRCProxyArray
        }
    }
}
