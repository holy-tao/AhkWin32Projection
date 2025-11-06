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
     * 
     * @param {Pointer<DWRITE_FONT_METRICS1>} fontMetrics 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefontface1-getmetrics
     */
    GetMetrics(fontMetrics) {
        ComCall(18, this, "ptr", fontMetrics)
    }

    /**
     * 
     * @param {Float} emSize 
     * @param {Float} pixelsPerDip 
     * @param {Pointer<DWRITE_MATRIX>} transform 
     * @returns {DWRITE_FONT_METRICS1} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefontface1-getgdicompatiblemetrics
     */
    GetGdiCompatibleMetrics(emSize, pixelsPerDip, transform) {
        fontMetrics := DWRITE_FONT_METRICS1()
        result := ComCall(19, this, "float", emSize, "float", pixelsPerDip, "ptr", transform, "ptr", fontMetrics, "HRESULT")
        return fontMetrics
    }

    /**
     * 
     * @param {Pointer<DWRITE_CARET_METRICS>} caretMetrics 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefontface1-getcaretmetrics
     */
    GetCaretMetrics(caretMetrics) {
        ComCall(20, this, "ptr", caretMetrics)
    }

    /**
     * Returns the ranges of Unicode points that the recognizer supports.
     * @param {Integer} maxRangeCount 
     * @param {Pointer<DWRITE_UNICODE_RANGE>} unicodeRanges 
     * @param {Pointer<Integer>} actualRangeCount 
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TPC_E_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pcr</i> buffer is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-getunicoderanges
     */
    GetUnicodeRanges(maxRangeCount, unicodeRanges, actualRangeCount) {
        actualRangeCountMarshal := actualRangeCount is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, "uint", maxRangeCount, "ptr", unicodeRanges, actualRangeCountMarshal, actualRangeCount, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefontface1-ismonospacedfont
     */
    IsMonospacedFont() {
        result := ComCall(22, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} glyphCount 
     * @param {Pointer<Integer>} glyphIndices 
     * @param {BOOL} isSideways 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefontface1-getdesignglyphadvances
     */
    GetDesignGlyphAdvances(glyphCount, glyphIndices, isSideways) {
        glyphIndicesMarshal := glyphIndices is VarRef ? "ushort*" : "ptr"

        result := ComCall(23, this, "uint", glyphCount, glyphIndicesMarshal, glyphIndices, "int*", &glyphAdvances := 0, "int", isSideways, "HRESULT")
        return glyphAdvances
    }

    /**
     * 
     * @param {Float} emSize 
     * @param {Float} pixelsPerDip 
     * @param {Pointer<DWRITE_MATRIX>} transform 
     * @param {BOOL} useGdiNatural 
     * @param {BOOL} isSideways 
     * @param {Integer} glyphCount 
     * @param {Pointer<Integer>} glyphIndices 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefontface1-getgdicompatibleglyphadvances
     */
    GetGdiCompatibleGlyphAdvances(emSize, pixelsPerDip, transform, useGdiNatural, isSideways, glyphCount, glyphIndices) {
        glyphIndicesMarshal := glyphIndices is VarRef ? "ushort*" : "ptr"

        result := ComCall(24, this, "float", emSize, "float", pixelsPerDip, "ptr", transform, "int", useGdiNatural, "int", isSideways, "uint", glyphCount, glyphIndicesMarshal, glyphIndices, "int*", &glyphAdvances := 0, "HRESULT")
        return glyphAdvances
    }

    /**
     * 
     * @param {Integer} glyphCount 
     * @param {Pointer<Integer>} glyphIndices 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefontface1-getkerningpairadjustments
     */
    GetKerningPairAdjustments(glyphCount, glyphIndices) {
        glyphIndicesMarshal := glyphIndices is VarRef ? "ushort*" : "ptr"

        result := ComCall(25, this, "uint", glyphCount, glyphIndicesMarshal, glyphIndices, "int*", &glyphAdvanceAdjustments := 0, "HRESULT")
        return glyphAdvanceAdjustments
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefontface1-haskerningpairs
     */
    HasKerningPairs() {
        result := ComCall(26, this, "int")
        return result
    }

    /**
     * 
     * @param {Float} fontEmSize 
     * @param {Float} dpiX 
     * @param {Float} dpiY 
     * @param {Pointer<DWRITE_MATRIX>} transform 
     * @param {BOOL} isSideways 
     * @param {Integer} outlineThreshold 
     * @param {Integer} measuringMode 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefontface1-getrecommendedrenderingmode
     */
    GetRecommendedRenderingMode(fontEmSize, dpiX, dpiY, transform, isSideways, outlineThreshold, measuringMode) {
        result := ComCall(27, this, "float", fontEmSize, "float", dpiX, "float", dpiY, "ptr", transform, "int", isSideways, "int", outlineThreshold, "int", measuringMode, "int*", &renderingMode := 0, "HRESULT")
        return renderingMode
    }

    /**
     * 
     * @param {Integer} glyphCount 
     * @param {Pointer<Integer>} nominalGlyphIndices 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefontface1-getverticalglyphvariants
     */
    GetVerticalGlyphVariants(glyphCount, nominalGlyphIndices) {
        nominalGlyphIndicesMarshal := nominalGlyphIndices is VarRef ? "ushort*" : "ptr"

        result := ComCall(28, this, "uint", glyphCount, nominalGlyphIndicesMarshal, nominalGlyphIndices, "ushort*", &verticalGlyphIndices := 0, "HRESULT")
        return verticalGlyphIndices
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefontface1-hasverticalglyphvariants
     */
    HasVerticalGlyphVariants() {
        result := ComCall(29, this, "int")
        return result
    }
}
