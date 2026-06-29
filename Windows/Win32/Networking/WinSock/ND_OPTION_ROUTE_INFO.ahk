#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IN6_ADDR.ahk" { IN6_ADDR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ND_OPTION_ROUTE_INFO {
    #StructPack 4


    struct _Flags {
        /**
         * This bitfield backs the following members:
         * - Reserved
         * - Preference
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        Preference {
            get => (this._bitfield >> 3) & 0x3
            set => this._bitfield := ((value & 0x3) << 3) | (this._bitfield & ~(0x3 << 3))
        }
    }

    nd_opt_ri_type : Int8

    nd_opt_ri_len : Int8

    nd_opt_ri_prefix_len : Int8

    nd_opt_ri_flags_reserved : Int8

    nd_opt_ri_route_lifetime : UInt32

    nd_opt_ri_prefix : IN6_ADDR

    static __New() {
        DefineProp(this.Prototype, 'Flags', { type: ND_OPTION_ROUTE_INFO._Flags, offset: 3 })
        this.DeleteProp("__New")
    }
}
