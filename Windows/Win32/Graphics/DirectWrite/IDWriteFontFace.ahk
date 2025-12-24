#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFile.ahk
#Include .\DWRITE_GLYPH_METRICS.ahk
#Include .\DWRITE_FONT_METRICS.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface exposes various font data such as metrics, names, and glyph outlines. It contains font face type, appropriate file references, and face identification data.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritefontface
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontFace extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontFace
     * @type {Guid}
     */
    static IID => Guid("{5f49804d-7024-4d43-bfa9-d25984f53849}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetType", "GetFiles", "GetIndex", "GetSimulations", "IsSymbolFont", "GetMetrics", "GetGlyphCount", "GetDesignGlyphMetrics", "GetGlyphIndices", "TryGetFontTable", "ReleaseFontTable", "GetGlyphRunOutline", "GetRecommendedRenderingMode", "GetGdiCompatibleMetrics", "GetGdiCompatibleGlyphMetrics"]

    /**
     * Obtains the file format type of a font face.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dwrite/ne-dwrite-dwrite_font_face_type">DWRITE_FONT_FACE_TYPE</a></b>
     * 
     * A value that indicates the type of format for the font face (such as Type 1, TrueType, vector, or bitmap).
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontface-gettype
     */
    GetType() {
        result := ComCall(3, this, "int")
        return result
    }

    /**
     * Obtains the font files representing a font face.
     * @param {Pointer<Integer>} numberOfFiles Type: <b>UINT32*</b>
     * 
     * If <i>fontFiles</i> is <b>NULL</b>, receives the number of files representing the font face.  Otherwise, the number of font files being requested should be passed.  See the Remarks section below for more information.
     * @returns {IDWriteFontFile} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfile">IDWriteFontFile</a>**</b>
     * 
     * When this method returns, contains a pointer to a user-provided array that stores pointers to font files representing the font face.
     *      This parameter can be <b>NULL</b> if the user wants only the number of files representing the font face.
     *      This API increments reference count of the font file pointers returned according to COM conventions, and the client
     *      should release them when finished.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontface-getfiles
     */
    GetFiles(numberOfFiles) {
        numberOfFilesMarshal := numberOfFiles is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, numberOfFilesMarshal, numberOfFiles, "ptr*", &fontFiles := 0, "HRESULT")
        return IDWriteFontFile(fontFiles)
    }

    /**
     * Obtains the index of a font face in the context of its font files.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * The zero-based index of a font face in cases when the font files contain a collection of font faces.
     *      If the font files contain a single face, this value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontface-getindex
     */
    GetIndex() {
        result := ComCall(5, this, "uint")
        return result
    }

    /**
     * Obtains the algorithmic style simulation flags of a font face.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dwrite/ne-dwrite-dwrite_font_simulations">DWRITE_FONT_SIMULATIONS</a></b>
     * 
     * Font face simulation flags for algorithmic means of making text bold or italic.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontface-getsimulations
     */
    GetSimulations() {
        result := ComCall(6, this, "int")
        return result
    }

    /**
     * Determines whether the font is a symbol font.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns <b>TRUE</b> if the font is a symbol font, otherwise <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontface-issymbolfont
     */
    IsSymbolFont() {
        result := ComCall(7, this, "int")
        return result
    }

    /**
     * Obtains design units and common metrics for the font face. These metrics are applicable to all the glyphs within a font face and are used by applications for layout calculations.
     * @param {Pointer<DWRITE_FONT_METRICS>} fontFaceMetrics Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_font_metrics">DWRITE_FONT_METRICS</a>*</b>
     * 
     * When this method returns, a <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_font_metrics">DWRITE_FONT_METRICS</a> structure that holds metrics (such as ascent, descent, or cap height) for the current font face element.
     *      The metrics returned by this function are in font design units.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontface-getmetrics
     */
    GetMetrics(fontFaceMetrics) {
        ComCall(8, this, "ptr", fontFaceMetrics)
    }

    /**
     * Obtains the number of glyphs in the font face.
     * @returns {Integer} Type: <b>UINT16</b>
     * 
     * The number of glyphs in the font face.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontface-getglyphcount
     */
    GetGlyphCount() {
        result := ComCall(9, this, "ushort")
        return result
    }

    /**
     * Obtains ideal (resolution-independent) glyph metrics in font design units.
     * @param {Pointer<Integer>} glyphIndices Type: <b>const UINT16*</b>
     * 
     *  An array of glyph indices for which to compute  metrics. The array must contain at least as many elements as specified by <i>glyphCount</i>.
     * @param {Integer} glyphCount Type: <b>UINT32</b>
     * 
     * The number of elements in the <i>glyphIndices</i> array.
     * @param {BOOL} isSideways Type: <b>BOOL</b>
     * 
     * Indicates whether the font is being used in a sideways run. This can affect the glyph metrics if the font has oblique simulation
     *     because sideways oblique simulation differs from non-sideways oblique simulation
     * @returns {DWRITE_GLYPH_METRICS} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_metrics">DWRITE_GLYPH_METRICS</a>*</b>
     * 
     * When this method returns, contains an array of DWRITE_GLYPH_METRICS structures.  <i>glyphMetrics</i> must be initialized with an empty buffer that contains at least as many elements as <i>glyphCount</i>.
     *      The metrics returned by this function are in font design units.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontface-getdesignglyphmetrics
     */
    GetDesignGlyphMetrics(glyphIndices, glyphCount, isSideways) {
        glyphIndicesMarshal := glyphIndices is VarRef ? "ushort*" : "ptr"

        glyphMetrics := DWRITE_GLYPH_METRICS()
        result := ComCall(10, this, glyphIndicesMarshal, glyphIndices, "uint", glyphCount, "ptr", glyphMetrics, "int", isSideways, "HRESULT")
        return glyphMetrics
    }

    /**
     * Returns the nominal mapping of UCS4 Unicode code points to glyph indices as defined by the font 'CMAP' table.
     * @param {Pointer<Integer>} codePoints Type: <b>const UINT32*</b>
     * 
     * An array of USC4 code points from which to obtain nominal glyph indices. The array must be allocated and be able to contain the number of elements specified by <i>codePointCount</i>.
     * @param {Integer} codePointCount Type: <b>UINT32</b>
     * 
     * The number of elements in the <i>codePoints</i> array.
     * @returns {Integer} Type: <b>UINT16*</b>
     * 
     * When this method returns, contains a pointer to an array of nominal glyph indices filled by this function.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontface-getglyphindices
     */
    GetGlyphIndices(codePoints, codePointCount) {
        codePointsMarshal := codePoints is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, codePointsMarshal, codePoints, "uint", codePointCount, "ushort*", &glyphIndices := 0, "HRESULT")
        return glyphIndices
    }

    /**
     * Finds the specified OpenType font table if it exists and returns a pointer to it. The function accesses the underlying font data through the IDWriteFontFileStream interface implemented by the font file loader.
     * @param {Integer} openTypeTableTag Type: <b>UINT32</b>
     * 
     * The four-character tag of a OpenType font table to find.
     *          Use the <b>DWRITE_MAKE_OPENTYPE_TAG</b> macro to create it as an <b>UINT32</b>.
     *          Unlike GDI, it does not support the special TTCF and null tags to access the whole font.
     * @param {Pointer<Pointer<Void>>} tableData Type: <b>const void**</b>
     * 
     * When this method returns, contains the address of  a pointer to the base of the table in memory.
     *          The pointer is valid only as long as the font face used to get the font table still exists;
     *          (not any other font face, even if it actually refers to the same physical font).
     *     This parameter is passed uninitialized.
     * @param {Pointer<Integer>} tableSize Type: <b>UINT32*</b>
     * 
     * When this method returns, contains a pointer to the size, in bytes, of the font table.
     * @param {Pointer<Pointer<Void>>} tableContext Type: <b>void**</b>
     * 
     * When this method returns, the address of a pointer to  the opaque context, which must be freed by calling <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontface-releasefonttable">ReleaseFontTable</a>.
     *          The context actually comes from the lower-level <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfilestream">IDWriteFontFileStream</a>,
     *          which may be implemented by the application or DWrite itself.
     *          It is possible for a <b>NULL</b> <i>tableContext</i> to be returned, especially if
     *          the implementation performs direct memory mapping on the whole file.
     *          Nevertheless, always release it later, and do not use it as a test for function success.
     *          The same table can be queried multiple times,
     *          but because each returned context can be different, you must release each context separately.
     * @param {Pointer<BOOL>} exists Type: <b>BOOL*</b>
     * 
     * When this method returns, <b>TRUE</b> if the font table exists; otherwise, <b>FALSE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontface-trygetfonttable
     */
    TryGetFontTable(openTypeTableTag, tableData, tableSize, tableContext, exists) {
        tableDataMarshal := tableData is VarRef ? "ptr*" : "ptr"
        tableSizeMarshal := tableSize is VarRef ? "uint*" : "ptr"
        tableContextMarshal := tableContext is VarRef ? "ptr*" : "ptr"
        existsMarshal := exists is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, "uint", openTypeTableTag, tableDataMarshal, tableData, tableSizeMarshal, tableSize, tableContextMarshal, tableContext, existsMarshal, exists, "HRESULT")
        return result
    }

    /**
     * Releases the table obtained earlier from TryGetFontTable.
     * @param {Pointer<Void>} tableContext Type: <b>void*</b>
     * 
     * A pointer to the opaque context from <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontface-trygetfonttable">TryGetFontTable</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontface-releasefonttable
     */
    ReleaseFontTable(tableContext) {
        tableContextMarshal := tableContext is VarRef ? "ptr" : "ptr"

        ComCall(13, this, tableContextMarshal, tableContext)
    }

    /**
     * Computes the outline of a run of glyphs by calling back to the outline sink interface.
     * @param {Float} emSize Type: <b>FLOAT</b>
     * 
     * The logical size of the font in DIP units. A DIP ("device-independent pixel") equals 1/96 inch.
     * @param {Pointer<Integer>} glyphIndices Type: <b>const UINT16*</b>
     * 
     * An array of glyph indices. The glyphs are in logical order and the advance direction depends on the <i>isRightToLeft</i> parameter. The array must be allocated and be able to contain the number of elements specified by <i>glyphCount</i>.
     * @param {Pointer<Float>} glyphAdvances Type: <b>const FLOAT*</b>
     * 
     * An optional array of glyph advances in DIPs. The advance of a glyph is the amount to advance the position (in the direction of the baseline) after drawing the glyph. <i>glyphAdvances</i> contains the number of elements specified by <i>glyphCount</i>.
     * @param {Pointer<DWRITE_GLYPH_OFFSET>} glyphOffsets Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_offset">DWRITE_GLYPH_OFFSET</a>*</b>
     * 
     * An optional array of glyph offsets, each of which specifies the offset along the baseline and offset perpendicular to the baseline of a glyph relative to the current pen position.   <i>glyphOffsets</i> contains the number of elements specified by <i>glyphCount</i>.
     * @param {Integer} glyphCount Type: <b>UINT32</b>
     * 
     * The number of glyphs in the run.
     * @param {BOOL} isSideways Type: <b>BOOL</b>
     * 
     * If <b>TRUE</b>, the ascender of the glyph runs alongside the baseline. If <b>FALSE</b>, the glyph ascender runs perpendicular to the baseline. For example, an English alphabet on a vertical baseline would have <i>isSideways</i> set to <b>FALSE</b>.
     * 
     * A client can render a vertical run by setting <i>isSideways</i> to <b>TRUE</b> and rotating the resulting geometry 90 degrees to the
     *      right using a transform. The <i>isSideways</i> and <i>isRightToLeft</i> parameters cannot both be true.
     * @param {BOOL} isRightToLeft Type: <b>BOOL</b>
     * 
     * The visual order of the glyphs. If this parameter is <b>FALSE</b>, then glyph advances are from left to right. If <b>TRUE</b>, the advance direction is right to left. By default, the advance direction
     *      is left to right.
     * @param {ID2D1SimplifiedGeometrySink} geometrySink Type: <b><a href="https://docs.microsoft.com/windows/win32/DirectWrite/idwritegeometrysink">IDWriteGeometrySink</a>*</b>
     * 
     * A pointer to the interface that is called back to perform outline drawing operations.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontface-getglyphrunoutline
     */
    GetGlyphRunOutline(emSize, glyphIndices, glyphAdvances, glyphOffsets, glyphCount, isSideways, isRightToLeft, geometrySink) {
        glyphIndicesMarshal := glyphIndices is VarRef ? "ushort*" : "ptr"
        glyphAdvancesMarshal := glyphAdvances is VarRef ? "float*" : "ptr"

        result := ComCall(14, this, "float", emSize, glyphIndicesMarshal, glyphIndices, glyphAdvancesMarshal, glyphAdvances, "ptr", glyphOffsets, "uint", glyphCount, "int", isSideways, "int", isRightToLeft, "ptr", geometrySink, "HRESULT")
        return result
    }

    /**
     * Determines the recommended rendering mode for the font, using the specified size and rendering parameters.
     * @param {Float} emSize Type: <b>FLOAT</b>
     * 
     * The logical size of the font in DIP units. A DIP ("device-independent pixel") equals 1/96 inch.
     * @param {Float} pixelsPerDip Type: <b>FLOAT</b>
     * 
     * The number of physical pixels per DIP. For example, if the DPI of the rendering surface is 96, this 
     *      value is 1.0f. If the DPI is 120, this value is 120.0f/96.
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
     * @param {IDWriteRenderingParams} renderingParams Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriterenderingparams">IDWriteRenderingParams</a>*</b>
     * 
     * A pointer to an object that contains rendering settings such as gamma level, enhanced contrast, and ClearType level. This parameter is necessary in case the rendering parameters 
     *      object overrides the rendering mode.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_rendering_mode">DWRITE_RENDERING_MODE</a>*</b>
     * 
     * When this method returns, contains a value that indicates the recommended rendering mode to use.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontface-getrecommendedrenderingmode
     */
    GetRecommendedRenderingMode(emSize, pixelsPerDip, measuringMode, renderingParams) {
        result := ComCall(15, this, "float", emSize, "float", pixelsPerDip, "int", measuringMode, "ptr", renderingParams, "int*", &renderingMode := 0, "HRESULT")
        return renderingMode
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
     * @returns {DWRITE_FONT_METRICS} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_font_metrics">DWRITE_FONT_METRICS</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_font_metrics">DWRITE_FONT_METRIC</a>S structure to fill in. The metrics returned by this function are in font design units.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontface-getgdicompatiblemetrics
     */
    GetGdiCompatibleMetrics(emSize, pixelsPerDip, transform) {
        fontFaceMetrics := DWRITE_FONT_METRICS()
        result := ComCall(16, this, "float", emSize, "float", pixelsPerDip, "ptr", transform, "ptr", fontFaceMetrics, "HRESULT")
        return fontFaceMetrics
    }

    /**
     * Obtains glyph metrics in font design units with the return values compatible with what GDI would produce.
     * @param {Float} emSize Type: <b>FLOAT</b>
     * 
     * The ogical size of the font in DIP units.
     * @param {Float} pixelsPerDip Type: <b>FLOAT</b>
     * 
     * The number of physical pixels per DIP.
     * @param {Pointer<DWRITE_MATRIX>} transform Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix">DWRITE_MATRIX</a>*</b>
     * 
     * An optional transform applied to the glyphs and their positions. This transform is applied after the
     *     scaling specified by the font size and <i>pixelsPerDip</i>.
     * @param {BOOL} useGdiNatural Type: <b>BOOL</b>
     * 
     * When set to <b>FALSE</b>, the metrics are the same as the metrics of GDI aliased text.  When set to <b>TRUE</b>, the metrics are the same as the metrics of text measured by GDI using a font created with <b>CLEARTYPE_NATURAL_QUALITY</b>.
     * @param {Pointer<Integer>} glyphIndices Type: <b>const UINT16*</b>
     * 
     * An array of glyph indices for which to compute the metrics.
     * @param {Integer} glyphCount Type: <b>UINT32</b>
     * 
     * The number of elements in the <i>glyphIndices</i> array.
     * @param {BOOL} isSideways Type: <b>BOOL</b>
     * 
     * A BOOL value that indicates whether the font is being used in a sideways run.  This can affect the glyph metrics if the font has oblique simulation because sideways oblique simulation differs from non-sideways oblique simulation.
     * @returns {DWRITE_GLYPH_METRICS} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_metrics">DWRITE_GLYPH_METRICS</a>*</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_metrics">DWRITE_GLYPH_METRICS</a> structures filled by this function. The metrics are in font design units.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontface-getgdicompatibleglyphmetrics
     */
    GetGdiCompatibleGlyphMetrics(emSize, pixelsPerDip, transform, useGdiNatural, glyphIndices, glyphCount, isSideways) {
        glyphIndicesMarshal := glyphIndices is VarRef ? "ushort*" : "ptr"

        glyphMetrics := DWRITE_GLYPH_METRICS()
        result := ComCall(17, this, "float", emSize, "float", pixelsPerDip, "ptr", transform, "int", useGdiNatural, glyphIndicesMarshal, glyphIndices, "uint", glyphCount, "ptr", glyphMetrics, "int", isSideways, "HRESULT")
        return glyphMetrics
    }
}
