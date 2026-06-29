#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_TCP_CONNECTION_OFFLOAD {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    Encapsulation : UInt32

    /**
     * This bitfield backs the following members:
     * - SupportIPv4
     * - SupportIPv6
     * - SupportIPv6ExtensionHeaders
     * - SupportSack
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    SupportIPv4 {
        get => (this._bitfield >> 0) & 0x3
        set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
    }

    /**
     * @type {Integer}
     */
    SupportIPv6 {
        get => (this._bitfield >> 2) & 0x3
        set => this._bitfield := ((value & 0x3) << 2) | (this._bitfield & ~(0x3 << 2))
    }

    /**
     * @type {Integer}
     */
    SupportIPv6ExtensionHeaders {
        get => (this._bitfield >> 4) & 0x3
        set => this._bitfield := ((value & 0x3) << 4) | (this._bitfield & ~(0x3 << 4))
    }

    /**
     * @type {Integer}
     */
    SupportSack {
        get => (this._bitfield >> 6) & 0x3
        set => this._bitfield := ((value & 0x3) << 6) | (this._bitfield & ~(0x3 << 6))
    }
    TcpConnectionOffloadCapacity : UInt32

    Flags : UInt32

}
