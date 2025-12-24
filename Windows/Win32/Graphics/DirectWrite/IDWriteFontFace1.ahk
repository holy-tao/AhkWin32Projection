#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DWRITE_FONT_METRICS1.ahk
#Include .\IDWriteFontFace.ahk

/**
 * Contains font face type, appropriate file references, and face identification data.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nn-dwrite_1-idwritefontface1
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
     * Obtains design units and common metrics for the font face. These metrics are applicable to all the glyphs within a font face and are used by applications for layout calculations.
     * @param {Pointer<DWRITE_FONT_METRICS1>} fontMetrics Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_font_metrics1">DWRITE_FONT_METRICS1</a>*</b>
     * 
     * A filled <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_font_metrics1">DWRITE_FONT_METRICS1</a> structure that holds metrics for the current font face element.
     *      The metrics returned by this method are in font design units.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritefontface1-getmetrics
     */
    GetMetrics(fontMetrics) {
        ComCall(18, this, "ptr", fontMetrics)
    }

    /**
     * Obtains design units and common metrics for the font face. These metrics are applicable to all the glyphs within a fontface and are used by applications for layout calculations.
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
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritefontface1-getgdicompatiblemetrics
     */
    GetGdiCompatibleMetrics(emSize, pixelsPerDip, transform) {
        fontMetrics := DWRITE_FONT_METRICS1()
        result := ComCall(19, this, "float", emSize, "float", pixelsPerDip, "ptr", transform, "ptr", fontMetrics, "HRESULT")
        return fontMetrics
    }

    /**
     * Gets caret metrics for the font in design units.
     * @remarks
     * 
     * Caret metrics are used by
     *     text editors for drawing the correct caret placement and slant.
     * 
     * 
     * @param {Pointer<DWRITE_CARET_METRICS>} caretMetrics Type: <b>DWRITE_CARET_METRICS*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_caret_metrics">DWRITE_CARET_METRICS</a> structure that is filled.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritefontface1-getcaretmetrics
     */
    GetCaretMetrics(caretMetrics) {
        ComCall(20, this, "ptr", caretMetrics)
    }

    /**
     * Retrieves a list of character ranges supported by a font.
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
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritefontface1-getunicoderanges
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
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritefontface1-ismonospacedfont
     */
    IsMonospacedFont() {
        result := ComCall(22, this, "int")
        return result
    }

    /**
     * Retrieves the advances in design units for a sequences of glyphs.
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
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritefontface1-getdesignglyphadvances
     */
    GetDesignGlyphAdvances(glyphCount, glyphIndices, isSideways) {
        glyphIndicesMarshal := glyphIndices is VarRef ? "ushort*" : "ptr"

        result := ComCall(23, this, "uint", glyphCount, glyphIndicesMarshal, glyphIndices, "int*", &glyphAdvances := 0, "int", isSideways, "HRESULT")
        return glyphAdvances
    }

    /**
     * Returns the pixel-aligned advances for a sequences of glyphs.
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
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritefontface1-getgdicompatibleglyphadvances
     */
    GetGdiCompatibleGlyphAdvances(emSize, pixelsPerDip, transform, useGdiNatural, isSideways, glyphCount, glyphIndices) {
        glyphIndicesMarshal := glyphIndices is VarRef ? "ushort*" : "ptr"

        result := ComCall(24, this, "float", emSize, "float", pixelsPerDip, "ptr", transform, "int", useGdiNatural, "int", isSideways, "uint", glyphCount, glyphIndicesMarshal, glyphIndices, "int*", &glyphAdvances := 0, "HRESULT")
        return glyphAdvances
    }

    /**
     * Retrieves the kerning pair adjustments from the font's kern table.
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
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritefontface1-getkerningpairadjustments
     */
    GetKerningPairAdjustments(glyphCount, glyphIndices) {
        glyphIndicesMarshal := glyphIndices is VarRef ? "ushort*" : "ptr"

        result := ComCall(25, this, "uint", glyphCount, glyphIndicesMarshal, glyphIndices, "int*", &glyphAdvanceAdjustments := 0, "HRESULT")
        return glyphAdvanceAdjustments
    }

    /**
     * Determines whether the font supports pair-kerning.
     * @returns {BOOL} Returns TRUE if the font supports kerning pairs, otherwise FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritefontface1-haskerningpairs
     */
    HasKerningPairs() {
        result := ComCall(26, this, "int")
        return result
    }

    /**
     * Determines the recommended rendering mode for the font, using the specified size and rendering parameters.
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
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritefontface1-getrecommendedrenderingmode
     */
    GetRecommendedRenderingMode(fontEmSize, dpiX, dpiY, transform, isSideways, outlineThreshold, measuringMode) {
        result := ComCall(27, this, "float", fontEmSize, "float", dpiX, "float", dpiY, "ptr", transform, "int", isSideways, "int", outlineThreshold, "int", measuringMode, "int*", &renderingMode := 0, "HRESULT")
        return renderingMode
    }

    /**
     * Retrieves the vertical forms of the nominal glyphs retrieved from GetGlyphIndices.
     * @param {Integer} glyphCount Type: <b>UINT32</b>
     * 
     * The number of glyphs to retrieve.
     * @param {Pointer<Integer>} nominalGlyphIndices Type: <b>const UINT16*</b>
     * 
     * Original glyph indices from cmap.
     * @returns {Integer} Type: <b>UINT16*</b>
     * 
     * The vertical form of glyph indices.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritefontface1-getverticalglyphvariants
     */
    GetVerticalGlyphVariants(glyphCount, nominalGlyphIndices) {
        nominalGlyphIndicesMarshal := nominalGlyphIndices is VarRef ? "ushort*" : "ptr"

        result := ComCall(28, this, "uint", glyphCount, nominalGlyphIndicesMarshal, nominalGlyphIndices, "ushort*", &verticalGlyphIndices := 0, "HRESULT")
        return verticalGlyphIndices
    }

    /**
     * Determines whether the font has any vertical glyph variants.
     * @returns {BOOL} Returns TRUE if the font contains vertical glyph variants, otherwise FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritefontface1-hasverticalglyphvariants
     */
    HasVerticalGlyphVariants() {
        result := ComCall(29, this, "int")
        return result
    }
}
