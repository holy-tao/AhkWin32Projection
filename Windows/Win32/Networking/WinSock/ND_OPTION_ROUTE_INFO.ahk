#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IN6_ADDR.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ND_OPTION_ROUTE_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    nd_opt_ri_type {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    nd_opt_ri_len {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    nd_opt_ri_prefix_len {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    class _Flags extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - Reserved
         * - Preference
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Preference {
            get => (this._bitfield >> 3) & 0x3
            set => this._bitfield := ((value & 0x3) << 3) | (this._bitfield & ~(0x3 << 3))
        }
    
    }

    /**
     * @type {Integer}
     */
    nd_opt_ri_flags_reserved {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {_Flags}
     */
    Flags{
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := %this.__Class%._Flags(3, this)
            return this.__Flags
        }
    }

    /**
     * @type {Integer}
     */
    nd_opt_ri_route_lifetime {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {IN6_ADDR}
     */
    nd_opt_ri_prefix{
        get {
            if(!this.HasProp("__nd_opt_ri_prefix"))
                this.__nd_opt_ri_prefix := IN6_ADDR(8, this)
            return this.__nd_opt_ri_prefix
        }
    }
}
