#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DWRITE_JUSTIFICATION_OPPORTUNITY structure specifies justification info per glyph.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_justification_opportunity
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_JUSTIFICATION_OPPORTUNITY {
    #StructPack 4

    /**
     * Minimum amount of expansion to apply to the side of the glyph. This might vary from zero to infinity, typically being zero except for kashida.
     */
    expansionMinimum : Float32

    /**
     * Maximum amount of expansion to apply to the side of the glyph. This might vary from zero to infinity, being zero for fixed-size characters and connected scripts, and non-zero for discrete scripts, and non-zero for cursive scripts at expansion points.
     */
    expansionMaximum : Float32

    /**
     * Maximum amount of compression to apply to the side of the glyph. This might vary from zero up to the glyph cluster size.
     */
    compressionMaximum : Float32

    /**
     * This bitfield backs the following members:
     * - expansionPriority
     * - compressionPriority
     * - allowResidualExpansion
     * - allowResidualCompression
     * - applyToLeadingEdge
     * - applyToTrailingEdge
     * - reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    expansionPriority {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    compressionPriority {
        get => (this._bitfield >> 8) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 8) | (this._bitfield & ~(0xFF << 8))
    }

    /**
     * @type {Integer}
     */
    allowResidualExpansion {
        get => (this._bitfield >> 16) & 0x1
        set => this._bitfield := ((value & 0x1) << 16) | (this._bitfield & ~(0x1 << 16))
    }

    /**
     * @type {Integer}
     */
    allowResidualCompression {
        get => (this._bitfield >> 17) & 0x1
        set => this._bitfield := ((value & 0x1) << 17) | (this._bitfield & ~(0x1 << 17))
    }

    /**
     * @type {Integer}
     */
    applyToLeadingEdge {
        get => (this._bitfield >> 18) & 0x1
        set => this._bitfield := ((value & 0x1) << 18) | (this._bitfield & ~(0x1 << 18))
    }

    /**
     * @type {Integer}
     */
    applyToTrailingEdge {
        get => (this._bitfield >> 19) & 0x1
        set => this._bitfield := ((value & 0x1) << 19) | (this._bitfield & ~(0x1 << 19))
    }

    /**
     * @type {Integer}
     */
    reserved {
        get => (this._bitfield >> 20) & 0xFFF
        set => this._bitfield := ((value & 0xFFF) << 20) | (this._bitfield & ~(0xFFF << 20))
    }
}
