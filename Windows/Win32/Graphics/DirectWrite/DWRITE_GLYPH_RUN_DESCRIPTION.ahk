#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains additional properties related to those in DWRITE_GLYPH_RUN.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/ns-dwrite-dwrite_glyph_run_description
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_GLYPH_RUN_DESCRIPTION extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b>const WCHAR*</b>
     * 
     * An array of characters containing the locale name associated with this run.
     * @type {Pointer<Char>}
     */
    localeName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>const WCHAR*</b>
     * 
     * An array of characters containing the text associated with the glyphs.
     * @type {Pointer<Char>}
     */
    string {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * The number of characters in UTF16 code-units. Note that this may be different than the number of glyphs.
     * @type {Integer}
     */
    stringLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>const UINT16*</b>
     * 
     * An array of indices to the glyph indices array, of the first glyphs of all the glyph clusters of the glyphs to render.
     * @type {Pointer<UInt16>}
     */
    clusterMap {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>UINT32 </b>
     * 
     * Corresponding text position in the string this glyph run came from.  This is relative to the beginning of the string represented by the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextlayout">IDWriteTextLayout</a> object.
     * @type {Integer}
     */
    textPosition {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
