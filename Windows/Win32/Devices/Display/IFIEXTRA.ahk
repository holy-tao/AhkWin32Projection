#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The IFIEXTRA structure defines additional information for a given typeface that GDI can use.
 * @remarks
 * When used, this structure lies below the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-ifimetrics">IFIMETRICS</a> structure in memory.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-ifiextra
 * @namespace Windows.Win32.Devices.Display
 */
export default struct IFIEXTRA {
    #StructPack 4

    /**
     * Should be set to zero. This member was used by GDI to identify Type1 fonts on Windows NT 4.0.
     */
    ulIdentifier : UInt32

    /**
     * Specifies the offset in bytes from the beginning of the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-ifimetrics">IFIMETRICS</a> structure to the FONTSIGNATURE structure (described in the Microsoft Window SDK documentation). The driver should set this member to zero if it does not support multiple character sets.
     * 
     * The character set information in FONTSIGNATURE should be consistent with the information provided in the character sets array to which the <b>dpCharSets</b> member of IFIMETRICS points.
     */
    dpFontSig : Int32

    /**
     * Specifies the number of distinct glyphs in a font that supports glyph indices. The font's glyph handles are contiguous values that range from 0 to (<b>cig</b>-1). For OpenType fonts, this value is stored in the <i>numGlyphs</i> value of the <i>maxp</i> table.
     * 
     * Fonts that do not have contiguous glyph handles should set this member to zero. Note that the Window SDK glyph index APIs will not work for fonts that set this member to zero.
     */
    cig : UInt32

    /**
     * Is the offset from the beginning of the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-ifimetrics">IFIMETRICS</a> structure to the DESIGNVECTOR structure for this font. The driver should set <b>dpDesignVector</b> only if this font is a multiple master font. The DESIGNVECTOR structure is described in the Window SDK documentation.
     */
    dpDesignVector : Int32

    /**
     * Is the offset from the beginning of the IFIMETRICS structure to the AXESINFOW structure for this font. The driver should set <b>dpAxesInfoW</b> only if this font is a multiple master font. The AXESINFOW structure is described in the Window SDK documentation.
     */
    dpAxesInfoW : Int32

    /**
     * Is reserved and should be ignored by the driver.
     */
    aulReserved : UInt32[1]

}
