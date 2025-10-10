#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains information about the properties of the current font.
 * @see https://docs.microsoft.com/windows/win32/api//usp10/ns-usp10-script_fontproperties
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class SCRIPT_FONTPROPERTIES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Size, in bytes, of the structure.
     * @type {Integer}
     */
    cBytes {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Glyph used to indicate a blank.
     * @type {Integer}
     */
    wgBlank {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Glyph used to indicate Unicode characters not present in the font.
     * @type {Integer}
     */
    wgDefault {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Glyph used to indicate invalid character combinations.
     * @type {Integer}
     */
    wgInvalid {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Glyph used to indicate the shortest continuous kashida, with 1 indicating that the font contains no kashida.
     * @type {Integer}
     */
    wgKashida {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * Width of the shortest continuous kashida glyph in the font, indicated by the <b>wgKashida</b> member.
     * @type {Integer}
     */
    iKashidaWidth {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
