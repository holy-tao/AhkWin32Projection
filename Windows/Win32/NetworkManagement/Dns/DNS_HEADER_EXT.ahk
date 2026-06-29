#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_HEADER_EXT {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - Reserved
     * - DnssecOk
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    DnssecOk {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }
    chRcode : Int8

    chVersion : Int8

}
