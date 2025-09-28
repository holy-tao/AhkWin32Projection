#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_ASF extends Win32Struct
{
    static sizeof => 4

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 0, 3, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * This bitfield backs the following members:
     * - SuccessFlag
     * - Reserved1
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    SuccessFlag {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 1) & 0x7F
        set => this._bitfield := ((value & 0x7F) << 1) | (this._bitfield & ~(0x7F << 1))
    }
}
