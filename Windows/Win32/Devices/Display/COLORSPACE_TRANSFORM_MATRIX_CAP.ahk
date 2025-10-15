#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\COLORSPACE_TRANSFORM_DATA_CAP.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class COLORSPACE_TRANSFORM_MATRIX_CAP extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * This bitfield backs the following members:
     * - MatrixSizeX
     * - MatrixSizeY
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MatrixSizeX {
        get => (this._bitfield >> 0) & 0x3FF
        set => this._bitfield := ((value & 0x3FF) << 0) | (this._bitfield & ~(0x3FF << 0))
    }

    /**
     * @type {Integer}
     */
    MatrixSizeY {
        get => (this._bitfield >> 10) & 0x3FF
        set => this._bitfield := ((value & 0x3FF) << 10) | (this._bitfield & ~(0x3FF << 10))
    }

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {COLORSPACE_TRANSFORM_DATA_CAP}
     */
    DataCap{
        get {
            if(!this.HasProp("__DataCap"))
                this.__DataCap := COLORSPACE_TRANSFORM_DATA_CAP(this.ptr + 8)
            return this.__DataCap
        }
    }
}
