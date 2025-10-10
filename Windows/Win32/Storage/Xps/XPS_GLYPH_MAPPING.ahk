#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a glyph-to-index mapping.
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/ns-xpsobjectmodel-xps_glyph_mapping
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class XPS_GLYPH_MAPPING extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Index of the first Unicode character in the mapping string.
     * @type {Integer}
     */
    unicodeStringStart {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of characters in the mapping string.
     * @type {Integer}
     */
    unicodeStringLength {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * The glyph array's first  index that corresponds to <b>unicodeStringStart</b>.
     * @type {Integer}
     */
    glyphIndicesStart {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Length of index mapping.
     * @type {Integer}
     */
    glyphIndicesLength {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }
}
