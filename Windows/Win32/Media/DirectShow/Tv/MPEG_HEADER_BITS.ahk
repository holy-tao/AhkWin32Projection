#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The MPEG_HEADER_BITS structure contains the first 16 bits that follow the table_id in a generic MPEG-2 section header.
 * @see https://docs.microsoft.com/windows/win32/api//mpeg2bits/ns-mpeg2bits-mpeg_header_bits
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class MPEG_HEADER_BITS extends Win32Struct
{
    static sizeof => 2

    static packingSize => 2

    /**
     * This bitfield backs the following members:
     * - SectionLength
     * - Reserved
     * - PrivateIndicator
     * - SectionSyntaxIndicator
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The length of the section, in bytes.
     * @type {Integer}
     */
    SectionLength {
        get => (this._bitfield >> 0) & 0xFFF
        set => this._bitfield := ((value & 0xFFF) << 0) | (this._bitfield & ~(0xFFF << 0))
    }

    /**
     * Two reserved bits.
     * @type {Integer}
     */
    Reserved {
        get => (this._bitfield >> 12) & 0x3
        set => this._bitfield := ((value & 0x3) << 12) | (this._bitfield & ~(0x3 << 12))
    }

    /**
     * The private_indicator bit.
     * @type {Integer}
     */
    PrivateIndicator {
        get => (this._bitfield >> 14) & 0x1
        set => this._bitfield := ((value & 0x1) << 14) | (this._bitfield & ~(0x1 << 14))
    }

    /**
     * The section_syntax_indicator bit.
     * @type {Integer}
     */
    SectionSyntaxIndicator {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }
}
