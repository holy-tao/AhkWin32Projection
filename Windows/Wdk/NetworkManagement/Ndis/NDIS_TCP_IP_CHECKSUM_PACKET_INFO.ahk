#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_TCP_IP_CHECKSUM_PACKET_INFO {
    #StructPack 4


    struct _Transmit {
        /**
         * This bitfield backs the following members:
         * - NdisPacketChecksumV4
         * - NdisPacketChecksumV6
         * - NdisPacketTcpChecksum
         * - NdisPacketUdpChecksum
         * - NdisPacketIpChecksum
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        NdisPacketChecksumV4 {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        NdisPacketChecksumV6 {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        NdisPacketTcpChecksum {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        NdisPacketUdpChecksum {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        NdisPacketIpChecksum {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }
    }

    struct _Receive {
        /**
         * This bitfield backs the following members:
         * - NdisPacketTcpChecksumFailed
         * - NdisPacketUdpChecksumFailed
         * - NdisPacketIpChecksumFailed
         * - NdisPacketTcpChecksumSucceeded
         * - NdisPacketUdpChecksumSucceeded
         * - NdisPacketIpChecksumSucceeded
         * - NdisPacketLoopback
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        NdisPacketTcpChecksumFailed {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        NdisPacketUdpChecksumFailed {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        NdisPacketIpChecksumFailed {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        NdisPacketTcpChecksumSucceeded {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        NdisPacketUdpChecksumSucceeded {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }

        /**
         * @type {Integer}
         */
        NdisPacketIpChecksumSucceeded {
            get => (this._bitfield >> 5) & 0x1
            set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
        }

        /**
         * @type {Integer}
         */
        NdisPacketLoopback {
            get => (this._bitfield >> 6) & 0x1
            set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
        }
    }

    Transmit : NDIS_TCP_IP_CHECKSUM_PACKET_INFO._Transmit

    static __New() {
        DefineProp(this.Prototype, 'Receive', { type: NDIS_TCP_IP_CHECKSUM_PACKET_INFO._Receive, offset: 0 })
        DefineProp(this.Prototype, 'Value', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
