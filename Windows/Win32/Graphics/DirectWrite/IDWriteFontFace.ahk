#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface exposes various font data such as metrics, names, and glyph outlines. It contains font face type, appropriate file references, and face identification data.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritefontface
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontFace extends IUnknown{
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
     * 
     * @returns {Integer} 
     */
    GetType() {
        result := ComCall(3, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} numberOfFiles 
     * @param {Pointer<IDWriteFontFile>} fontFiles 
     * @returns {HRESULT} 
     */
    GetFiles(numberOfFiles, fontFiles) {
        result := ComCall(4, this, "uint*", numberOfFiles, "ptr", fontFiles, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetIndex() {
        result := ComCall(5, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSimulations() {
        result := ComCall(6, this, "int")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsSymbolFont() {
        result := ComCall(7, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_FONT_METRICS>} fontFaceMetrics 
     * @returns {String} Nothing - always returns an empty string
     */
    GetMetrics(fontFaceMetrics) {
        ComCall(8, this, "ptr", fontFaceMetrics)
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetGlyphCount() {
        result := ComCall(9, this, "ushort")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} glyphIndices 
     * @param {Integer} glyphCount 
     * @param {Pointer<DWRITE_GLYPH_METRICS>} glyphMetrics 
     * @param {BOOL} isSideways 
     * @returns {HRESULT} 
     */
    GetDesignGlyphMetrics(glyphIndices, glyphCount, glyphMetrics, isSideways) {
        result := ComCall(10, this, "ushort*", glyphIndices, "uint", glyphCount, "ptr", glyphMetrics, "int", isSideways, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} codePoints 
     * @param {Integer} codePointCount 
     * @param {Pointer<UInt16>} glyphIndices 
     * @returns {HRESULT} 
     */
    GetGlyphIndices(codePoints, codePointCount, glyphIndices) {
        result := ComCall(11, this, "uint*", codePoints, "uint", codePointCount, "ushort*", glyphIndices, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} openTypeTableTag 
     * @param {Pointer<Void>} tableData 
     * @param {Pointer<UInt32>} tableSize 
     * @param {Pointer<Void>} tableContext 
     * @param {Pointer<BOOL>} exists 
     * @returns {HRESULT} 
     */
    TryGetFontTable(openTypeTableTag, tableData, tableSize, tableContext, exists) {
        result := ComCall(12, this, "uint", openTypeTableTag, "ptr", tableData, "uint*", tableSize, "ptr", tableContext, "ptr", exists, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} tableContext 
     * @returns {String} Nothing - always returns an empty string
     */
    ReleaseFontTable(tableContext) {
        ComCall(13, this, "ptr", tableContext)
        return result
    }

    /**
     * 
     * @param {Float} emSize 
     * @param {Pointer<UInt16>} glyphIndices 
     * @param {Pointer<Single>} glyphAdvances 
     * @param {Pointer<DWRITE_GLYPH_OFFSET>} glyphOffsets 
     * @param {Integer} glyphCount 
     * @param {BOOL} isSideways 
     * @param {BOOL} isRightToLeft 
     * @param {Pointer<ID2D1SimplifiedGeometrySink>} geometrySink 
     * @returns {HRESULT} 
     */
    GetGlyphRunOutline(emSize, glyphIndices, glyphAdvances, glyphOffsets, glyphCount, isSideways, isRightToLeft, geometrySink) {
        result := ComCall(14, this, "float", emSize, "ushort*", glyphIndices, "float*", glyphAdvances, "ptr", glyphOffsets, "uint", glyphCount, "int", isSideways, "int", isRightToLeft, "ptr", geometrySink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} emSize 
     * @param {Float} pixelsPerDip 
     * @param {Integer} measuringMode 
     * @param {Pointer<IDWriteRenderingParams>} renderingParams 
     * @param {Pointer<Int32>} renderingMode 
     * @returns {HRESULT} 
     */
    GetRecommendedRenderingMode(emSize, pixelsPerDip, measuringMode, renderingParams, renderingMode) {
        result := ComCall(15, this, "float", emSize, "float", pixelsPerDip, "int", measuringMode, "ptr", renderingParams, "int*", renderingMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} emSize 
     * @param {Float} pixelsPerDip 
     * @param {Pointer<DWRITE_MATRIX>} transform 
     * @param {Pointer<DWRITE_FONT_METRICS>} fontFaceMetrics 
     * @returns {HRESULT} 
     */
    GetGdiCompatibleMetrics(emSize, pixelsPerDip, transform, fontFaceMetrics) {
        result := ComCall(16, this, "float", emSize, "float", pixelsPerDip, "ptr", transform, "ptr", fontFaceMetrics, "int")
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
     * @param {Pointer<UInt16>} glyphIndices 
     * @param {Integer} glyphCount 
     * @param {Pointer<DWRITE_GLYPH_METRICS>} glyphMetrics 
     * @param {BOOL} isSideways 
     * @returns {HRESULT} 
     */
    GetGdiCompatibleGlyphMetrics(emSize, pixelsPerDip, transform, useGdiNatural, glyphIndices, glyphCount, glyphMetrics, isSideways) {
        result := ComCall(17, this, "float", emSize, "float", pixelsPerDip, "ptr", transform, "int", useGdiNatural, "ushort*", glyphIndices, "uint", glyphCount, "ptr", glyphMetrics, "int", isSideways, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
