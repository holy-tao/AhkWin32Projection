#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_TCP_LARGE_SEND_OFFLOAD_V1 {
    #StructPack 4


    struct _IPv4 {
        Encapsulation : UInt32

        MaxOffLoadSize : UInt32

        MinSegmentCount : UInt32

        /**
         * This bitfield backs the following members:
         * - TcpOptions
         * - IpOptions
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        TcpOptions {
            get => (this._bitfield >> 0) & 0x3
            set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
        }

        /**
         * @type {Integer}
         */
        IpOptions {
            get => (this._bitfield >> 2) & 0x3
            set => this._bitfield := ((value & 0x3) << 2) | (this._bitfield & ~(0x3 << 2))
        }
    }

    IPv4 : NDIS_TCP_LARGE_SEND_OFFLOAD_V1._IPv4

}
