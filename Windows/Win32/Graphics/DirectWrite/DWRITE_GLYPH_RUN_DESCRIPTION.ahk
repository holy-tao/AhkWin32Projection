#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains additional properties related to those in DWRITE_GLYPH_RUN.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_run_description
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_GLYPH_RUN_DESCRIPTION {
    #StructPack 8

    /**
     * Type: <b>const WCHAR*</b>
     * 
     * An array of characters containing the locale name associated with this run.
     */
    localeName : PWSTR

    /**
     * Type: <b>const WCHAR*</b>
     * 
     * An array of characters containing the text associated with the glyphs.
     */
    string : PWSTR

    /**
     * Type: <b>UINT32</b>
     * 
     * The number of characters in UTF16 code-units. Note that this may be different than the number of glyphs.
     */
    stringLength : UInt32

    /**
     * Type: <b>const UINT16*</b>
     * 
     * An array of indices to the glyph indices array, of the first glyphs of all the glyph clusters of the glyphs to render.
     */
    clusterMap : IntPtr

    /**
     * Type: <b>UINT32 </b>
     * 
     * Corresponding text position in the string this glyph run came from.  This is relative to the beginning of the string represented by the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextlayout">IDWriteTextLayout</a> object.
     */
    textPosition : UInt32

}
