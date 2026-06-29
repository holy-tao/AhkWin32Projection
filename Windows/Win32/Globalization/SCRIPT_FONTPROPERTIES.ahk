#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about the properties of the current font.
 * @see https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_fontproperties
 * @namespace Windows.Win32.Globalization
 */
export default struct SCRIPT_FONTPROPERTIES {
    #StructPack 4

    /**
     * Size, in bytes, of the structure.
     */
    cBytes : Int32

    /**
     * Glyph used to indicate a blank.
     */
    wgBlank : UInt16

    /**
     * Glyph used to indicate Unicode characters not present in the font.
     */
    wgDefault : UInt16

    /**
     * Glyph used to indicate invalid character combinations.
     */
    wgInvalid : UInt16

    /**
     * Glyph used to indicate the shortest continuous kashida, with 1 indicating that the font contains no kashida.
     */
    wgKashida : UInt16

    /**
     * Width of the shortest continuous kashida glyph in the font, indicated by the <b>wgKashida</b> member.
     */
    iKashidaWidth : Int32

}
