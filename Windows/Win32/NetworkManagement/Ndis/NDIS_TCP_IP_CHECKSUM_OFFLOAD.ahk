#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_TCP_IP_CHECKSUM_OFFLOAD extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Encapsulation {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This bitfield backs the following members:
     * - IpOptionsSupported
     * - TcpOptionsSupported
     * - TcpChecksum
     * - UdpChecksum
     * - IpChecksum
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

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
