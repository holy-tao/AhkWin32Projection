#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FONTINFO structure contains information regarding a specific font.
 * @remarks
 * 
  * GDI writes and returns this structure through <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-fontobj_vgetinfo">FONTOBJ_vGetInfo</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winddi/ns-winddi-fontinfo
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class FONTINFO extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * Specifies the size of this FONTINFO structure in bytes.
     * @type {Integer}
     */
    cjThis {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Is a set of capabilities flags. The allowed flags are FO_DEVICE_FONT and FO_OUTLINE_CAPABLE.
     * @type {Integer}
     */
    flCaps {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the number of glyphs in the font.
     * @type {Integer}
     */
    cGlyphsSupported {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the size of the largest glyph in 1 bit/pixel. A nonzero value implies that 1-bit-per-pixel bitmaps are supported.
     * @type {Integer}
     */
    cjMaxGlyph1 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specifies the size of the largest glyph in 4 bits/pixel. A nonzero value implies that 4-bit-per-pixel bitmaps are supported.
     * @type {Integer}
     */
    cjMaxGlyph4 {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the size of the largest glyph in 8 bits/pixel. A nonzero value implies that 8-bit-per-pixel bitmaps are supported.
     * @type {Integer}
     */
    cjMaxGlyph8 {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Specifies the size of the largest glyph in 32 bits/pixel. A nonzero value implies that 32-bit-per-pixel bitmaps are supported.
     * @type {Integer}
     */
    cjMaxGlyph32 {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
