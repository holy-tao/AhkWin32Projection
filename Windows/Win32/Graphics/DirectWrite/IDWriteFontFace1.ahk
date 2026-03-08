#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DWRITE_FONT_METRICS1.ahk
#Include .\IDWriteFontFace.ahk

/**
 * Contains font face type, appropriate file references, and face identification data. (IDWriteFontFace1)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nn-dwrite_1-idwritefontface1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontFace1 extends IDWriteFontFace{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontFace1
     * @type {Guid}
     */
    static IID => Guid("{a71efdb4-9fdb-4838-ad90-cfc3be8c3daf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMetrics", "GetGdiCompatibleMetrics", "GetCaretMetrics", "GetUnicodeRanges", "IsMonospacedFont", "GetDesignGlyphAdvances", "GetGdiCompatibleGlyphAdvances", "GetKerningPairAdjustments", "HasKerningPairs", "GetRecommendedRenderingMode", "GetVerticalGlyphVariants", "HasVerticalGlyphVariants"]

    /**
     * Obtains design units and common metrics for the font face. These metrics are applicable to all the glyphs within a font face and are used by applications for layout calculations. (IDWriteFontFace1.GetMetrics)
     * @param {Pointer<DWRITE_FONT_METRICS1>} fontMetrics Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_font_metrics1">DWRITE_FONT_METRICS1</a>*</b>
     * 
     * A filled <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_font_metrics1">DWRITE_FONT_METRICS1</a> structure that holds metrics for the current font face element.
     *      The metrics returned by this method are in font design units.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefontface1-getmetrics
     */
    GetMetrics(fontMetrics) {
        ComCall(18, this, "ptr", fontMetrics)
    }

    /**
     * Obtains design units and common metrics for the font face. These metrics are applicable to all the glyphs within a fontface and are used by applications for layout calculations. (IDWriteFontFace1.GetGdiCompatibleMetrics)
     * @param {Float} emSize Type: <b>FLOAT</b>
     * 
     * The logical size of the font in DIP units.
     * @param {Float} pixelsPerDip Type: <b>FLOAT</b>
     * 
     * The number of physical pixels per DIP.
     * @param {Pointer<DWRITE_MATRIX>} transform Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix">DWRITE_MATRIX</a>*</b>
     * 
     * An optional transform applied to the glyphs and their positions. This transform is applied after the scaling specified by the font size and <i>pixelsPerDip</i>.
     * @returns {DWRITE_FONT_METRICS1} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_font_metrics1">DWRITE_FONT_METRICS1</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_font_metrics1">DWRITE_FONT_METRICS1</a> structure to fill in. The metrics returned by this function are in font design units.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefontface1-getgdicompatiblemetrics
     */
    GetGdiCompatibleMetrics(emSize, pixelsPerDip, transform) {
        fontMetrics := DWRITE_FONT_METRICS1()
        result := ComCall(19, this, "float", emSize, "float", pixelsPerDip, "ptr", transform, "ptr", fontMetrics, "HRESULT")
        return fontMetrics
    }

    /**
     * Gets caret metrics for the font in design units.
     * @remarks
     * Caret metrics are used by
     *     text editors for drawing the correct caret placement and slant.
     * @param {Pointer<DWRITE_CARET_METRICS>} caretMetrics Type: <b>DWRITE_CARET_METRICS*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_caret_metrics">DWRITE_CARET_METRICS</a> structure that is filled.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefontface1-getcaretmetrics
     */
    GetCaretMetrics(caretMetrics) {
        ComCall(20, this, "ptr", caretMetrics)
    }

    /**
     * Retrieves a list of character ranges supported by a font.
     * @remarks
     * A 
     *   list of character ranges supported by the font is
     *     useful for scenarios like character picking, glyph display, and
     *     efficient font selection lookup. This is similar to GDI's
     *     <a href="https://docs.microsoft.com/windows/win32/api/wingdi/nf-wingdi-getfontunicoderanges">GetFontUnicodeRanges</a>, except that it returns the full Unicode range,
     *     not just 16-bit UCS-2.
     * 
     * These ranges are from the cmap, not the OS/2::ulCodePageRange1.
     * 
     * If this method is unavailable, you can use the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontface-getglyphindices">IDWriteFontFace::GetGlyphIndices</a> method to check for missing glyphs.  The method returns the 0 index for glyphs that aren't present in the font.
     * 
     *  The <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefont-hascharacter">IDWriteFont::HasCharacter</a> method is often simpler in cases where you need to check a single character or a series of single characters in succession, such as in font fallback.
     * @param {Integer} maxRangeCount Type: <b>UINT32</b>
     * 
     * Maximum number of character ranges passed
     *     in from the client.
     * @param {Pointer<DWRITE_UNICODE_RANGE>} unicodeRanges Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_unicode_range">DWRITE_UNICODE_RANGE</a>*</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_unicode_range">DWRITE_UNICODE_RANGE</a> structures that are filled with the character ranges.
     * @param {Pointer<Integer>} actualRangeCount Type: <b>UINT32*</b>
     * 
     * A pointer to the actual number of character ranges,
     *     regardless of the maximum count.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_OK</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method executed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>E_NOT_SUFFICIENT_BUFFER</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is too small.  The <i>actualRangeCount</i> was more than the <i>maxRangeCount</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefontface1-getunicoderanges
     */
    GetUnicodeRanges(maxRangeCount, unicodeRanges, actualRangeCount) {
        actualRangeCountMarshal := actualRangeCount is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, "uint", maxRangeCount, "ptr", unicodeRanges, actualRangeCountMarshal, actualRangeCount, "HRESULT")
        return result
    }

    /**
     * Determines whether the font of a text range is monospaced, that is, the font characters are the same fixed-pitch width.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns TRUE if the font is monospaced, otherwise it returns FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefontface1-ismonospacedfont
     */
    IsMonospacedFont() {
        result := ComCall(22, this, "int")
        return result
    }

    /**
     * Retrieves the advances in design units for a sequences of glyphs.
     * @remarks
     * This is equivalent to calling GetGlyphMetrics and using only the
     *     advance width and height.
     * @param {Integer} glyphCount Type: <b>UINT32</b>
     * 
     * The number of glyphs to retrieve advances for.
     * @param {Pointer<Integer>} glyphIndices Type: <b>const UINT16*</b>
     * 
     * An array of glyph id's to retrieve advances for.
     * @param {BOOL} isSideways Type: <b>BOOL</b>
     * 
     * Retrieve the glyph's vertical advance height
     *     rather than horizontal advance widths.
     * @returns {Integer} Type: <b>INT32*</b>
     * 
     * The returned advances in font design units for
     *     each glyph.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefontface1-getdesignglyphadvances
     */
    GetDesignGlyphAdvances(glyphCount, glyphIndices, isSideways) {
        glyphIndicesMarshal := glyphIndices is VarRef ? "ushort*" : "ptr"

        result := ComCall(23, this, "uint", glyphCount, glyphIndicesMarshal, glyphIndices, "int*", &glyphAdvances := 0, "int", isSideways, "HRESULT")
        return glyphAdvances
    }

    /**
     * Returns the pixel-aligned advances for a sequences of glyphs.
     * @remarks
     * This is equivalent to calling <a href="https://docs.microsoft.com/windows/win32/DirectWrite/idwritefontface-getgdicompatibleglyphmetrics">GetGdiCompatibleGlyphMetrics</a> and using only the advance width and height. 
     * 
     * Like <a href="https://docs.microsoft.com/windows/win32/DirectWrite/idwritefontface-getgdicompatibleglyphmetrics">GetGdiCompatibleGlyphMetrics</a>, these are in
     *     design units, meaning they must be scaled down by
     *     DWRITE_FONT_METRICS::designUnitsPerEm.
     * @param {Float} emSize Type: <b>FLOAT</b>
     * 
     * Logical size of the font in DIP units. A DIP
     *     ("device-independent pixel") equals 1/96 inch.
     * @param {Float} pixelsPerDip Type: <b>FLOAT</b>
     * 
     * Number of physical pixels per DIP. For
     *     example, if the DPI of the rendering surface is 96 this value is
     *     1.0f. If the DPI is 120, this value is 120.0f/96.
     * @param {Pointer<DWRITE_MATRIX>} transform Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix">DWRITE_MATRIX</a>*</b>
     * 
     * Optional transform applied to the glyphs and
     *     their positions. This transform is applied after the scaling
     *     specified by the font size and pixelsPerDip.
     * @param {BOOL} useGdiNatural Type: <b>BOOL</b>
     * 
     * When FALSE, the metrics are the same as
     *     GDI aliased text (DWRITE_MEASURING_MODE_GDI_CLASSIC). When TRUE,
     *     the metrics are the same as those measured by GDI using a font
     *     using CLEARTYPE_NATURAL_QUALITY (DWRITE_MEASURING_MODE_GDI_NATURAL).
     * @param {BOOL} isSideways Type: <b>BOOL</b>
     * 
     * Retrieve the glyph's vertical advances rather
     *     than horizontal advances.
     * @param {Integer} glyphCount Type: <b>UINT32</b>
     * 
     * Total glyphs to retrieve adjustments for.
     * @param {Pointer<Integer>} glyphIndices Type: <b>const UINT16*</b>
     * 
     * An array of glyph id's to retrieve advances.
     * @returns {Integer} Type: <b>const INT32*</b>
     * 
     * The returned advances in font design units for
     *     each glyph.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefontface1-getgdicompatibleglyphadvances
     */
    GetGdiCompatibleGlyphAdvances(emSize, pixelsPerDip, transform, useGdiNatural, isSideways, glyphCount, glyphIndices) {
        glyphIndicesMarshal := glyphIndices is VarRef ? "ushort*" : "ptr"

        result := ComCall(24, this, "float", emSize, "float", pixelsPerDip, "ptr", transform, "int", useGdiNatural, "int", isSideways, "uint", glyphCount, glyphIndicesMarshal, glyphIndices, "int*", &glyphAdvances := 0, "HRESULT")
        return glyphAdvances
    }

    /**
     * Retrieves the kerning pair adjustments from the font's kern table.
     * @remarks
     * <b>GetKerningPairAdjustments</b> isn't a direct replacement for GDI's character based
     *     <a href="https://docs.microsoft.com/windows/win32/api/wingdi/nf-wingdi-getkerningpairsa">GetKerningPairs</a>, but it serves the same role, without the client
     *     needing to cache them locally. <b>GetKerningPairAdjustments</b> also uses glyph id's directly
     *     rather than UCS-2 characters (how the kern table actually stores
     *     them), which avoids glyph collapse and ambiguity, such as the dash
     *     and hyphen, or space and non-breaking space.
     * 
     * Newer fonts may have only GPOS kerning instead of the legacy pair-table kerning. Such fonts, like Gabriola, will only return 0's for
     *     adjustments. <b>GetKerningPairAdjustments</b> doesn't virtualize and flatten these
     *     GPOS entries into kerning pairs.
     * 
     * You can realize a performance benefit by calling <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefontface1-haskerningpairs">IDWriteFontFace1::HasKerningPairs</a> to determine whether you need to call  <b>GetKerningPairAdjustments</b>. If you previously called <b>IDWriteFontFace1::HasKerningPairs</b> and it returned FALSE, you can avoid calling <b>GetKerningPairAdjustments</b> because the font has no kerning pair-table entries. That is, in this situation, a call to <b>GetKerningPairAdjustments</b> would be a no-op.
     * @param {Integer} glyphCount Type: <b>UINT32</b>
     * 
     * Number of glyphs to retrieve adjustments for.
     * @param {Pointer<Integer>} glyphIndices Type: <b>const UINT16*</b>
     * 
     * An array of glyph id's to retrieve adjustments
     *     for.
     * @returns {Integer} Type: <b>INT32*</b>
     * 
     * The advances, returned in font design units, for
     *     each glyph. The last glyph adjustment is zero.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefontface1-getkerningpairadjustments
     */
    GetKerningPairAdjustments(glyphCount, glyphIndices) {
        glyphIndicesMarshal := glyphIndices is VarRef ? "ushort*" : "ptr"

        result := ComCall(25, this, "uint", glyphCount, glyphIndicesMarshal, glyphIndices, "int*", &glyphAdvanceAdjustments := 0, "HRESULT")
        return glyphAdvanceAdjustments
    }

    /**
     * Determines whether the font supports pair-kerning.
     * @remarks
     * If the font doesn't support pair table kerning, you don't need to
     *     call <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefontface1-getkerningpairadjustments">IDWriteFontFace1::GetKerningPairAdjustments</a> because it would retrieve all zeroes.
     * @returns {BOOL} Returns TRUE if the font supports kerning pairs, otherwise FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefontface1-haskerningpairs
     */
    HasKerningPairs() {
        result := ComCall(26, this, "int")
        return result
    }

    /**
     * Determines the recommended rendering mode for the font, using the specified size and rendering parameters. (IDWriteFontFace1.GetRecommendedRenderingMode)
     * @remarks
     * This method should be used to determine the actual rendering mode in cases where the rendering 
     *     mode of the rendering params object is DWRITE_RENDERING_MODE_DEFAULT.
     * @param {Float} fontEmSize Type: <b>FLOAT</b>
     * 
     * The logical size of the font in DIP units. A DIP ("device-independent pixel") equals 1/96 inch.
     * @param {Float} dpiX Type: <b>FLOAT</b>
     * 
     * The number of physical pixels per DIP in a horizontal position. For example, if the DPI of the rendering surface is 96, this 
     *      value is 1.0f. If the DPI is 120, this value is 120.0f/96.
     * @param {Float} dpiY Type: <b>FLOAT</b>
     * 
     * The number of physical pixels per DIP in a vertical position. For example, if the DPI of the rendering surface is 96, this 
     *      value is 1.0f. If the DPI is 120, this value is 120.0f/96.
     * @param {Pointer<DWRITE_MATRIX>} transform Type: <b>const DWRITE_MATRIX*</b>
     * 
     * Specifies the world transform.
     * @param {BOOL} isSideways Type: <b>BOOL</b>
     * 
     * Whether the glyphs in the run are sideways or not.
     * @param {Integer} outlineThreshold Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_outline_threshold">DWRITE_OUTLINE_THRESHOLD</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_outline_threshold">DWRITE_OUTLINE_THRESHOLD</a>-typed value that specifies the quality of the graphics system's outline rendering,
     *     affects the size threshold above which outline rendering is used.
     * @param {Integer} measuringMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE</a></b>
     * 
     * The measuring method that will be used for glyphs in the font.
     *      Renderer implementations may choose different rendering modes for different measuring methods, for example:
     *      
     * 
     * <ul>
     * <li>DWRITE_RENDERING_MODE_CLEARTYPE_NATURAL for <a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE_NATURAL</a>
     * </li>
     * <li>DWRITE_RENDERING_MODE_CLEARTYPE_GDI_CLASSIC for <a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE_GDI_CLASSIC</a>
     * </li>
     * <li>DWRITE_RENDERING_MODE_CLEARTYPE_GDI_NATURAL for <a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE_GDI_NATURAL</a>
     * </li>
     * </ul>
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_rendering_mode">DWRITE_RENDERING_MODE</a>*</b>
     * 
     * When this method returns, contains a value that indicates the recommended rendering mode to use.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefontface1-getrecommendedrenderingmode
     */
    GetRecommendedRenderingMode(fontEmSize, dpiX, dpiY, transform, isSideways, outlineThreshold, measuringMode) {
        result := ComCall(27, this, "float", fontEmSize, "float", dpiX, "float", dpiY, "ptr", transform, "int", isSideways, "int", outlineThreshold, "int", measuringMode, "int*", &renderingMode := 0, "HRESULT")
        return renderingMode
    }

    /**
     * Retrieves the vertical forms of the nominal glyphs retrieved from GetGlyphIndices.
     * @remarks
     * The retrieval uses the font's 'vert' table. This is used in
     *     CJK vertical layout so the correct characters are shown.
     * 
     * Call <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontface-getglyphindices">GetGlyphIndices</a> to get the nominal glyph indices, followed by
     *     calling this to remap the to the substituted forms, when the run
     *     is sideways, and the font has vertical glyph variants. See <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefontface1-hasverticalglyphvariants">HasVerticalGlyphVariants</a> for more info.
     * @param {Integer} glyphCount Type: <b>UINT32</b>
     * 
     * The number of glyphs to retrieve.
     * @param {Pointer<Integer>} nominalGlyphIndices Type: <b>const UINT16*</b>
     * 
     * Original glyph indices from cmap.
     * @returns {Integer} Type: <b>UINT16*</b>
     * 
     * The vertical form of glyph indices.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefontface1-getverticalglyphvariants
     */
    GetVerticalGlyphVariants(glyphCount, nominalGlyphIndices) {
        nominalGlyphIndicesMarshal := nominalGlyphIndices is VarRef ? "ushort*" : "ptr"

        result := ComCall(28, this, "uint", glyphCount, nominalGlyphIndicesMarshal, nominalGlyphIndices, "ushort*", &verticalGlyphIndices := 0, "HRESULT")
        return verticalGlyphIndices
    }

    /**
     * Determines whether the font has any vertical glyph variants.
     * @remarks
     * For OpenType fonts, <b>HasVerticalGlyphVariants</b> returns TRUE if the font contains a "vert"feature. 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefontface1-getverticalglyphvariants">IDWriteFontFace1::GetVerticalGlyphVariants</a> retrieves the vertical forms of the nominal glyphs that are retrieved from <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontface-getglyphindices">IDWriteFontFace::GetGlyphIndices</a>.
     * @returns {BOOL} Returns TRUE if the font contains vertical glyph variants, otherwise FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefontface1-hasverticalglyphvariants
     */
    HasVerticalGlyphVariants() {
        result := ComCall(29, this, "int")
        return result
    }
}
