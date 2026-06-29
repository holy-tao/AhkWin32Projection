#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_IPSEC_OFFLOAD_V1 {
    #StructPack 4


    struct _Supported {
        Encapsulation : UInt32

        AhEspCombined : UInt32

        TransportTunnelCombined : UInt32

        IPv4Options : UInt32

        Flags : UInt32

    }

    struct _IPv4AH {
        /**
         * This bitfield backs the following members:
         * - Md5
         * - Sha_1
         * - Transport
         * - Tunnel
         * - Send
         * - Receive
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        Md5 {
            get => (this._bitfield >> 0) & 0x3
            set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
        }

        /**
         * @type {Integer}
         */
        Sha_1 {
            get => (this._bitfield >> 2) & 0x3
            set => this._bitfield := ((value & 0x3) << 2) | (this._bitfield & ~(0x3 << 2))
        }

        /**
         * @type {Integer}
         */
        Transport {
            get => (this._bitfield >> 4) & 0x3
            set => this._bitfield := ((value & 0x3) << 4) | (this._bitfield & ~(0x3 << 4))
        }

        /**
         * @type {Integer}
         */
        Tunnel {
            get => (this._bitfield >> 6) & 0x3
            set => this._bitfield := ((value & 0x3) << 6) | (this._bitfield & ~(0x3 << 6))
        }

        /**
         * @type {Integer}
         */
        Send {
            get => (this._bitfield >> 8) & 0x3
            set => this._bitfield := ((value & 0x3) << 8) | (this._bitfield & ~(0x3 << 8))
        }

        /**
         * @type {Integer}
         */
        Receive {
            get => (this._bitfield >> 10) & 0x3
            set => this._bitfield := ((value & 0x3) << 10) | (this._bitfield & ~(0x3 << 10))
        }
    }

    struct _IPv4ESP {
        /**
         * This bitfield backs the following members:
         * - Des
         * - Reserved
         * - TripleDes
         * - NullEsp
         * - Transport
         * - Tunnel
         * - Send
         * - Receive
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        Des {
            get => (this._bitfield >> 0) & 0x3
            set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
        }

        /**
         * @type {Integer}
         */
        TripleDes {
            get => (this._bitfield >> 4) & 0x3
            set => this._bitfield := ((value & 0x3) << 4) | (this._bitfield & ~(0x3 << 4))
        }

        /**
         * @type {Integer}
         */
        NullEsp {
            get => (this._bitfield >> 6) & 0x3
            set => this._bitfield := ((value & 0x3) << 6) | (this._bitfield & ~(0x3 << 6))
        }

        /**
         * @type {Integer}
         */
        Transport {
            get => (this._bitfield >> 8) & 0x3
            set => this._bitfield := ((value & 0x3) << 8) | (this._bitfield & ~(0x3 << 8))
        }

        /**
         * @type {Integer}
         */
        Tunnel {
            get => (this._bitfield >> 10) & 0x3
            set => this._bitfield := ((value & 0x3) << 10) | (this._bitfield & ~(0x3 << 10))
        }

        /**
         * @type {Integer}
         */
        Send {
            get => (this._bitfield >> 12) & 0x3
            set => this._bitfield := ((value & 0x3) << 12) | (this._bitfield & ~(0x3 << 12))
        }

        /**
         * @type {Integer}
         */
        Receive {
            get => (this._bitfield >> 14) & 0x3
            set => this._bitfield := ((value & 0x3) << 14) | (this._bitfield & ~(0x3 << 14))
        }
    }

    Supported : NDIS_IPSEC_OFFLOAD_V1._Supported

    IPv4AH : NDIS_IPSEC_OFFLOAD_V1._IPv4AH

    IPv4ESP : NDIS_IPSEC_OFFLOAD_V1._IPv4ESP

}
