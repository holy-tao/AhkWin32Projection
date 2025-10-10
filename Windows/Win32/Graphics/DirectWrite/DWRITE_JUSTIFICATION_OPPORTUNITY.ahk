#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DWRITE_JUSTIFICATION_OPPORTUNITY structure specifies justification info per glyph.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/ns-dwrite_1-dwrite_justification_opportunity
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_JUSTIFICATION_OPPORTUNITY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Minimum amount of expansion to apply to the side of the glyph. This might vary from zero to infinity, typically being zero except for kashida.
     * @type {Float}
     */
    expansionMinimum {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Maximum amount of expansion to apply to the side of the glyph. This might vary from zero to infinity, being zero for fixed-size characters and connected scripts, and non-zero for discrete scripts, and non-zero for cursive scripts at expansion points.
     * @type {Float}
     */
    expansionMaximum {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * Maximum amount of compression to apply to the side of the glyph. This might vary from zero up to the glyph cluster size.
     * @type {Float}
     */
    compressionMaximum {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * This bitfield backs the following members:
     * - expansionPriority
     * - compressionPriority
     * - allowResidualExpansion
     * - allowResidualCompression
     * - applyToLeadingEdge
     * - applyToTrailingEdge
     * - reserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Priority of this expansion point. Larger priorities are applied later, while priority zero does nothing.
     * @type {Integer}
     */
    expansionPriority {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * Priority of this compression point. Larger priorities are applied later, while priority zero does nothing.
     * @type {Integer}
     */
    compressionPriority {
        get => (this._bitfield >> 8) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 8) | (this._bitfield & ~(0xFF << 8))
    }

    /**
     * Allow this expansion point to use up any remaining slack space even after all expansion priorities have been used up.
     * @type {Integer}
     */
    allowResidualExpansion {
        get => (this._bitfield >> 16) & 0x1
        set => this._bitfield := ((value & 0x1) << 16) | (this._bitfield & ~(0x1 << 16))
    }

    /**
     * Allow this compression point to use up any remaining space even after all compression priorities have been used up.
     * @type {Integer}
     */
    allowResidualCompression {
        get => (this._bitfield >> 17) & 0x1
        set => this._bitfield := ((value & 0x1) << 17) | (this._bitfield & ~(0x1 << 17))
    }

    /**
     * Apply expansion and compression to the leading edge of the glyph. This bit is <b>FALSE</b> (0) for connected scripts, fixed-size characters, and diacritics. It is generally <b>FALSE</b> within a multi-glyph cluster, unless the script allows expansion of glyphs within a cluster, like Thai.
     * @type {Integer}
     */
    applyToLeadingEdge {
        get => (this._bitfield >> 18) & 0x1
        set => this._bitfield := ((value & 0x1) << 18) | (this._bitfield & ~(0x1 << 18))
    }

    /**
     * Apply expansion and compression to the trailing edge of the glyph. This bit is <b>FALSE</b> (0) for connected scripts, fixed-size characters, and diacritics. It is generally <b>FALSE</b> within a multi-glyph cluster, unless the script allows expansion of glyphs within a cluster, like Thai.
     * @type {Integer}
     */
    applyToTrailingEdge {
        get => (this._bitfield >> 19) & 0x1
        set => this._bitfield := ((value & 0x1) << 19) | (this._bitfield & ~(0x1 << 19))
    }

    /**
     * Reserved
     * @type {Integer}
     */
    reserved {
        get => (this._bitfield >> 20) & 0xFFF
        set => this._bitfield := ((value & 0xFFF) << 20) | (this._bitfield & ~(0xFFF << 20))
    }
}
