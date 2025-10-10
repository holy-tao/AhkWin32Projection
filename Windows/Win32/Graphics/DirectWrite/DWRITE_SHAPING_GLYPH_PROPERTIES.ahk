#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains shaping output properties for an output glyph.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/ns-dwrite-dwrite_shaping_glyph_properties
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_SHAPING_GLYPH_PROPERTIES extends Win32Struct
{
    static sizeof => 2

    static packingSize => 2

    /**
     * This bitfield backs the following members:
     * - justification
     * - isClusterStart
     * - isDiacritic
     * - isZeroWidthSpace
     * - reserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: <b>UINT16</b>
     * 
     * Indicates that the glyph has justification applied.
     * @type {Integer}
     */
    justification {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * Type: <b>UINT16</b>
     * 
     * Indicates that the glyph is the start of a cluster.
     * @type {Integer}
     */
    isClusterStart {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * Type: <b>UINT16</b>
     * 
     * Indicates that the glyph is a diacritic mark.
     * @type {Integer}
     */
    isDiacritic {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * Type: <b>UINT16</b>
     * 
     * Indicates that the glyph is a word boundary with no visible space.
     * @type {Integer}
     */
    isZeroWidthSpace {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * Type: <b>UINT16</b>
     * 
     * Reserved for future use.
     * @type {Integer}
     */
    reserved {
        get => (this._bitfield >> 7) & 0x1FF
        set => this._bitfield := ((value & 0x1FF) << 7) | (this._bitfield & ~(0x1FF << 7))
    }
}
