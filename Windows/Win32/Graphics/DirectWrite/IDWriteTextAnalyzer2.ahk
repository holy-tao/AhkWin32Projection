#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DWRITE_MATRIX.ahk
#Include .\IDWriteTextAnalyzer1.ahk

/**
 * Analyzes various text properties for complex script processing.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nn-dwrite_2-idwritetextanalyzer2
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteTextAnalyzer2 extends IDWriteTextAnalyzer1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteTextAnalyzer2
     * @type {Guid}
     */
    static IID => Guid("{553a9ff3-5693-4df7-b52b-74806f7f2eb9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGlyphOrientationTransform", "GetTypographicFeatures", "CheckTypographicFeature"]

    /**
     * Returns 2x3 transform matrix for the respective angle to draw the glyph run.
     * @param {Integer} glyphOrientationAngle Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_glyph_orientation_angle">DWRITE_GLYPH_ORIENTATION_ANGLE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_glyph_orientation_angle">DWRITE_GLYPH_ORIENTATION_ANGLE</a>-typed value that specifies the angle that was reported into
     *     <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritetextanalysissink1-setglyphorientation">IDWriteTextAnalysisSink1::SetGlyphOrientation</a>.
     * @param {BOOL} isSideways Type: <b>BOOL</b>
     * 
     * Whether the run's glyphs are sideways or not.
     * @param {Float} originX Type: <b>FLOAT</b>
     * 
     * The X value of the baseline origin.
     * @param {Float} originY Type: <b>FLOAT</b>
     * 
     * The Y value of the baseline origin.
     * @returns {DWRITE_MATRIX} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix">DWRITE_MATRIX</a>*</b>
     * 
     * Returned transform.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritetextanalyzer2-getglyphorientationtransform
     */
    GetGlyphOrientationTransform(glyphOrientationAngle, isSideways, originX, originY) {
        transform := DWRITE_MATRIX()
        result := ComCall(19, this, "int", glyphOrientationAngle, "int", isSideways, "float", originX, "float", originY, "ptr", transform, "HRESULT")
        return transform
    }

    /**
     * Returns a complete list of OpenType features available for a script or font.
     * @param {IDWriteFontFace} fontFace Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontface">IDWriteFontFace</a>*</b>
     * 
     * The font face to get features from.
     * @param {DWRITE_SCRIPT_ANALYSIS} scriptAnalysis Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_script_analysis">DWRITE_SCRIPT_ANALYSIS</a></b>
     * 
     * The script analysis for the script or font to check.
     * @param {PWSTR} localeName Type: <b>const WCHAR*</b>
     * 
     * The locale name to check.
     * @param {Integer} maxTagCount Type: <b>UINT32</b>
     * 
     * The maximum number of tags to return.
     * @param {Pointer<Integer>} actualTagCount Type: <b>UINT32*</b>
     * 
     * The actual number of tags returned.
     * @param {Pointer<Integer>} tags Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_feature_tag">DWRITE_FONT_FEATURE_TAG</a>*</b>
     * 
     * An array of OpenType font feature tags.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritetextanalyzer2-gettypographicfeatures
     */
    GetTypographicFeatures(fontFace, scriptAnalysis, localeName, maxTagCount, actualTagCount, tags) {
        localeName := localeName is String ? StrPtr(localeName) : localeName

        actualTagCountMarshal := actualTagCount is VarRef ? "uint*" : "ptr"
        tagsMarshal := tags is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, "ptr", fontFace, "ptr", scriptAnalysis, "ptr", localeName, "uint", maxTagCount, actualTagCountMarshal, actualTagCount, tagsMarshal, tags, "HRESULT")
        return result
    }

    /**
     * Checks if a typographic feature is available for a glyph or a set of glyphs.
     * @param {IDWriteFontFace} fontFace The font face to read glyph information from.
     * @param {DWRITE_SCRIPT_ANALYSIS} scriptAnalysis The script analysis for the script or font to check.
     * @param {PWSTR} localeName The locale name to check.
     * @param {Integer} featureTag The font feature tag to check.
     * @param {Integer} glyphCount The number of glyphs to check.
     * @param {Pointer<Integer>} glyphIndices An array of glyph indices to check.
     * @returns {Integer} An array of integers that indicate whether or not the font feature applies to each glyph specified.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritetextanalyzer2-checktypographicfeature
     */
    CheckTypographicFeature(fontFace, scriptAnalysis, localeName, featureTag, glyphCount, glyphIndices) {
        localeName := localeName is String ? StrPtr(localeName) : localeName

        glyphIndicesMarshal := glyphIndices is VarRef ? "ushort*" : "ptr"

        result := ComCall(21, this, "ptr", fontFace, "ptr", scriptAnalysis, "ptr", localeName, "uint", featureTag, "uint", glyphCount, glyphIndicesMarshal, glyphIndices, "char*", &featureApplies := 0, "HRESULT")
        return featureApplies
    }
}
