#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IN6_ADDR.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ND_OPTION_PREFIX_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    nd_opt_pi_type {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    nd_opt_pi_len {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    nd_opt_pi_prefix_len {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    nd_opt_pi_flags_reserved {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    nd_opt_pi_valid_time {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    nd_opt_pi_preferred_time {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    nd_opt_pi_reserved2 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<Byte>}
     */
    nd_opt_pi_reserved3{
        get {
            if(!this.HasProp("__nd_opt_pi_reserved3ProxyArray"))
                this.__nd_opt_pi_reserved3ProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__nd_opt_pi_reserved3ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    nd_opt_pi_site_prefix_len {
        get => NumGet(this, 15, "char")
        set => NumPut("char", value, this, 15)
    }

    /**
     * @type {IN6_ADDR}
     */
    nd_opt_pi_prefix{
        get {
            if(!this.HasProp("__nd_opt_pi_prefix"))
                this.__nd_opt_pi_prefix := IN6_ADDR(this.ptr + 16)
            return this.__nd_opt_pi_prefix
        }
    }
}
