#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DNS_RECORD_FLAGS structure is used to set flags for use in the DNS_RECORD structure.
 * @see https://docs.microsoft.com/windows/win32/api//windns/ns-windns-dns_record_flags
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_RECORD_FLAGS extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - Section
     * - Delete
     * - CharSet
     * - Unused
     * - Reserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/windns/ne-windns-dns_section">DNS_SECTION</a> value that specifies the section of interest returned from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsquery_a">DnsQuery</a> function call.
     * @type {Integer}
     */
    Section {
        get => (this._bitfield >> 0) & 0x3
        set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
    }

    /**
     * Reserved. Do not use.
     * @type {Integer}
     */
    Delete {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windns/ne-windns-dns_charset">DNS_CHARSET</a> value that specifies the character set used in the associated function call.
     * @type {Integer}
     */
    CharSet {
        get => (this._bitfield >> 3) & 0x3
        set => this._bitfield := ((value & 0x3) << 3) | (this._bitfield & ~(0x3 << 3))
    }

    /**
     * Reserved. Do not use.
     * @type {Integer}
     */
    Unused {
        get => (this._bitfield >> 5) & 0x7
        set => this._bitfield := ((value & 0x7) << 5) | (this._bitfield & ~(0x7 << 5))
    }
}
