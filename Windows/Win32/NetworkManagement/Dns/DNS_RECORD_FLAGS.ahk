#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DNS_RECORD_FLAGS structure is used to set flags for use in the DNS_RECORD structure.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_record_flags
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_RECORD_FLAGS {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - Section
     * - Delete
     * - CharSet
     * - Unused
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    Section {
        get => (this._bitfield >> 0) & 0x3
        set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
    }

    /**
     * @type {Integer}
     */
    Delete {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    CharSet {
        get => (this._bitfield >> 3) & 0x3
        set => this._bitfield := ((value & 0x3) << 3) | (this._bitfield & ~(0x3 << 3))
    }

    /**
     * @type {Integer}
     */
    Unused {
        get => (this._bitfield >> 5) & 0x7
        set => this._bitfield := ((value & 0x7) << 5) | (this._bitfield & ~(0x7 << 5))
    }
}
