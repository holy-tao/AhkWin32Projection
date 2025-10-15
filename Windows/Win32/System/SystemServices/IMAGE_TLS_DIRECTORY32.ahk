#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class IMAGE_TLS_DIRECTORY32 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Integer}
     */
    StartAddressOfRawData {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    EndAddressOfRawData {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    AddressOfIndex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    AddressOfCallBacks {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    SizeOfZeroFill {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Characteristics {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * This bitfield backs the following members:
     * - Reserved0
     * - Alignment
     * - Reserved1
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 0) & 0xFFFFF
        set => this._bitfield := ((value & 0xFFFFF) << 0) | (this._bitfield & ~(0xFFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    Alignment {
        get => (this._bitfield >> 20) & 0xF
        set => this._bitfield := ((value & 0xF) << 20) | (this._bitfield & ~(0xF << 20))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 24) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 24) | (this._bitfield & ~(0xFF << 24))
    }
}
