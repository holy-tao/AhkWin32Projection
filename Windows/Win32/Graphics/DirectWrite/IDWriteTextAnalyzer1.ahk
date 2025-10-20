#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteTextAnalyzer.ahk

/**
 * Analyzes various text properties for complex script processing.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nn-dwrite_1-idwritetextanalyzer1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteTextAnalyzer1 extends IDWriteTextAnalyzer{
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
     * 
     * @param {Float} leadingSpacing 
     * @param {Float} trailingSpacing 
     * @param {Float} minimumAdvanceWidth 
     * @param {Integer} textLength 
     * @param {Integer} glyphCount 
     * @param {Pointer<UInt16>} clusterMap 
     * @param {Pointer<Single>} glyphAdvances 
     * @param {Pointer<DWRITE_GLYPH_OFFSET>} glyphOffsets 
     * @param {Pointer<DWRITE_SHAPING_GLYPH_PROPERTIES>} glyphProperties 
     * @param {Pointer<Single>} modifiedGlyphAdvances 
     * @param {Pointer<DWRITE_GLYPH_OFFSET>} modifiedGlyphOffsets 
     * @returns {HRESULT} 
     */
    ApplyCharacterSpacing(leadingSpacing, trailingSpacing, minimumAdvanceWidth, textLength, glyphCount, clusterMap, glyphAdvances, glyphOffsets, glyphProperties, modifiedGlyphAdvances, modifiedGlyphOffsets) {
        result := ComCall(10, this, "float", leadingSpacing, "float", trailingSpacing, "float", minimumAdvanceWidth, "uint", textLength, "uint", glyphCount, "ushort*", clusterMap, "float*", glyphAdvances, "ptr", glyphOffsets, "ptr", glyphProperties, "float*", modifiedGlyphAdvances, "ptr", modifiedGlyphOffsets, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontFace>} fontFace 
     * @param {Integer} baseline 
     * @param {BOOL} isVertical 
     * @param {BOOL} isSimulationAllowed 
     * @param {DWRITE_SCRIPT_ANALYSIS} scriptAnalysis 
     * @param {PWSTR} localeName 
     * @param {Pointer<Int32>} baselineCoordinate 
     * @param {Pointer<BOOL>} exists 
     * @returns {HRESULT} 
     */
    GetBaseline(fontFace, baseline, isVertical, isSimulationAllowed, scriptAnalysis, localeName, baselineCoordinate, exists) {
        localeName := localeName is String ? StrPtr(localeName) : localeName

        result := ComCall(11, this, "ptr", fontFace, "int", baseline, "int", isVertical, "int", isSimulationAllowed, "ptr", scriptAnalysis, "ptr", localeName, "int*", baselineCoordinate, "ptr", exists, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteTextAnalysisSource1>} analysisSource 
     * @param {Integer} textPosition 
     * @param {Integer} textLength 
     * @param {Pointer<IDWriteTextAnalysisSink1>} analysisSink 
     * @returns {HRESULT} 
     */
    AnalyzeVerticalGlyphOrientation(analysisSource, textPosition, textLength, analysisSink) {
        result := ComCall(12, this, "ptr", analysisSource, "uint", textPosition, "uint", textLength, "ptr", analysisSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} glyphOrientationAngle 
     * @param {BOOL} isSideways 
     * @param {Pointer<DWRITE_MATRIX>} transform 
     * @returns {HRESULT} 
     */
    GetGlyphOrientationTransform(glyphOrientationAngle, isSideways, transform) {
        result := ComCall(13, this, "int", glyphOrientationAngle, "int", isSideways, "ptr", transform, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {DWRITE_SCRIPT_ANALYSIS} scriptAnalysis 
     * @param {Pointer<DWRITE_SCRIPT_PROPERTIES>} scriptProperties 
     * @returns {HRESULT} 
     */
    GetScriptProperties(scriptAnalysis, scriptProperties) {
        result := ComCall(14, this, "ptr", scriptAnalysis, "ptr", scriptProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} textString 
     * @param {Integer} textLength 
     * @param {Pointer<IDWriteFontFace>} fontFace 
     * @param {Pointer<BOOL>} isTextSimple 
     * @param {Pointer<UInt32>} textLengthRead 
     * @param {Pointer<UInt16>} glyphIndices 
     * @returns {HRESULT} 
     */
    GetTextComplexity(textString, textLength, fontFace, isTextSimple, textLengthRead, glyphIndices) {
        textString := textString is String ? StrPtr(textString) : textString

        result := ComCall(15, this, "ptr", textString, "uint", textLength, "ptr", fontFace, "ptr", isTextSimple, "uint*", textLengthRead, "ushort*", glyphIndices, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontFace>} fontFace 
     * @param {Float} fontEmSize 
     * @param {DWRITE_SCRIPT_ANALYSIS} scriptAnalysis 
     * @param {Integer} textLength 
     * @param {Integer} glyphCount 
     * @param {PWSTR} textString 
     * @param {Pointer<UInt16>} clusterMap 
     * @param {Pointer<DWRITE_SHAPING_GLYPH_PROPERTIES>} glyphProperties 
     * @param {Pointer<DWRITE_JUSTIFICATION_OPPORTUNITY>} justificationOpportunities 
     * @returns {HRESULT} 
     */
    GetJustificationOpportunities(fontFace, fontEmSize, scriptAnalysis, textLength, glyphCount, textString, clusterMap, glyphProperties, justificationOpportunities) {
        textString := textString is String ? StrPtr(textString) : textString

        result := ComCall(16, this, "ptr", fontFace, "float", fontEmSize, "ptr", scriptAnalysis, "uint", textLength, "uint", glyphCount, "ptr", textString, "ushort*", clusterMap, "ptr", glyphProperties, "ptr", justificationOpportunities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} lineWidth 
     * @param {Integer} glyphCount 
     * @param {Pointer<DWRITE_JUSTIFICATION_OPPORTUNITY>} justificationOpportunities 
     * @param {Pointer<Single>} glyphAdvances 
     * @param {Pointer<DWRITE_GLYPH_OFFSET>} glyphOffsets 
     * @param {Pointer<Single>} justifiedGlyphAdvances 
     * @param {Pointer<DWRITE_GLYPH_OFFSET>} justifiedGlyphOffsets 
     * @returns {HRESULT} 
     */
    JustifyGlyphAdvances(lineWidth, glyphCount, justificationOpportunities, glyphAdvances, glyphOffsets, justifiedGlyphAdvances, justifiedGlyphOffsets) {
        result := ComCall(17, this, "float", lineWidth, "uint", glyphCount, "ptr", justificationOpportunities, "float*", glyphAdvances, "ptr", glyphOffsets, "float*", justifiedGlyphAdvances, "ptr", justifiedGlyphOffsets, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontFace>} fontFace 
     * @param {Float} fontEmSize 
     * @param {DWRITE_SCRIPT_ANALYSIS} scriptAnalysis 
     * @param {Integer} textLength 
     * @param {Integer} glyphCount 
     * @param {Integer} maxGlyphCount 
     * @param {Pointer<UInt16>} clusterMap 
     * @param {Pointer<UInt16>} glyphIndices 
     * @param {Pointer<Single>} glyphAdvances 
     * @param {Pointer<Single>} justifiedGlyphAdvances 
     * @param {Pointer<DWRITE_GLYPH_OFFSET>} justifiedGlyphOffsets 
     * @param {Pointer<DWRITE_SHAPING_GLYPH_PROPERTIES>} glyphProperties 
     * @param {Pointer<UInt32>} actualGlyphCount 
     * @param {Pointer<UInt16>} modifiedClusterMap 
     * @param {Pointer<UInt16>} modifiedGlyphIndices 
     * @param {Pointer<Single>} modifiedGlyphAdvances 
     * @param {Pointer<DWRITE_GLYPH_OFFSET>} modifiedGlyphOffsets 
     * @returns {HRESULT} 
     */
    GetJustifiedGlyphs(fontFace, fontEmSize, scriptAnalysis, textLength, glyphCount, maxGlyphCount, clusterMap, glyphIndices, glyphAdvances, justifiedGlyphAdvances, justifiedGlyphOffsets, glyphProperties, actualGlyphCount, modifiedClusterMap, modifiedGlyphIndices, modifiedGlyphAdvances, modifiedGlyphOffsets) {
        result := ComCall(18, this, "ptr", fontFace, "float", fontEmSize, "ptr", scriptAnalysis, "uint", textLength, "uint", glyphCount, "uint", maxGlyphCount, "ushort*", clusterMap, "ushort*", glyphIndices, "float*", glyphAdvances, "float*", justifiedGlyphAdvances, "ptr", justifiedGlyphOffsets, "ptr", glyphProperties, "uint*", actualGlyphCount, "ushort*", modifiedClusterMap, "ushort*", modifiedGlyphIndices, "float*", modifiedGlyphAdvances, "ptr", modifiedGlyphOffsets, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
