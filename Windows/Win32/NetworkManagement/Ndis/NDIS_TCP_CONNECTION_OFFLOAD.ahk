#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_OBJECT_HEADER.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_TCP_CONNECTION_OFFLOAD extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {NDIS_OBJECT_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := NDIS_OBJECT_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {Integer}
     */
    Encapsulation {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * This bitfield backs the following members:
     * - SupportIPv4
     * - SupportIPv6
     * - SupportIPv6ExtensionHeaders
     * - SupportSack
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

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

    /**
     * @type {Integer}
     */
    TcpConnectionOffloadCapacity {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
