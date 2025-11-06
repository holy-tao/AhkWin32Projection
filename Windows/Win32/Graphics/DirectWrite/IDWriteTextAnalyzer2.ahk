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
     * 
     * @param {Integer} glyphOrientationAngle 
     * @param {BOOL} isSideways 
     * @param {Float} originX 
     * @param {Float} originY 
     * @returns {DWRITE_MATRIX} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextanalyzer2-getglyphorientationtransform
     */
    GetGlyphOrientationTransform(glyphOrientationAngle, isSideways, originX, originY) {
        transform := DWRITE_MATRIX()
        result := ComCall(19, this, "int", glyphOrientationAngle, "int", isSideways, "float", originX, "float", originY, "ptr", transform, "HRESULT")
        return transform
    }

    /**
     * 
     * @param {IDWriteFontFace} fontFace 
     * @param {DWRITE_SCRIPT_ANALYSIS} scriptAnalysis 
     * @param {PWSTR} localeName 
     * @param {Integer} maxTagCount 
     * @param {Pointer<Integer>} actualTagCount 
     * @param {Pointer<Integer>} tags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextanalyzer2-gettypographicfeatures
     */
    GetTypographicFeatures(fontFace, scriptAnalysis, localeName, maxTagCount, actualTagCount, tags) {
        localeName := localeName is String ? StrPtr(localeName) : localeName

        actualTagCountMarshal := actualTagCount is VarRef ? "uint*" : "ptr"
        tagsMarshal := tags is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, "ptr", fontFace, "ptr", scriptAnalysis, "ptr", localeName, "uint", maxTagCount, actualTagCountMarshal, actualTagCount, tagsMarshal, tags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDWriteFontFace} fontFace 
     * @param {DWRITE_SCRIPT_ANALYSIS} scriptAnalysis 
     * @param {PWSTR} localeName 
     * @param {Integer} featureTag 
     * @param {Integer} glyphCount 
     * @param {Pointer<Integer>} glyphIndices 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextanalyzer2-checktypographicfeature
     */
    CheckTypographicFeature(fontFace, scriptAnalysis, localeName, featureTag, glyphCount, glyphIndices) {
        localeName := localeName is String ? StrPtr(localeName) : localeName

        glyphIndicesMarshal := glyphIndices is VarRef ? "ushort*" : "ptr"

        result := ComCall(21, this, "ptr", fontFace, "ptr", scriptAnalysis, "ptr", localeName, "uint", featureTag, "uint", glyphCount, glyphIndicesMarshal, glyphIndices, "char*", &featureApplies := 0, "HRESULT")
        return featureApplies
    }
}
