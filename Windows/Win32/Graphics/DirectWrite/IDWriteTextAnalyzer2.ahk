#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DWRITE_GLYPH_ORIENTATION_ANGLE.ahk" { DWRITE_GLYPH_ORIENTATION_ANGLE }
#Import ".\DWRITE_MATRIX.ahk" { DWRITE_MATRIX }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDWriteTextAnalyzer1.ahk" { IDWriteTextAnalyzer1 }
#Import ".\DWRITE_FONT_FEATURE_TAG.ahk" { DWRITE_FONT_FEATURE_TAG }
#Import ".\IDWriteFontFace.ahk" { IDWriteFontFace }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DWRITE_SCRIPT_ANALYSIS.ahk" { DWRITE_SCRIPT_ANALYSIS }

/**
 * Analyzes various text properties for complex script processing.
 * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritetextanalyzer2
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteTextAnalyzer2 extends IDWriteTextAnalyzer1 {
    /**
     * The interface identifier for IDWriteTextAnalyzer2
     * @type {Guid}
     */
    static IID := Guid("{553a9ff3-5693-4df7-b52b-74806f7f2eb9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteTextAnalyzer2 interfaces
    */
    struct Vtbl extends IDWriteTextAnalyzer1.Vtbl {
        GetGlyphOrientationTransform : IntPtr
        GetTypographicFeatures       : IntPtr
        CheckTypographicFeature      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteTextAnalyzer2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns 2x3 transform matrix for the respective angle to draw the glyph run. (IDWriteTextAnalyzer2.GetGlyphOrientationTransform)
     * @param {DWRITE_GLYPH_ORIENTATION_ANGLE} glyphOrientationAngle Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_glyph_orientation_angle">DWRITE_GLYPH_ORIENTATION_ANGLE</a></b>
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
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextanalyzer2-getglyphorientationtransform
     */
    GetGlyphOrientationTransform(glyphOrientationAngle, isSideways, originX, originY) {
        transform := DWRITE_MATRIX()
        result := ComCall(19, this, DWRITE_GLYPH_ORIENTATION_ANGLE, glyphOrientationAngle, BOOL, isSideways, "float", originX, "float", originY, DWRITE_MATRIX.Ptr, transform, "HRESULT")
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
     * @param {Pointer<DWRITE_FONT_FEATURE_TAG>} tags Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_feature_tag">DWRITE_FONT_FEATURE_TAG</a>*</b>
     * 
     * An array of OpenType font feature tags.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextanalyzer2-gettypographicfeatures
     */
    GetTypographicFeatures(fontFace, scriptAnalysis, localeName, maxTagCount, actualTagCount, tags) {
        localeName := localeName is String ? StrPtr(localeName) : localeName

        actualTagCountMarshal := actualTagCount is VarRef ? "uint*" : "ptr"
        tagsMarshal := tags is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, "ptr", fontFace, DWRITE_SCRIPT_ANALYSIS, scriptAnalysis, "ptr", localeName, "uint", maxTagCount, actualTagCountMarshal, actualTagCount, tagsMarshal, tags, "HRESULT")
        return result
    }

    /**
     * Checks if a typographic feature is available for a glyph or a set of glyphs.
     * @param {IDWriteFontFace} fontFace The font face to read glyph information from.
     * @param {DWRITE_SCRIPT_ANALYSIS} scriptAnalysis The script analysis for the script or font to check.
     * @param {PWSTR} localeName The locale name to check.
     * @param {DWRITE_FONT_FEATURE_TAG} featureTag The font feature tag to check.
     * @param {Integer} glyphCount The number of glyphs to check.
     * @param {Pointer<Integer>} glyphIndices An array of glyph indices to check.
     * @returns {Integer} An array of integers that indicate whether or not the font feature applies to each glyph specified.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextanalyzer2-checktypographicfeature
     */
    CheckTypographicFeature(fontFace, scriptAnalysis, localeName, featureTag, glyphCount, glyphIndices) {
        localeName := localeName is String ? StrPtr(localeName) : localeName

        glyphIndicesMarshal := glyphIndices is VarRef ? "ushort*" : "ptr"

        result := ComCall(21, this, "ptr", fontFace, DWRITE_SCRIPT_ANALYSIS, scriptAnalysis, "ptr", localeName, DWRITE_FONT_FEATURE_TAG, featureTag, "uint", glyphCount, glyphIndicesMarshal, glyphIndices, "char*", &featureApplies := 0, "HRESULT")
        return featureApplies
    }

    Query(iid) {
        if (IDWriteTextAnalyzer2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetGlyphOrientationTransform := CallbackCreate(GetMethod(implObj, "GetGlyphOrientationTransform"), flags, 6)
        this.vtbl.GetTypographicFeatures := CallbackCreate(GetMethod(implObj, "GetTypographicFeatures"), flags, 7)
        this.vtbl.CheckTypographicFeature := CallbackCreate(GetMethod(implObj, "CheckTypographicFeature"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetGlyphOrientationTransform)
        CallbackFree(this.vtbl.GetTypographicFeatures)
        CallbackFree(this.vtbl.CheckTypographicFeature)
    }
}
