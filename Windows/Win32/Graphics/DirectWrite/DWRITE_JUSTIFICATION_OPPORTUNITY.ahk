#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DWRITE_JUSTIFICATION_OPPORTUNITY structure specifies justification info per glyph.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_justification_opportunity
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
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
