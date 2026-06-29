#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_TCP_IP_CHECKSUM_OFFLOAD {
    #StructPack 4


    struct _IPv4Transmit {
        Encapsulation : UInt32

        /**
         * This bitfield backs the following members:
         * - IpOptionsSupported
         * - TcpOptionsSupported
         * - TcpChecksum
         * - UdpChecksum
         * - IpChecksum
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        IpOptionsSupported {
            get => (this._bitfield >> 0) & 0x3
            set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
        }

        /**
         * @type {Integer}
         */
        TcpOptionsSupported {
            get => (this._bitfield >> 2) & 0x3
            set => this._bitfield := ((value & 0x3) << 2) | (this._bitfield & ~(0x3 << 2))
        }

        /**
         * @type {Integer}
         */
        TcpChecksum {
            get => (this._bitfield >> 4) & 0x3
            set => this._bitfield := ((value & 0x3) << 4) | (this._bitfield & ~(0x3 << 4))
        }

        /**
         * @type {Integer}
         */
        UdpChecksum {
            get => (this._bitfield >> 6) & 0x3
            set => this._bitfield := ((value & 0x3) << 6) | (this._bitfield & ~(0x3 << 6))
        }

        /**
         * @type {Integer}
         */
        IpChecksum {
            get => (this._bitfield >> 8) & 0x3
            set => this._bitfield := ((value & 0x3) << 8) | (this._bitfield & ~(0x3 << 8))
        }
    }

    struct _IPv4Receive {
        Encapsulation : UInt32

        /**
         * This bitfield backs the following members:
         * - IpOptionsSupported
         * - TcpOptionsSupported
         * - TcpChecksum
         * - UdpChecksum
         * - IpChecksum
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        IpOptionsSupported {
            get => (this._bitfield >> 0) & 0x3
            set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
        }

        /**
         * @type {Integer}
         */
        TcpOptionsSupported {
            get => (this._bitfield >> 2) & 0x3
            set => this._bitfield := ((value & 0x3) << 2) | (this._bitfield & ~(0x3 << 2))
        }

        /**
         * @type {Integer}
         */
        TcpChecksum {
            get => (this._bitfield >> 4) & 0x3
            set => this._bitfield := ((value & 0x3) << 4) | (this._bitfield & ~(0x3 << 4))
        }

        /**
         * @type {Integer}
         */
        UdpChecksum {
            get => (this._bitfield >> 6) & 0x3
            set => this._bitfield := ((value & 0x3) << 6) | (this._bitfield & ~(0x3 << 6))
        }

        /**
         * @type {Integer}
         */
        IpChecksum {
            get => (this._bitfield >> 8) & 0x3
            set => this._bitfield := ((value & 0x3) << 8) | (this._bitfield & ~(0x3 << 8))
        }
    }

    struct _IPv6Transmit {
        Encapsulation : UInt32

        /**
         * This bitfield backs the following members:
         * - IpExtensionHeadersSupported
         * - TcpOptionsSupported
         * - TcpChecksum
         * - UdpChecksum
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        IpExtensionHeadersSupported {
            get => (this._bitfield >> 0) & 0x3
            set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
        }

        /**
         * @type {Integer}
         */
        TcpOptionsSupported {
            get => (this._bitfield >> 2) & 0x3
            set => this._bitfield := ((value & 0x3) << 2) | (this._bitfield & ~(0x3 << 2))
        }

        /**
         * @type {Integer}
         */
        TcpChecksum {
            get => (this._bitfield >> 4) & 0x3
            set => this._bitfield := ((value & 0x3) << 4) | (this._bitfield & ~(0x3 << 4))
        }

        /**
         * @type {Integer}
         */
        UdpChecksum {
            get => (this._bitfield >> 6) & 0x3
            set => this._bitfield := ((value & 0x3) << 6) | (this._bitfield & ~(0x3 << 6))
        }
    }

    struct _IPv6Receive {
        Encapsulation : UInt32

        /**
         * This bitfield backs the following members:
         * - IpExtensionHeadersSupported
         * - TcpOptionsSupported
         * - TcpChecksum
         * - UdpChecksum
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        IpExtensionHeadersSupported {
            get => (this._bitfield >> 0) & 0x3
            set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
        }

        /**
         * @type {Integer}
         */
        TcpOptionsSupported {
            get => (this._bitfield >> 2) & 0x3
            set => this._bitfield := ((value & 0x3) << 2) | (this._bitfield & ~(0x3 << 2))
        }

        /**
         * @type {Integer}
         */
        TcpChecksum {
            get => (this._bitfield >> 4) & 0x3
            set => this._bitfield := ((value & 0x3) << 4) | (this._bitfield & ~(0x3 << 4))
        }

        /**
         * @type {Integer}
         */
        UdpChecksum {
            get => (this._bitfield >> 6) & 0x3
            set => this._bitfield := ((value & 0x3) << 6) | (this._bitfield & ~(0x3 << 6))
        }
    }

    IPv4Transmit : NDIS_TCP_IP_CHECKSUM_OFFLOAD._IPv4Transmit

    IPv4Receive : NDIS_TCP_IP_CHECKSUM_OFFLOAD._IPv4Receive

    IPv6Transmit : NDIS_TCP_IP_CHECKSUM_OFFLOAD._IPv6Transmit

    IPv6Receive : NDIS_TCP_IP_CHECKSUM_OFFLOAD._IPv6Receive

}
