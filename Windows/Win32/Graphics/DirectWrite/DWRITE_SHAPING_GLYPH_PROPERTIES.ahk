#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains shaping output properties for an output glyph.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_shaping_glyph_properties
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_SHAPING_GLYPH_PROPERTIES {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - justification
     * - isClusterStart
     * - isDiacritic
     * - isZeroWidthSpace
     * - reserved
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    justification {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    isClusterStart {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    isDiacritic {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    isZeroWidthSpace {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    reserved {
        get => (this._bitfield >> 7) & 0x1FF
        set => this._bitfield := ((value & 0x1FF) << 7) | (this._bitfield & ~(0x1FF << 7))
    }
}
