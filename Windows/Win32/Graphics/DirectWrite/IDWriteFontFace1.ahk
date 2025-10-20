#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFace.ahk

/**
 * Contains font face type, appropriate file references, and face identification data.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nn-dwrite_1-idwritefontface1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontFace1 extends IDWriteFontFace{
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
     * 
     * @param {Pointer<DWRITE_FONT_METRICS1>} fontMetrics 
     * @returns {String} Nothing - always returns an empty string
     */
    GetMetrics(fontMetrics) {
        ComCall(18, this, "ptr", fontMetrics)
        return result
    }

    /**
     * 
     * @param {Float} emSize 
     * @param {Float} pixelsPerDip 
     * @param {Pointer<DWRITE_MATRIX>} transform 
     * @param {Pointer<DWRITE_FONT_METRICS1>} fontMetrics 
     * @returns {HRESULT} 
     */
    GetGdiCompatibleMetrics(emSize, pixelsPerDip, transform, fontMetrics) {
        result := ComCall(19, this, "float", emSize, "float", pixelsPerDip, "ptr", transform, "ptr", fontMetrics, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_CARET_METRICS>} caretMetrics 
     * @returns {String} Nothing - always returns an empty string
     */
    GetCaretMetrics(caretMetrics) {
        ComCall(20, this, "ptr", caretMetrics)
        return result
    }

    /**
     * Returns the ranges of Unicode points that the recognizer supports.
     * @param {Integer} maxRangeCount 
     * @param {Pointer<DWRITE_UNICODE_RANGE>} unicodeRanges 
     * @param {Pointer<UInt32>} actualRangeCount 
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
        result := ComCall(21, this, "uint", maxRangeCount, "ptr", unicodeRanges, "uint*", actualRangeCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsMonospacedFont() {
        result := ComCall(22, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} glyphCount 
     * @param {Pointer<UInt16>} glyphIndices 
     * @param {Pointer<Int32>} glyphAdvances 
     * @param {BOOL} isSideways 
     * @returns {HRESULT} 
     */
    GetDesignGlyphAdvances(glyphCount, glyphIndices, glyphAdvances, isSideways) {
        result := ComCall(23, this, "uint", glyphCount, "ushort*", glyphIndices, "int*", glyphAdvances, "int", isSideways, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} emSize 
     * @param {Float} pixelsPerDip 
     * @param {Pointer<DWRITE_MATRIX>} transform 
     * @param {BOOL} useGdiNatural 
     * @param {BOOL} isSideways 
     * @param {Integer} glyphCount 
     * @param {Pointer<UInt16>} glyphIndices 
     * @param {Pointer<Int32>} glyphAdvances 
     * @returns {HRESULT} 
     */
    GetGdiCompatibleGlyphAdvances(emSize, pixelsPerDip, transform, useGdiNatural, isSideways, glyphCount, glyphIndices, glyphAdvances) {
        result := ComCall(24, this, "float", emSize, "float", pixelsPerDip, "ptr", transform, "int", useGdiNatural, "int", isSideways, "uint", glyphCount, "ushort*", glyphIndices, "int*", glyphAdvances, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} glyphCount 
     * @param {Pointer<UInt16>} glyphIndices 
     * @param {Pointer<Int32>} glyphAdvanceAdjustments 
     * @returns {HRESULT} 
     */
    GetKerningPairAdjustments(glyphCount, glyphIndices, glyphAdvanceAdjustments) {
        result := ComCall(25, this, "uint", glyphCount, "ushort*", glyphIndices, "int*", glyphAdvanceAdjustments, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {BOOL} 
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
     * @param {Pointer<Int32>} renderingMode 
     * @returns {HRESULT} 
     */
    GetRecommendedRenderingMode(fontEmSize, dpiX, dpiY, transform, isSideways, outlineThreshold, measuringMode, renderingMode) {
        result := ComCall(27, this, "float", fontEmSize, "float", dpiX, "float", dpiY, "ptr", transform, "int", isSideways, "int", outlineThreshold, "int", measuringMode, "int*", renderingMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} glyphCount 
     * @param {Pointer<UInt16>} nominalGlyphIndices 
     * @param {Pointer<UInt16>} verticalGlyphIndices 
     * @returns {HRESULT} 
     */
    GetVerticalGlyphVariants(glyphCount, nominalGlyphIndices, verticalGlyphIndices) {
        result := ComCall(28, this, "uint", glyphCount, "ushort*", nominalGlyphIndices, "ushort*", verticalGlyphIndices, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    HasVerticalGlyphVariants() {
        result := ComCall(29, this, "int")
        return result
    }
}
