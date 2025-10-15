#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_SGL_KEYDATABLOCK_DESC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Address {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    Length{
        get {
            if(!this.HasProp("__LengthProxyArray"))
                this.__LengthProxyArray := Win32FixedArray(this.ptr + 8, 3, Primitive, "char")
            return this.__LengthProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Key{
        get {
            if(!this.HasProp("__KeyProxyArray"))
                this.__KeyProxyArray := Win32FixedArray(this.ptr + 11, 4, Primitive, "char")
            return this.__KeyProxyArray
        }
    }

    /**
     * This bitfield backs the following members:
     * - SubType
     * - Type
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 15, "char")
        set => NumPut("char", value, this, 15)
    }

    /**
     * @type {Integer}
     */
    SubType {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    Type {
        get => (this._bitfield >> 4) & 0xF
        set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
    }

    /**
     * @type {Integer}
     */
    AsUchar {
        get => NumGet(this, 15, "char")
        set => NumPut("char", value, this, 15)
    }
}
