#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ICMP_HEADER.ahk
#Include .\IN6_ADDR.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class MLDV2_QUERY_HEADER extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {ICMP_HEADER}
     */
    IcmpHeader{
        get {
            if(!this.HasProp("__IcmpHeader"))
                this.__IcmpHeader := ICMP_HEADER(this.ptr + 0)
            return this.__IcmpHeader
        }
    }

    /**
     * @type {Integer}
     */
    MaxRespCode {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {IN6_ADDR}
     */
    MulticastAddress{
        get {
            if(!this.HasProp("__MulticastAddress"))
                this.__MulticastAddress := IN6_ADDR(this.ptr + 8)
            return this.__MulticastAddress
        }
    }

    /**
     * This bitfield backs the following members:
     * - QuerierRobustnessVariable
     * - SuppressRouterSideProcessing
     * - QueryReserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    QuerierRobustnessVariable {
        get => (this._bitfield >> 0) & 0x7
        set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    SuppressRouterSideProcessing {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    QueryReserved {
        get => (this._bitfield >> 4) & 0xF
        set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
    }

    /**
     * @type {Integer}
     */
    QueriersQueryInterfaceCode {
        get => NumGet(this, 25, "char")
        set => NumPut("char", value, this, 25)
    }

    /**
     * @type {Integer}
     */
    SourceCount {
        get => NumGet(this, 26, "ushort")
        set => NumPut("ushort", value, this, 26)
    }
}
