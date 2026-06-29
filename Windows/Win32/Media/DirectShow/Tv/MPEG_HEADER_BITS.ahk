#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MPEG_HEADER_BITS structure contains the first 16 bits that follow the table_id in a generic MPEG-2 section header.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2bits/ns-mpeg2bits-mpeg_header_bits
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct MPEG_HEADER_BITS {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - SectionLength
     * - Reserved
     * - PrivateIndicator
     * - SectionSyntaxIndicator
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    SectionLength {
        get => (this._bitfield >> 0) & 0xFFF
        set => this._bitfield := ((value & 0xFFF) << 0) | (this._bitfield & ~(0xFFF << 0))
    }

    /**
     * @type {Integer}
     */
    PrivateIndicator {
        get => (this._bitfield >> 14) & 0x1
        set => this._bitfield := ((value & 0x1) << 14) | (this._bitfield & ~(0x1 << 14))
    }

    /**
     * @type {Integer}
     */
    SectionSyntaxIndicator {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }
}
