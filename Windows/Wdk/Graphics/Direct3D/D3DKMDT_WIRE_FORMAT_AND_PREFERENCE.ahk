#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMDT_WIRE_FORMAT_AND_PREFERENCE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - Preference
     * - Rgb
     * - YCbCr444
     * - YCbCr422
     * - YCbCr420
     * - Intensity
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Preference {
        get => (this._bitfield >> 0) & 0x3
        set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
    }

    /**
     * @type {Integer}
     */
    Rgb {
        get => (this._bitfield >> 2) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 2) | (this._bitfield & ~(0x3F << 2))
    }

    /**
     * @type {Integer}
     */
    YCbCr444 {
        get => (this._bitfield >> 8) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 8) | (this._bitfield & ~(0x3F << 8))
    }

    /**
     * @type {Integer}
     */
    YCbCr422 {
        get => (this._bitfield >> 14) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 14) | (this._bitfield & ~(0x3F << 14))
    }

    /**
     * @type {Integer}
     */
    YCbCr420 {
        get => (this._bitfield >> 20) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 20) | (this._bitfield & ~(0x3F << 20))
    }

    /**
     * @type {Integer}
     */
    Intensity {
        get => (this._bitfield >> 26) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 26) | (this._bitfield & ~(0x3F << 26))
    }

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
