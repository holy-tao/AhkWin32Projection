#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class DL_OUI extends Win32Struct
{
    static sizeof => 4

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    Byte{
        get {
            if(!this.HasProp("__ByteProxyArray"))
                this.__ByteProxyArray := Win32FixedArray(this.ptr + 0, 3, Primitive, "char")
            return this.__ByteProxyArray
        }
    }

    /**
     * This bitfield backs the following members:
     * - Group
     * - Local
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Group {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Local {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }
}
