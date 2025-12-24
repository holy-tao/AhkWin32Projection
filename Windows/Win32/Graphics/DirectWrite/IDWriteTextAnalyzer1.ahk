#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DWRITE_MATRIX.ahk
#Include .\DWRITE_SCRIPT_PROPERTIES.ahk
#Include .\DWRITE_JUSTIFICATION_OPPORTUNITY.ahk
#Include .\IDWriteTextAnalyzer.ahk

/**
 * Analyzes various text properties for complex script processing.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nn-dwrite_1-idwritetextanalyzer1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteTextAnalyzer1 extends IDWriteTextAnalyzer{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteTextAnalyzer1
     * @type {Guid}
     */
    static IID => Guid("{80dad800-e21f-4e83-96ce-bfcce500db7c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ApplyCharacterSpacing", "GetBaseline", "AnalyzeVerticalGlyphOrientation", "GetGlyphOrientationTransform", "GetScriptProperties", "GetTextComplexity", "GetJustificationOpportunities", "JustifyGlyphAdvances", "GetJustifiedGlyphs"]

    /**
     * Applies spacing between characters, properly adjusting glyph clusters and diacritics.
     * @param {Float} leadingSpacing The spacing before each character, in reading order.
     * @param {Float} trailingSpacing The spacing after each character, in reading order.
     * @param {Float} minimumAdvanceWidth The minimum advance of each character,
     *     to prevent characters from becoming too thin or zero-width. This
     *     must be zero or greater.
     * @param {Integer} textLength The length of the clustermap and original text.
     * @param {Integer} glyphCount The number of glyphs.
     * @param {Pointer<Integer>} clusterMap Mapping from character ranges to glyph ranges.
     * @param {Pointer<Float>} glyphAdvances The advance width of each glyph.
     * @param {Pointer<DWRITE_GLYPH_OFFSET>} glyphOffsets The offset of the origin of each glyph.
     * @param {Pointer<DWRITE_SHAPING_GLYPH_PROPERTIES>} glyphProperties Properties of each glyph, from GetGlyphs.
     * @param {Pointer<Float>} modifiedGlyphAdvances The new advance width of each glyph.
     * @param {Pointer<DWRITE_GLYPH_OFFSET>} modifiedGlyphOffsets The new offset of the origin of each glyph.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritetextanalyzer1-applycharacterspacing
     */
    ApplyCharacterSpacing(leadingSpacing, trailingSpacing, minimumAdvanceWidth, textLength, glyphCount, clusterMap, glyphAdvances, glyphOffsets, glyphProperties, modifiedGlyphAdvances, modifiedGlyphOffsets) {
        clusterMapMarshal := clusterMap is VarRef ? "ushort*" : "ptr"
        glyphAdvancesMarshal := glyphAdvances is VarRef ? "float*" : "ptr"
        modifiedGlyphAdvancesMarshal := modifiedGlyphAdvances is VarRef ? "float*" : "ptr"

        result := ComCall(10, this, "float", leadingSpacing, "float", trailingSpacing, "float", minimumAdvanceWidth, "uint", textLength, "uint", glyphCount, clusterMapMarshal, clusterMap, glyphAdvancesMarshal, glyphAdvances, "ptr", glyphOffsets, "ptr", glyphProperties, modifiedGlyphAdvancesMarshal, modifiedGlyphAdvances, "ptr", modifiedGlyphOffsets, "HRESULT")
        return result
    }

    /**
     * Retrieves the given baseline from the font.
     * @param {IDWriteFontFace} fontFace Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/nn-dwrite_1-idwritefontface1">IDWriteFontFace</a>*</b>
     * 
     * The font face to read.
     * @param {Integer} baseline Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_baseline">DWRITE_BASELINE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_baseline">DWRITE_BASELINE</a>-typed value that specifies the baseline of interest.
     * @param {BOOL} isVertical Type: <b>BOOL</b>
     * 
     * Whether the baseline is vertical or horizontal.
     * @param {BOOL} isSimulationAllowed Type: <b>BOOL</b>
     * 
     * Simulate the baseline if it is missing in the font.
     * @param {DWRITE_SCRIPT_ANALYSIS} scriptAnalysis Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_script_analysis">DWRITE_SCRIPT_ANALYSIS</a></b>
     * 
     * Script analysis result from AnalyzeScript.
     * 
     * <div class="alert"><b>Note</b>  You can pass an empty script analysis structure, like this <c>DWRITE_SCRIPT_ANALYSIS scriptAnalysis = {};</c>, and this method will return the default baseline.</div>
     * <div> </div>
     * @param {PWSTR} localeName Type: <b>const WCHAR*</b>
     * 
     * The language of the run.
     * @param {Pointer<Integer>} baselineCoordinate Type: <b>INT32*</b>
     * 
     * The baseline coordinate value in design units.
     * @param {Pointer<BOOL>} exists Type: <b>BOOL*</b>
     * 
     * Whether the returned baseline exists in the font.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritetextanalyzer1-getbaseline
     */
    GetBaseline(fontFace, baseline, isVertical, isSimulationAllowed, scriptAnalysis, localeName, baselineCoordinate, exists) {
        localeName := localeName is String ? StrPtr(localeName) : localeName

        baselineCoordinateMarshal := baselineCoordinate is VarRef ? "int*" : "ptr"
        existsMarshal := exists is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, "ptr", fontFace, "int", baseline, "int", isVertical, "int", isSimulationAllowed, "ptr", scriptAnalysis, "ptr", localeName, baselineCoordinateMarshal, baselineCoordinate, existsMarshal, exists, "HRESULT")
        return result
    }

    /**
     * Analyzes a text range for script orientation, reading text and attributes from the source and reporting results to the sink callback SetGlyphOrientation.
     * @param {IDWriteTextAnalysisSource1} analysisSource Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/nn-dwrite_1-idwritetextanalysissource1">IDWriteTextAnalysisSource1</a>*</b>
     * 
     * Source object to analyze.
     * @param {Integer} textPosition Type: <b>UINT32</b>
     * 
     * Starting position within the source object.
     * @param {Integer} textLength Type: <b>UINT32</b>
     * 
     * Length to analyze.
     * @param {IDWriteTextAnalysisSink1} analysisSink Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/nn-dwrite_1-idwritetextanalysissink1">IDWriteTextAnalysisSink1</a>*</b>
     * 
     * Length to analyze.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritetextanalyzer1-analyzeverticalglyphorientation
     */
    AnalyzeVerticalGlyphOrientation(analysisSource, textPosition, textLength, analysisSink) {
        result := ComCall(12, this, "ptr", analysisSource, "uint", textPosition, "uint", textLength, "ptr", analysisSink, "HRESULT")
        return result
    }

    /**
     * Returns 2x3 transform matrix for the respective angle to draw the glyph run.
     * @param {Integer} glyphOrientationAngle Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_glyph_orientation_angle">DWRITE_GLYPH_ORIENTATION_ANGLE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_glyph_orientation_angle">DWRITE_GLYPH_ORIENTATION_ANGLE</a>-typed value that specifies the angle that was reported into
     *     <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritetextanalysissink1-setglyphorientation">IDWriteTextAnalysisSink1::SetGlyphOrientation</a>.
     * @param {BOOL} isSideways Type: <b>BOOL</b>
     * 
     * Whether the run's glyphs are sideways or not.
     * @returns {DWRITE_MATRIX} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix">DWRITE_MATRIX</a>*</b>
     * 
     * Returned transform.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritetextanalyzer1-getglyphorientationtransform
     */
    GetGlyphOrientationTransform(glyphOrientationAngle, isSideways) {
        transform := DWRITE_MATRIX()
        result := ComCall(13, this, "int", glyphOrientationAngle, "int", isSideways, "ptr", transform, "HRESULT")
        return transform
    }

    /**
     * Retrieves the properties for a given script.
     * @param {DWRITE_SCRIPT_ANALYSIS} scriptAnalysis Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_script_analysis">DWRITE_SCRIPT_ANALYSIS</a></b>
     * 
     * The script for a run of text returned
     *     from <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-analyzescript">IDWriteTextAnalyzer::AnalyzeScript</a>.
     * @returns {DWRITE_SCRIPT_PROPERTIES} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_script_properties">DWRITE_SCRIPT_PROPERTIES</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_script_properties">DWRITE_SCRIPT_PROPERTIES</a> structure that describes info for the script.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritetextanalyzer1-getscriptproperties
     */
    GetScriptProperties(scriptAnalysis) {
        scriptProperties := DWRITE_SCRIPT_PROPERTIES()
        result := ComCall(14, this, "ptr", scriptAnalysis, "ptr", scriptProperties, "HRESULT")
        return scriptProperties
    }

    /**
     * Determines the complexity of text, and whether you need to call IDWriteTextAnalyzer::GetGlyphs for full script shaping.
     * @param {PWSTR} textString Type: <b>const WCHAR*</b>
     * 
     * The text to check for complexity. This string
     *     may be UTF-16, but any supplementary characters will be considered
     *     complex.
     * @param {Integer} textLength Type: <b>UINT32</b>
     * 
     * Length of the text to check.
     * @param {IDWriteFontFace} fontFace Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/nn-dwrite_1-idwritefontface1">IDWriteFontFace</a>*</b>
     * 
     * The font face to read.
     * @param {Pointer<BOOL>} isTextSimple Type: <b>BOOL*</b>
     * 
     * If true, the text is simple, and the
     *     <i>glyphIndices</i> array will already have the nominal glyphs for you.
     *     Otherwise, you need to call <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-getglyphs">IDWriteTextAnalyzer::GetGlyphs</a> to properly shape complex
     *     scripts and OpenType features.
     * @param {Pointer<Integer>} textLengthRead Type: <b>UINT32*</b>
     * 
     * The length read of the text run with the
     *     same complexity, simple or complex. You may call again from that
     *     point onward.
     * @param {Pointer<Integer>} glyphIndices Type: <b>UINT16*</b>
     * 
     * Optional glyph indices for the text. If the
     *     function returned that the text was simple, you already have the
     *     glyphs you need. Otherwise the glyph indices are not meaningful,
     *     and you need to call <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-getglyphs">IDWriteTextAnalyzer::GetGlyphs</a> for shaping instead.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritetextanalyzer1-gettextcomplexity
     */
    GetTextComplexity(textString, textLength, fontFace, isTextSimple, textLengthRead, glyphIndices) {
        textString := textString is String ? StrPtr(textString) : textString

        isTextSimpleMarshal := isTextSimple is VarRef ? "int*" : "ptr"
        textLengthReadMarshal := textLengthRead is VarRef ? "uint*" : "ptr"
        glyphIndicesMarshal := glyphIndices is VarRef ? "ushort*" : "ptr"

        result := ComCall(15, this, "ptr", textString, "uint", textLength, "ptr", fontFace, isTextSimpleMarshal, isTextSimple, textLengthReadMarshal, textLengthRead, glyphIndicesMarshal, glyphIndices, "HRESULT")
        return result
    }

    /**
     * Retrieves justification opportunity information for each of the glyphs given the text and shaping glyph properties.
     * @param {IDWriteFontFace} fontFace Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/nn-dwrite_1-idwritefontface1">IDWriteFontFace</a>*</b>
     * 
     * Font face that was used for shaping. This is
     *     mainly important for returning correct results of the kashida
     *     width. 
     * 
     * May be NULL.
     * @param {Float} fontEmSize Type: <b>FLOAT</b>
     * 
     * Font em size used for the glyph run.
     * @param {DWRITE_SCRIPT_ANALYSIS} scriptAnalysis Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_script_analysis">DWRITE_SCRIPT_ANALYSIS</a></b>
     * 
     * Script of the text from the itemizer.
     * @param {Integer} textLength Type: <b>UINT32</b>
     * 
     * Length of the text.
     * @param {Integer} glyphCount Type: <b>UINT32</b>
     * 
     * Number of glyphs.
     * @param {PWSTR} textString Type: <b>const WCHAR*</b>
     * 
     * Characters used to produce the glyphs.
     * @param {Pointer<Integer>} clusterMap Type: <b>const UINT16*</b>
     * 
     * Clustermap produced from shaping.
     * @param {Pointer<DWRITE_SHAPING_GLYPH_PROPERTIES>} glyphProperties Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_shaping_glyph_properties">DWRITE_SHAPING_GLYPH_PROPERTIES</a>*</b>
     * 
     * Glyph properties produced from shaping.
     * @returns {DWRITE_JUSTIFICATION_OPPORTUNITY} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_justification_opportunity">DWRITE_JUSTIFICATION_OPPORTUNITY</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_justification_opportunity">DWRITE_JUSTIFICATION_OPPORTUNITY</a> structure that receives info for the
     *     allowed justification expansion/compression for each glyph.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritetextanalyzer1-getjustificationopportunities
     */
    GetJustificationOpportunities(fontFace, fontEmSize, scriptAnalysis, textLength, glyphCount, textString, clusterMap, glyphProperties) {
        textString := textString is String ? StrPtr(textString) : textString

        clusterMapMarshal := clusterMap is VarRef ? "ushort*" : "ptr"

        justificationOpportunities := DWRITE_JUSTIFICATION_OPPORTUNITY()
        result := ComCall(16, this, "ptr", fontFace, "float", fontEmSize, "ptr", scriptAnalysis, "uint", textLength, "uint", glyphCount, "ptr", textString, clusterMapMarshal, clusterMap, "ptr", glyphProperties, "ptr", justificationOpportunities, "HRESULT")
        return justificationOpportunities
    }

    /**
     * Justifies an array of glyph advances to fit the line width.
     * @param {Float} lineWidth Type: <b>FLOAT</b>
     * 
     * The line width.
     * @param {Integer} glyphCount Type: <b>UINT32</b>
     * 
     * The glyph count.
     * @param {Pointer<DWRITE_JUSTIFICATION_OPPORTUNITY>} justificationOpportunities Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_justification_opportunity">DWRITE_JUSTIFICATION_OPPORTUNITY</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_justification_opportunity">DWRITE_JUSTIFICATION_OPPORTUNITY</a> structure that contains info for the
     *     allowed justification expansion/compression for each glyph. Get this info from <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritetextanalyzer1-getjustificationopportunities">IDWriteTextAnalyzer1::GetJustificationOpportunities</a>.
     * @param {Pointer<Float>} glyphAdvances Type: <b>const FLOAT*</b>
     * 
     * An array of glyph advances.
     * @param {Pointer<DWRITE_GLYPH_OFFSET>} glyphOffsets Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_offset">DWRITE_GLYPH_OFFSET</a>*</b>
     * 
     * An array of glyph offsets.
     * @param {Pointer<Float>} justifiedGlyphAdvances Type: <b>FLOAT*</b>
     * 
     * The returned array of justified glyph advances.
     * @param {Pointer<DWRITE_GLYPH_OFFSET>} justifiedGlyphOffsets Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_offset">DWRITE_GLYPH_OFFSET</a>*</b>
     * 
     * The returned array of justified glyph offsets.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritetextanalyzer1-justifyglyphadvances
     */
    JustifyGlyphAdvances(lineWidth, glyphCount, justificationOpportunities, glyphAdvances, glyphOffsets, justifiedGlyphAdvances, justifiedGlyphOffsets) {
        glyphAdvancesMarshal := glyphAdvances is VarRef ? "float*" : "ptr"
        justifiedGlyphAdvancesMarshal := justifiedGlyphAdvances is VarRef ? "float*" : "ptr"

        result := ComCall(17, this, "float", lineWidth, "uint", glyphCount, "ptr", justificationOpportunities, glyphAdvancesMarshal, glyphAdvances, "ptr", glyphOffsets, justifiedGlyphAdvancesMarshal, justifiedGlyphAdvances, "ptr", justifiedGlyphOffsets, "HRESULT")
        return result
    }

    /**
     * Fills in new glyphs for complex scripts where justification increased the advances of glyphs, such as Arabic with kashida.
     * @param {IDWriteFontFace} fontFace Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/nn-dwrite_1-idwritefontface1">IDWriteFontFace</a>*</b>
     * 
     * Font face used for shaping.
     * 
     * May be NULL.
     * @param {Float} fontEmSize Type: <b>FLOAT</b>
     * 
     * Font em size used for the glyph run.
     * @param {DWRITE_SCRIPT_ANALYSIS} scriptAnalysis Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_script_analysis">DWRITE_SCRIPT_ANALYSIS</a></b>
     * 
     * Script of the text from the itemizer.
     * @param {Integer} textLength Type: <b>UINT32</b>
     * 
     * Length of the text.
     * @param {Integer} glyphCount Type: <b>UINT32</b>
     * 
     * Number of glyphs.
     * @param {Integer} maxGlyphCount Type: <b>UINT32</b>
     * 
     * Maximum number of output glyphs allocated
     *     by caller.
     * @param {Pointer<Integer>} clusterMap Type: <b>const UINT16*</b>
     * 
     * Clustermap produced from shaping.
     * @param {Pointer<Integer>} glyphIndices Type: <b>const UINT16*</b>
     * 
     * Original glyphs produced from shaping.
     * @param {Pointer<Float>} glyphAdvances Type: <b>const FLOAT*</b>
     * 
     * Original glyph advances produced from shaping.
     * @param {Pointer<Float>} justifiedGlyphAdvances Type: <b>const FLOAT*</b>
     * 
     * Justified glyph advances from
     *     <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritetextanalyzer1-justifyglyphadvances">IDWriteTextAnalyzer1::JustifyGlyphAdvances</a>.
     * @param {Pointer<DWRITE_GLYPH_OFFSET>} justifiedGlyphOffsets Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_offset">DWRITE_GLYPH_OFFSET</a>*</b>
     * 
     * Justified glyph offsets from
     *     <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritetextanalyzer1-justifyglyphadvances">IDWriteTextAnalyzer1::JustifyGlyphAdvances</a>.
     * @param {Pointer<DWRITE_SHAPING_GLYPH_PROPERTIES>} glyphProperties Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_shaping_glyph_properties">DWRITE_SHAPING_GLYPH_PROPERTIES</a>*</b>
     * 
     * Properties of each glyph, from <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-getglyphs">IDWriteTextAnalyzer::GetGlyphs</a>.
     * @param {Pointer<Integer>} actualGlyphCount Type: <b>UINT32*</b>
     * 
     * The new glyph count written to the
     *     modified arrays, or the needed glyph count if the size is not
     *     large enough.
     * @param {Pointer<Integer>} modifiedClusterMap Type: <b>UINT16*</b>
     * 
     * Updated clustermap.
     * @param {Pointer<Integer>} modifiedGlyphIndices Type: <b>UINT16*</b>
     * 
     * Updated glyphs with new glyphs
     *     inserted where needed.
     * @param {Pointer<Float>} modifiedGlyphAdvances Type: <b>FLOAT*</b>
     * 
     * Updated glyph advances.
     * @param {Pointer<DWRITE_GLYPH_OFFSET>} modifiedGlyphOffsets Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_offset">DWRITE_GLYPH_OFFSET</a>*</b>
     * 
     * Updated glyph offsets.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritetextanalyzer1-getjustifiedglyphs
     */
    GetJustifiedGlyphs(fontFace, fontEmSize, scriptAnalysis, textLength, glyphCount, maxGlyphCount, clusterMap, glyphIndices, glyphAdvances, justifiedGlyphAdvances, justifiedGlyphOffsets, glyphProperties, actualGlyphCount, modifiedClusterMap, modifiedGlyphIndices, modifiedGlyphAdvances, modifiedGlyphOffsets) {
        clusterMapMarshal := clusterMap is VarRef ? "ushort*" : "ptr"
        glyphIndicesMarshal := glyphIndices is VarRef ? "ushort*" : "ptr"
        glyphAdvancesMarshal := glyphAdvances is VarRef ? "float*" : "ptr"
        justifiedGlyphAdvancesMarshal := justifiedGlyphAdvances is VarRef ? "float*" : "ptr"
        actualGlyphCountMarshal := actualGlyphCount is VarRef ? "uint*" : "ptr"
        modifiedClusterMapMarshal := modifiedClusterMap is VarRef ? "ushort*" : "ptr"
        modifiedGlyphIndicesMarshal := modifiedGlyphIndices is VarRef ? "ushort*" : "ptr"
        modifiedGlyphAdvancesMarshal := modifiedGlyphAdvances is VarRef ? "float*" : "ptr"

        result := ComCall(18, this, "ptr", fontFace, "float", fontEmSize, "ptr", scriptAnalysis, "uint", textLength, "uint", glyphCount, "uint", maxGlyphCount, clusterMapMarshal, clusterMap, glyphIndicesMarshal, glyphIndices, glyphAdvancesMarshal, glyphAdvances, justifiedGlyphAdvancesMarshal, justifiedGlyphAdvances, "ptr", justifiedGlyphOffsets, "ptr", glyphProperties, actualGlyphCountMarshal, actualGlyphCount, modifiedClusterMapMarshal, modifiedClusterMap, modifiedGlyphIndicesMarshal, modifiedGlyphIndices, modifiedGlyphAdvancesMarshal, modifiedGlyphAdvances, "ptr", modifiedGlyphOffsets, "HRESULT")
        return result
    }
}
