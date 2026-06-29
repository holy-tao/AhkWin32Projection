#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IN6_ADDR.ahk" { IN6_ADDR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ND_OPTION_PREFIX_INFO {
    #StructPack 4


    struct _Flags {
        /**
         * This bitfield backs the following members:
         * - Route
         * - Reserved1
         * - SitePrefix
         * - RouterAddress
         * - Autonomous
         * - OnLink
         */
        _bitfield : Int8


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

    nd_opt_pi_type : Int8

    nd_opt_pi_len : Int8

    nd_opt_pi_prefix_len : Int8

    nd_opt_pi_flags_reserved : Int8

    nd_opt_pi_valid_time : UInt32

    nd_opt_pi_preferred_time : UInt32

    nd_opt_pi_reserved2 : UInt32

    nd_opt_pi_prefix : IN6_ADDR

    static __New() {
        DefineProp(this.Prototype, 'Flags', { type: ND_OPTION_PREFIX_INFO._Flags, offset: 3 })
        DefineProp(this.Prototype, 'nd_opt_pi_reserved3', { type: Int8[3], offset: 12 })
        DefineProp(this.Prototype, 'nd_opt_pi_site_prefix_len', { type: Int8, offset: 15 })
        this.DeleteProp("__New")
    }
}
