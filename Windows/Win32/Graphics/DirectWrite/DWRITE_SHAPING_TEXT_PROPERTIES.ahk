#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Shaping output properties for an output glyph.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_shaping_text_properties
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_SHAPING_TEXT_PROPERTIES extends Win32Struct
{
    static sizeof => 2

    static packingSize => 2

    /**
     * This bitfield backs the following members:
     * - isShapedAlone
     * - reserved1
     * - canBreakShapingAfter
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
     * Indicates that the character is shaped independently from the others (usually set for the space character).
     * @type {Integer}
     */
    isShapedAlone {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * Reserved for use by shaping engine.
     * @type {Integer}
     */
    reserved1 {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * Glyph shaping can be safely cut after this point without affecting shaping before or after it. Otherwise, splitting a call to [GetGlyphs](/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-getglyphs) would cause a reflow of glyph advances and shapes.
     * @type {Integer}
     */
    canBreakShapingAfter {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * Reserved for use by the shaping engine.
     * 
     * Type: <b>UINT16</b>
     * 
     * Reserved for future use.
     * @type {Integer}
     */
    reserved {
        get => (this._bitfield >> 3) & 0x1FFF
        set => this._bitfield := ((value & 0x1FFF) << 3) | (this._bitfield & ~(0x1FFF << 3))
    }
}
