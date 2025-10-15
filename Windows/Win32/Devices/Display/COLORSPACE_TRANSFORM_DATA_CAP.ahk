#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class COLORSPACE_TRANSFORM_DATA_CAP extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    DataType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * This bitfield backs the following members:
     * - BitCountOfInteger
     * - BitCountOfFraction
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    BitCountOfInteger {
        get => (this._bitfield >> 0) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 0) | (this._bitfield & ~(0x3F << 0))
    }

    /**
     * @type {Integer}
     */
    BitCountOfFraction {
        get => (this._bitfield >> 6) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 6) | (this._bitfield & ~(0x3F << 6))
    }

    /**
     * This bitfield backs the following members:
     * - BitCountOfExponent
     * - BitCountOfMantissa
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    BitCountOfExponent {
        get => (this._bitfield1 >> 0) & 0x3F
        set => this._bitfield1 := ((value & 0x3F) << 0) | (this._bitfield1 & ~(0x3F << 0))
    }

    /**
     * @type {Integer}
     */
    BitCountOfMantissa {
        get => (this._bitfield1 >> 6) & 0x3F
        set => this._bitfield1 := ((value & 0x3F) << 6) | (this._bitfield1 & ~(0x3F << 6))
    }

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Float}
     */
    NumericRangeMin {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * @type {Float}
     */
    NumericRangeMax {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}
