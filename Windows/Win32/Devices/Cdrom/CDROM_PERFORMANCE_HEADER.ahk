#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class CDROM_PERFORMANCE_HEADER extends Win32Struct
{
    static sizeof => 9

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    DataLength{
        get {
            if(!this.HasProp("__DataLengthProxyArray"))
                this.__DataLengthProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "char")
            return this.__DataLengthProxyArray
        }
    }

    /**
     * This bitfield backs the following members:
     * - Except
     * - Write
     * - Reserved1
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Except {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Write {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 2) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 2) | (this._bitfield & ~(0x3F << 2))
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 5, 3, Primitive, "char")
            return this.__Reserved2ProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Data{
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__DataProxyArray
        }
    }
}
