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
     * 
     * @param {IDWriteTextAnalysisSource} analysisSource 
     * @param {Integer} textPosition 
     * @param {Integer} textLength 
     * @param {IDWriteTextAnalysisSink} analysisSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-analyzescript
     */
    AnalyzeScript(analysisSource, textPosition, textLength, analysisSink) {
        result := ComCall(3, this, "ptr", analysisSource, "uint", textPosition, "uint", textLength, "ptr", analysisSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDWriteTextAnalysisSource} analysisSource 
     * @param {Integer} textPosition 
     * @param {Integer} textLength 
     * @param {IDWriteTextAnalysisSink} analysisSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-analyzebidi
     */
    AnalyzeBidi(analysisSource, textPosition, textLength, analysisSink) {
        result := ComCall(4, this, "ptr", analysisSource, "uint", textPosition, "uint", textLength, "ptr", analysisSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDWriteTextAnalysisSource} analysisSource 
     * @param {Integer} textPosition 
     * @param {Integer} textLength 
     * @param {IDWriteTextAnalysisSink} analysisSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-analyzenumbersubstitution
     */
    AnalyzeNumberSubstitution(analysisSource, textPosition, textLength, analysisSink) {
        result := ComCall(5, this, "ptr", analysisSource, "uint", textPosition, "uint", textLength, "ptr", analysisSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDWriteTextAnalysisSource} analysisSource 
     * @param {Integer} textPosition 
     * @param {Integer} textLength 
     * @param {IDWriteTextAnalysisSink} analysisSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-analyzelinebreakpoints
     */
    AnalyzeLineBreakpoints(analysisSource, textPosition, textLength, analysisSink) {
        result := ComCall(6, this, "ptr", analysisSource, "uint", textPosition, "uint", textLength, "ptr", analysisSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} textString 
     * @param {Integer} textLength 
     * @param {IDWriteFontFace} fontFace 
     * @param {BOOL} isSideways 
     * @param {BOOL} isRightToLeft 
     * @param {Pointer<DWRITE_SCRIPT_ANALYSIS>} scriptAnalysis 
     * @param {PWSTR} localeName 
     * @param {IDWriteNumberSubstitution} numberSubstitution 
     * @param {Pointer<Pointer<DWRITE_TYPOGRAPHIC_FEATURES>>} features 
     * @param {Pointer<Integer>} featureRangeLengths 
     * @param {Integer} featureRanges 
     * @param {Integer} maxGlyphCount 
     * @param {Pointer<Integer>} clusterMap 
     * @param {Pointer<DWRITE_SHAPING_TEXT_PROPERTIES>} textProps 
     * @param {Pointer<Integer>} glyphIndices 
     * @param {Pointer<DWRITE_SHAPING_GLYPH_PROPERTIES>} glyphProps 
     * @param {Pointer<Integer>} actualGlyphCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-getglyphs
     */
    GetGlyphs(textString, textLength, fontFace, isSideways, isRightToLeft, scriptAnalysis, localeName, numberSubstitution, features, featureRangeLengths, featureRanges, maxGlyphCount, clusterMap, textProps, glyphIndices, glyphProps, actualGlyphCount) {
        textString := textString is String ? StrPtr(textString) : textString
        localeName := localeName is String ? StrPtr(localeName) : localeName

        result := ComCall(7, this, "ptr", textString, "uint", textLength, "ptr", fontFace, "int", isSideways, "int", isRightToLeft, "ptr", scriptAnalysis, "ptr", localeName, "ptr", numberSubstitution, "ptr*", features, "uint*", featureRangeLengths, "uint", featureRanges, "uint", maxGlyphCount, "ushort*", clusterMap, "ptr", textProps, "ushort*", glyphIndices, "ptr", glyphProps, "uint*", actualGlyphCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} textString 
     * @param {Pointer<Integer>} clusterMap 
     * @param {Pointer<DWRITE_SHAPING_TEXT_PROPERTIES>} textProps 
     * @param {Integer} textLength 
     * @param {Pointer<Integer>} glyphIndices 
     * @param {Pointer<DWRITE_SHAPING_GLYPH_PROPERTIES>} glyphProps 
     * @param {Integer} glyphCount 
     * @param {IDWriteFontFace} fontFace 
     * @param {Float} fontEmSize 
     * @param {BOOL} isSideways 
     * @param {BOOL} isRightToLeft 
     * @param {Pointer<DWRITE_SCRIPT_ANALYSIS>} scriptAnalysis 
     * @param {PWSTR} localeName 
     * @param {Pointer<Pointer<DWRITE_TYPOGRAPHIC_FEATURES>>} features 
     * @param {Pointer<Integer>} featureRangeLengths 
     * @param {Integer} featureRanges 
     * @param {Pointer<Float>} glyphAdvances 
     * @param {Pointer<DWRITE_GLYPH_OFFSET>} glyphOffsets 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-getglyphplacements
     */
    GetGlyphPlacements(textString, clusterMap, textProps, textLength, glyphIndices, glyphProps, glyphCount, fontFace, fontEmSize, isSideways, isRightToLeft, scriptAnalysis, localeName, features, featureRangeLengths, featureRanges, glyphAdvances, glyphOffsets) {
        textString := textString is String ? StrPtr(textString) : textString
        localeName := localeName is String ? StrPtr(localeName) : localeName

        result := ComCall(8, this, "ptr", textString, "ushort*", clusterMap, "ptr", textProps, "uint", textLength, "ushort*", glyphIndices, "ptr", glyphProps, "uint", glyphCount, "ptr", fontFace, "float", fontEmSize, "int", isSideways, "int", isRightToLeft, "ptr", scriptAnalysis, "ptr", localeName, "ptr*", features, "uint*", featureRangeLengths, "uint", featureRanges, "float*", glyphAdvances, "ptr", glyphOffsets, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} textString 
     * @param {Pointer<Integer>} clusterMap 
     * @param {Pointer<DWRITE_SHAPING_TEXT_PROPERTIES>} textProps 
     * @param {Integer} textLength 
     * @param {Pointer<Integer>} glyphIndices 
     * @param {Pointer<DWRITE_SHAPING_GLYPH_PROPERTIES>} glyphProps 
     * @param {Integer} glyphCount 
     * @param {IDWriteFontFace} fontFace 
     * @param {Float} fontEmSize 
     * @param {Float} pixelsPerDip 
     * @param {Pointer<DWRITE_MATRIX>} transform 
     * @param {BOOL} useGdiNatural 
     * @param {BOOL} isSideways 
     * @param {BOOL} isRightToLeft 
     * @param {Pointer<DWRITE_SCRIPT_ANALYSIS>} scriptAnalysis 
     * @param {PWSTR} localeName 
     * @param {Pointer<Pointer<DWRITE_TYPOGRAPHIC_FEATURES>>} features 
     * @param {Pointer<Integer>} featureRangeLengths 
     * @param {Integer} featureRanges 
     * @param {Pointer<Float>} glyphAdvances 
     * @param {Pointer<DWRITE_GLYPH_OFFSET>} glyphOffsets 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritetextanalyzer-getgdicompatibleglyphplacements
     */
    GetGdiCompatibleGlyphPlacements(textString, clusterMap, textProps, textLength, glyphIndices, glyphProps, glyphCount, fontFace, fontEmSize, pixelsPerDip, transform, useGdiNatural, isSideways, isRightToLeft, scriptAnalysis, localeName, features, featureRangeLengths, featureRanges, glyphAdvances, glyphOffsets) {
        textString := textString is String ? StrPtr(textString) : textString
        localeName := localeName is String ? StrPtr(localeName) : localeName

        result := ComCall(9, this, "ptr", textString, "ushort*", clusterMap, "ptr", textProps, "uint", textLength, "ushort*", glyphIndices, "ptr", glyphProps, "uint", glyphCount, "ptr", fontFace, "float", fontEmSize, "float", pixelsPerDip, "ptr", transform, "int", useGdiNatural, "int", isSideways, "int", isRightToLeft, "ptr", scriptAnalysis, "ptr", localeName, "ptr*", features, "uint*", featureRangeLengths, "uint", featureRanges, "float*", glyphAdvances, "ptr", glyphOffsets, "HRESULT")
        return result
    }
}
