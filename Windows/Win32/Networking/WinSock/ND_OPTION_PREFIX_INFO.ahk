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

    class _Flags extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - Route
         * - Reserved1
         * - SitePrefix
         * - RouterAddress
         * - Autonomous
         * - OnLink
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Route {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        Reserved1 {
            get => (this._bitfield >> 1) & 0x7
            set => this._bitfield := ((value & 0x7) << 1) | (this._bitfield & ~(0x7 << 1))
        }
    
        /**
         * @type {Integer}
         */
        SitePrefix {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }
    
        /**
         * @type {Integer}
         */
        RouterAddress {
            get => (this._bitfield >> 5) & 0x1
            set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
        }
    
        /**
         * @type {Integer}
         */
        Autonomous {
            get => (this._bitfield >> 6) & 0x1
            set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
        }
    
        /**
         * @type {Integer}
         */
        OnLink {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }
    
    }

    /**
     * @type {Integer}
     */
    nd_opt_pi_flags_reserved {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {_Flags}
     */
    Flags{
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := %this.__Class%._Flags(this.ptr + 3)
            return this.__Flags
        }
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
                this.__nd_opt_pi_reserved3ProxyArray := Win32FixedArray(this.ptr + 12, 3, Primitive, "char")
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
