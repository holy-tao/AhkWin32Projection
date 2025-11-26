#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Analyzes various text properties for complex script processing such as bidirectional (bidi) support for languages like Arabic, determination of line break opportunities, glyph placement, and number substitution.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritetextanalyzer
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteTextAnalyzer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteTextAnalyzer
     * @type {Guid}
     */
    static IID => Guid("{b7e6163e-7f46-43b4-84b3-e4e6249c365d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AnalyzeScript", "AnalyzeBidi", "AnalyzeNumberSubstitution", "AnalyzeLineBreakpoints", "GetGlyphs", "GetGlyphPlacements", "GetGdiCompatibleGlyphPlacements"]

    /**
     * Analyzes a text range for script boundaries, reading text attributes from the source and reporting the Unicode script ID to the sink callback SetScript.
     * @param {IDWriteTextAnalysisSource} analysisSource Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextanalysissource">IDWriteTextAnalysisSource</a>*</b>
     * 
     * A pointer to the source object to analyze.
     * @param {Integer} textPosition Type: <b>UINT32</b>
     * 
     * The starting text position within the source object.
     * @param {Integer} textLength Type: <b>UINT32</b>
     * 
     * The text length to analyze.
     * @param {IDWriteTextAnalysisSink} analysisSink Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextanalysissink">IDWriteTextAnalysisSink</a>*</b>
     * 
     * A pointer to the sink callback object that receives the text analysis.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextanalyzer-analyzescript
     */
    AnalyzeScript(analysisSource, textPosition, textLength, analysisSink) {
        result := ComCall(3, this, "ptr", analysisSource, "uint", textPosition, "uint", textLength, "ptr", analysisSink, "HRESULT")
        return result
    }

    /**
     * Analyzes a text range for script directionality, reading attributes from the source and reporting levels to the sink callback SetBidiLevel.
     * @param {IDWriteTextAnalysisSource} analysisSource Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextanalysissource">IDWriteTextAnalysisSource</a>*</b>
     * 
     * A pointer to a source object to analyze.
     * @param {Integer} textPosition Type: <b>UINT32</b>
     * 
     * The starting text position within the source object.
     * @param {Integer} textLength Type: <b>UINT32</b>
     * 
     * The text length to analyze.
     * @param {IDWriteTextAnalysisSink} analysisSink Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextanalysissink">IDWriteTextAnalysisSink</a>*</b>
     * 
     * A pointer to the sink callback object that receives the text analysis.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextanalyzer-analyzebidi
     */
    AnalyzeBidi(analysisSource, textPosition, textLength, analysisSink) {
        result := ComCall(4, this, "ptr", analysisSource, "uint", textPosition, "uint", textLength, "ptr", analysisSink, "HRESULT")
        return result
    }

    /**
     * Analyzes a text range for spans where number substitution is applicable, reading attributes from the source and reporting substitutable ranges to the sink callback SetNumberSubstitution.
     * @param {IDWriteTextAnalysisSource} analysisSource Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextanalysissource">IDWriteTextAnalysisSource</a>*</b>
     * 
     * The source object to analyze.
     * @param {Integer} textPosition Type: <b>UINT32</b>
     * 
     * The starting position within the source object.
     * @param {Integer} textLength Type: <b>UINT32</b>
     * 
     * The length to analyze.
     * @param {IDWriteTextAnalysisSink} analysisSink Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextanalysissink">IDWriteTextAnalysisSink</a>*</b>
     * 
     * A pointer to the sink callback object that receives the text analysis.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextanalyzer-analyzenumbersubstitution
     */
    AnalyzeNumberSubstitution(analysisSource, textPosition, textLength, analysisSink) {
        result := ComCall(5, this, "ptr", analysisSource, "uint", textPosition, "uint", textLength, "ptr", analysisSink, "HRESULT")
        return result
    }

    /**
     * Analyzes a text range for potential breakpoint opportunities, reading attributes from the source and reporting breakpoint opportunities to the sink callback SetLineBreakpoints.
     * @param {IDWriteTextAnalysisSource} analysisSource Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextanalysissource">IDWriteTextAnalysisSource</a>*</b>
     * 
     * A pointer to the source object to analyze.
     * @param {Integer} textPosition Type: <b>UINT32</b>
     * 
     * The starting text position within the source object.
     * @param {Integer} textLength Type: <b>UINT32</b>
     * 
     * The text length to analyze.
     * @param {IDWriteTextAnalysisSink} analysisSink Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextanalysissink">IDWriteTextAnalysisSink</a>*</b>
     * 
     * A pointer to the  sink callback object that receives the text analysis.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextanalyzer-analyzelinebreakpoints
     */
    AnalyzeLineBreakpoints(analysisSource, textPosition, textLength, analysisSink) {
        result := ComCall(6, this, "ptr", analysisSource, "uint", textPosition, "uint", textLength, "ptr", analysisSink, "HRESULT")
        return result
    }

    /**
     * Parses the input text string and maps it to the set of glyphs and associated glyph data according to the font and the writing system's rendering rules.
     * @param {PWSTR} textString Type: <b>const WCHAR*</b>
     * 
     * An array of characters to convert to glyphs.
     * @param {Integer} textLength Type: <b>UINT32</b>
     * 
     * The length of <i>textString</i>.
     * @param {IDWriteFontFace} fontFace Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontface">IDWriteFontFace</a>*</b>
     * 
     * The font face that is the source of the output glyphs.
     * @param {BOOL} isSideways Type: <b>BOOL</b>
     * 
     * A Boolean flag set to <b>TRUE</b> if the text is intended to be
     *      drawn vertically.
     * @param {BOOL} isRightToLeft Type: <b>BOOL</b>
     * 
     * A Boolean flag set to <b>TRUE</b> for right-to-left text.
     * @param {Pointer<DWRITE_SCRIPT_ANALYSIS>} scriptAnalysis Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_script_analysis">DWRITE_SCRIPT_ANALYSIS</a>*</b>
     * 
     * A pointer to a Script analysis result from an <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-analyzescript">AnalyzeScript</a> call.
     * @param {PWSTR} localeName Type: <b>const WCHAR*</b>
     * 
     * The locale to use when selecting glyphs.
     *      For example the same character may map to different glyphs for ja-jp versus zh-chs.
     *      If this is <b>NULL</b>, then the default mapping based on the script is used.
     * @param {IDWriteNumberSubstitution} numberSubstitution Type: <b><a href="https://docs.microsoft.com/windows/win32/DirectWrite/idwritenumbersubstitution">IDWriteNumberSubstitution</a>*</b>
     * 
     * A pointer to an optional number substitution which selects the appropriate glyphs for digits and related numeric characters, depending on the results obtained from <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-analyzenumbersubstitution">AnalyzeNumberSubstitution</a>. Passing <b>NULL</b> indicates that no substitution is needed and that the digits should receive nominal glyphs.
     * @param {Pointer<Pointer<DWRITE_TYPOGRAPHIC_FEATURES>>} features Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_typographic_features">DWRITE_TYPOGRAPHIC_FEATURES</a>**</b>
     * 
     * An array of pointers to the sets of typographic 
     *      features to use in each feature range.
     * @param {Pointer<Integer>} featureRangeLengths Type: <b>const UINT32*</b>
     * 
     * The length of each feature range, in characters.  
     *      The sum of all lengths should be equal to <i>textLength</i>.
     * @param {Integer} featureRanges Type: <b>UINT32</b>
     * 
     * The number of feature ranges.
     * @param {Integer} maxGlyphCount Type: <b>UINT32</b>
     * 
     * The maximum number of glyphs that can be
     *      returned.
     * @param {Pointer<Integer>} clusterMap Type: <b>UINT16*</b>
     * 
     * When this method returns, contains the mapping from character ranges to glyph 
     *      ranges.
     * @param {Pointer<DWRITE_SHAPING_TEXT_PROPERTIES>} textProps Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_shaping_text_properties">DWRITE_SHAPING_TEXT_PROPERTIES</a>*</b>
     * 
     * When this method returns, contains a pointer to an array of structures that contains  shaping properties for each character.
     * @param {Pointer<Integer>} glyphIndices Type: <b>UINT16*</b>
     * 
     * The output glyph indices.
     * @param {Pointer<DWRITE_SHAPING_GLYPH_PROPERTIES>} glyphProps Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_shaping_glyph_properties">DWRITE_SHAPING_GLYPH_PROPERTIES</a>*</b>
     * 
     * When this method returns, contains a pointer to an array of structures that contain  shaping properties for each output glyph.
     * @param {Pointer<Integer>} actualGlyphCount Type: <b>UINT32*</b>
     * 
     * When this method returns, contains the actual number of glyphs returned if
     *      the call succeeds.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextanalyzer-getglyphs
     */
    GetGlyphs(textString, textLength, fontFace, isSideways, isRightToLeft, scriptAnalysis, localeName, numberSubstitution, features, featureRangeLengths, featureRanges, maxGlyphCount, clusterMap, textProps, glyphIndices, glyphProps, actualGlyphCount) {
        textString := textString is String ? StrPtr(textString) : textString
        localeName := localeName is String ? StrPtr(localeName) : localeName

        featuresMarshal := features is VarRef ? "ptr*" : "ptr"
        featureRangeLengthsMarshal := featureRangeLengths is VarRef ? "uint*" : "ptr"
        clusterMapMarshal := clusterMap is VarRef ? "ushort*" : "ptr"
        glyphIndicesMarshal := glyphIndices is VarRef ? "ushort*" : "ptr"
        actualGlyphCountMarshal := actualGlyphCount is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", textString, "uint", textLength, "ptr", fontFace, "int", isSideways, "int", isRightToLeft, "ptr", scriptAnalysis, "ptr", localeName, "ptr", numberSubstitution, featuresMarshal, features, featureRangeLengthsMarshal, featureRangeLengths, "uint", featureRanges, "uint", maxGlyphCount, clusterMapMarshal, clusterMap, "ptr", textProps, glyphIndicesMarshal, glyphIndices, "ptr", glyphProps, actualGlyphCountMarshal, actualGlyphCount, "HRESULT")
        return result
    }

    /**
     * Places glyphs output from the GetGlyphs method according to the font and the writing system's rendering rules.
     * @param {PWSTR} textString Type: <b>const WCHAR*</b>
     * 
     * An array of characters containing the original string from which the glyphs came.
     * @param {Pointer<Integer>} clusterMap Type: <b>const UINT16*</b>
     * 
     * A pointer to the mapping from character ranges to glyph 
     *      ranges. This is returned by <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-getglyphs">GetGlyphs</a>.
     * @param {Pointer<DWRITE_SHAPING_TEXT_PROPERTIES>} textProps Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_shaping_text_properties">DWRITE_SHAPING_TEXT_PROPERTIES</a>*</b>
     * 
     * A pointer to an array of structures that contains  shaping properties for each character. This structure is returned by 
     *      <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-getglyphs">GetGlyphs</a>.
     * @param {Integer} textLength Type: <b>UINT32</b>
     * 
     * The text length of <i>textString</i>.
     * @param {Pointer<Integer>} glyphIndices Type: <b>const UINT16*</b>
     * 
     * An array of glyph indices returned by <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-getglyphs">GetGlyphs</a>.
     * @param {Pointer<DWRITE_SHAPING_GLYPH_PROPERTIES>} glyphProps Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_shaping_glyph_properties">DWRITE_SHAPING_GLYPH_PROPERTIES</a>*</b>
     * 
     * A pointer to an array of structures that contain  shaping properties for each glyph returned by <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-getglyphs">GetGlyphs</a>.
     * @param {Integer} glyphCount Type: <b>UINT32</b>
     * 
     * The number of glyphs returned from <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-getglyphs">GetGlyphs</a>.
     * @param {IDWriteFontFace} fontFace Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontface">IDWriteFontFace</a>*</b>
     * 
     * A pointer to the font face that is the source for the output glyphs.
     * @param {Float} fontEmSize Type: <b>FLOAT</b>
     * 
     * The logical font size in DIPs.
     * @param {BOOL} isSideways Type: <b>BOOL</b>
     * 
     * A Boolean flag set to <b>TRUE</b> if the text is intended to be
     *      drawn vertically.
     * @param {BOOL} isRightToLeft Type: <b>BOOL</b>
     * 
     * A Boolean flag set to <b>TRUE</b> for right-to-left text.
     * @param {Pointer<DWRITE_SCRIPT_ANALYSIS>} scriptAnalysis Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_script_analysis">DWRITE_SCRIPT_ANALYSIS</a>*</b>
     * 
     * A pointer to a Script analysis result from an <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-analyzescript">AnalyzeScript</a> call.
     * @param {PWSTR} localeName Type: <b>const WCHAR*</b>
     * 
     * An array of characters containing the locale to use when selecting glyphs.
     *      For example, the same character may map to different glyphs for ja-jp versus zh-chs.
     *      If this is <b>NULL</b>, the default mapping based on the script is used.
     * @param {Pointer<Pointer<DWRITE_TYPOGRAPHIC_FEATURES>>} features Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_typographic_features">DWRITE_TYPOGRAPHIC_FEATURES</a>**</b>
     * 
     * An array of pointers to the sets of typographic 
     *      features to use in each feature range.
     * @param {Pointer<Integer>} featureRangeLengths Type: <b>const UINT32*</b>
     * 
     * The length of each feature range, in characters.  
     *      The sum of all lengths should be equal to <i>textLength</i>.
     * @param {Integer} featureRanges Type: <b>UINT32</b>
     * 
     * The number of feature ranges.
     * @param {Pointer<Float>} glyphAdvances Type: <b>FLOAT*</b>
     * 
     * When this method returns, contains the advance width of each glyph.
     * @param {Pointer<DWRITE_GLYPH_OFFSET>} glyphOffsets Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_offset">DWRITE_GLYPH_OFFSET</a>*</b>
     * 
     * When this method returns, contains the offset of the origin of each glyph.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextanalyzer-getglyphplacements
     */
    GetGlyphPlacements(textString, clusterMap, textProps, textLength, glyphIndices, glyphProps, glyphCount, fontFace, fontEmSize, isSideways, isRightToLeft, scriptAnalysis, localeName, features, featureRangeLengths, featureRanges, glyphAdvances, glyphOffsets) {
        textString := textString is String ? StrPtr(textString) : textString
        localeName := localeName is String ? StrPtr(localeName) : localeName

        clusterMapMarshal := clusterMap is VarRef ? "ushort*" : "ptr"
        glyphIndicesMarshal := glyphIndices is VarRef ? "ushort*" : "ptr"
        featuresMarshal := features is VarRef ? "ptr*" : "ptr"
        featureRangeLengthsMarshal := featureRangeLengths is VarRef ? "uint*" : "ptr"
        glyphAdvancesMarshal := glyphAdvances is VarRef ? "float*" : "ptr"

        result := ComCall(8, this, "ptr", textString, clusterMapMarshal, clusterMap, "ptr", textProps, "uint", textLength, glyphIndicesMarshal, glyphIndices, "ptr", glyphProps, "uint", glyphCount, "ptr", fontFace, "float", fontEmSize, "int", isSideways, "int", isRightToLeft, "ptr", scriptAnalysis, "ptr", localeName, featuresMarshal, features, featureRangeLengthsMarshal, featureRangeLengths, "uint", featureRanges, glyphAdvancesMarshal, glyphAdvances, "ptr", glyphOffsets, "HRESULT")
        return result
    }

    /**
     * Place glyphs output from the GetGlyphs method according to the font and the writing system's rendering rules.
     * @param {PWSTR} textString Type: <b>const WCHAR*</b>
     * 
     * An array of characters containing the original string from which the glyphs came.
     * @param {Pointer<Integer>} clusterMap Type: <b>const UINT16*</b>
     * 
     * A pointer to the mapping from character ranges to glyph 
     *      ranges. This is returned by <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-getglyphs">GetGlyphs</a>.
     * @param {Pointer<DWRITE_SHAPING_TEXT_PROPERTIES>} textProps Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_shaping_text_properties">DWRITE_SHAPING_TEXT_PROPERTIES</a>*</b>
     * 
     * A pointer to an array of structures that contains  shaping properties for each character. This structure is returned by 
     *      <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-getglyphs">GetGlyphs</a>.
     * @param {Integer} textLength Type: <b>UINT32</b>
     * 
     * The text length of <i>textString</i>.
     * @param {Pointer<Integer>} glyphIndices Type: <b>const UINT16*</b>
     * 
     * An array of glyph indices returned by <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-getglyphs">GetGlyphs</a>.
     * @param {Pointer<DWRITE_SHAPING_GLYPH_PROPERTIES>} glyphProps Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_shaping_glyph_properties">DWRITE_SHAPING_GLYPH_PROPERTIES</a>*</b>
     * 
     * A pointer to an array of structures that contain  shaping properties for each glyph returned by <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-getglyphs">GetGlyphs</a>.
     * @param {Integer} glyphCount Type: <b>UINT32</b>
     * 
     * The number of glyphs returned from <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-getglyphs">GetGlyphs</a>.
     * @param {IDWriteFontFace} fontFace Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontface">IDWriteFontFace</a>*</b>
     * 
     * A pointer to the font face that is the source for the output glyphs.
     * @param {Float} fontEmSize Type: <b>FLOAT</b>
     * 
     * The logical font size in DIPs.
     * @param {Float} pixelsPerDip Type: <b>FLOAT</b>
     * 
     * The number of physical pixels per DIP.
     * @param {Pointer<DWRITE_MATRIX>} transform Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix">DWRITE_MATRIX</a>*</b>
     * 
     * An optional transform applied to the glyphs and their positions. This transform is applied after the scaling specified by the font size and <i>pixelsPerDip</i>.
     * @param {BOOL} useGdiNatural Type: <b>BOOL</b>
     * 
     * When set to <b>FALSE</b>, the metrics are the same as the metrics of GDI aliased text.  When set to <b>TRUE</b>, the metrics are the same as the metrics of text measured by GDI using a font created with <b>CLEARTYPE_NATURAL_QUALITY</b>.
     * @param {BOOL} isSideways Type: <b>BOOL</b>
     * 
     * A Boolean flag set to <b>TRUE</b> if the text is intended to be
     *      drawn vertically.
     * @param {BOOL} isRightToLeft Type: <b>BOOL</b>
     * 
     * A Boolean flag set to <b>TRUE</b> for right-to-left text.
     * @param {Pointer<DWRITE_SCRIPT_ANALYSIS>} scriptAnalysis Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_script_analysis">DWRITE_SCRIPT_ANALYSIS</a>*</b>
     * 
     * A pointer to a Script analysis result from an<a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-analyzescript">AnalyzeScript</a> call.
     * @param {PWSTR} localeName Type: <b>const WCHAR*</b>
     * 
     * An array of characters containing the locale to use when selecting glyphs.
     *      For example, the same character may map to different glyphs for ja-jp versus zh-chs.
     *      If this is <b>NULL</b>, then the default mapping based on the script is used.
     * @param {Pointer<Pointer<DWRITE_TYPOGRAPHIC_FEATURES>>} features Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_typographic_features">DWRITE_TYPOGRAPHIC_FEATURES</a>**</b>
     * 
     * An array of pointers to the sets of typographic 
     *      features to use in each feature range.
     * @param {Pointer<Integer>} featureRangeLengths Type: <b>const UINT32*</b>
     * 
     * The length of each feature range, in characters.  
     *      The sum of all lengths should be equal to <i>textLength</i>.
     * @param {Integer} featureRanges Type: <b>UINT32</b>
     * 
     * The number of feature ranges.
     * @param {Pointer<Float>} glyphAdvances Type: <b>FLOAT*</b>
     * 
     * When this method returns, contains the advance width of each glyph.
     * @param {Pointer<DWRITE_GLYPH_OFFSET>} glyphOffsets Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_offset">DWRITE_GLYPH_OFFSET</a>*</b>
     * 
     * When this method returns, contains the offset of the origin of each glyph.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextanalyzer-getgdicompatibleglyphplacements
     */
    GetGdiCompatibleGlyphPlacements(textString, clusterMap, textProps, textLength, glyphIndices, glyphProps, glyphCount, fontFace, fontEmSize, pixelsPerDip, transform, useGdiNatural, isSideways, isRightToLeft, scriptAnalysis, localeName, features, featureRangeLengths, featureRanges, glyphAdvances, glyphOffsets) {
        textString := textString is String ? StrPtr(textString) : textString
        localeName := localeName is String ? StrPtr(localeName) : localeName

        clusterMapMarshal := clusterMap is VarRef ? "ushort*" : "ptr"
        glyphIndicesMarshal := glyphIndices is VarRef ? "ushort*" : "ptr"
        featuresMarshal := features is VarRef ? "ptr*" : "ptr"
        featureRangeLengthsMarshal := featureRangeLengths is VarRef ? "uint*" : "ptr"
        glyphAdvancesMarshal := glyphAdvances is VarRef ? "float*" : "ptr"

        result := ComCall(9, this, "ptr", textString, clusterMapMarshal, clusterMap, "ptr", textProps, "uint", textLength, glyphIndicesMarshal, glyphIndices, "ptr", glyphProps, "uint", glyphCount, "ptr", fontFace, "float", fontEmSize, "float", pixelsPerDip, "ptr", transform, "int", useGdiNatural, "int", isSideways, "int", isRightToLeft, "ptr", scriptAnalysis, "ptr", localeName, featuresMarshal, features, featureRangeLengthsMarshal, featureRangeLengths, "uint", featureRanges, glyphAdvancesMarshal, glyphAdvances, "ptr", glyphOffsets, "HRESULT")
        return result
    }
}
