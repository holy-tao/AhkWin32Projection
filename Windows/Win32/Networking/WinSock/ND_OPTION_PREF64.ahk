#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ND_OPTION_PREF64 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 2

    /**
     * @type {Integer}
     */
    nd_opt_p64_type {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    nd_opt_p64_len {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    nd_opt_p64_lifetime_plc {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * This bitfield backs the following members:
     * - nd_opt_p64_prefix_length_code
     * - nd_opt_p64_scaled_lifetime
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    nd_opt_p64_prefix_length_code {
        get => (this._bitfield >> 0) & 0x7
        set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    nd_opt_p64_scaled_lifetime {
        get => (this._bitfield >> 3) & 0x1FFF
        set => this._bitfield := ((value & 0x1FFF) << 3) | (this._bitfield & ~(0x1FFF << 3))
    }

    /**
     * @type {Array<Byte>}
     */
    nd_opt_p64_prefix{
        get {
            if(!this.HasProp("__nd_opt_p64_prefixProxyArray"))
                this.__nd_opt_p64_prefixProxyArray := Win32FixedArray(this.ptr + 4, 12, Primitive, "char")
            return this.__nd_opt_p64_prefixProxyArray
        }
    }
}
