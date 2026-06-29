#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Shaping output properties for an output glyph.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_shaping_text_properties
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_SHAPING_TEXT_PROPERTIES {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - isShapedAlone
     * - reserved1
     * - canBreakShapingAfter
     * - reserved
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    isShapedAlone {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    reserved1 {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    canBreakShapingAfter {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    reserved {
        get => (this._bitfield >> 3) & 0x1FFF
        set => this._bitfield := ((value & 0x1FFF) << 3) | (this._bitfield & ~(0x1FFF << 3))
    }
}
