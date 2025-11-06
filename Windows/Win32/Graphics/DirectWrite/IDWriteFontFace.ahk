#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFile.ahk
#Include .\DWRITE_GLYPH_METRICS.ahk
#Include .\DWRITE_FONT_METRICS.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface exposes various font data such as metrics, names, and glyph outlines. It contains font face type, appropriate file references, and face identification data.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritefontface
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontFace extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetType", "GetFiles", "GetIndex", "GetSimulations", "IsSymbolFont", "GetMetrics", "GetGlyphCount", "GetDesignGlyphMetrics", "GetGlyphIndices", "TryGetFontTable", "ReleaseFontTable", "GetGlyphRunOutline", "GetRecommendedRenderingMode", "GetGdiCompatibleMetrics", "GetGdiCompatibleGlyphMetrics"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontface-gettype
     */
    GetType() {
        result := ComCall(3, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} numberOfFiles 
     * @returns {IDWriteFontFile} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontface-getfiles
     */
    GetFiles(numberOfFiles) {
        numberOfFilesMarshal := numberOfFiles is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, numberOfFilesMarshal, numberOfFiles, "ptr*", &fontFiles := 0, "HRESULT")
        return IDWriteFontFile(fontFiles)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontface-getindex
     */
    GetIndex() {
        result := ComCall(5, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontface-getsimulations
     */
    GetSimulations() {
        result := ComCall(6, this, "int")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontface-issymbolfont
     */
    IsSymbolFont() {
        result := ComCall(7, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_FONT_METRICS>} fontFaceMetrics 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontface-getmetrics
     */
    GetMetrics(fontFaceMetrics) {
        ComCall(8, this, "ptr", fontFaceMetrics)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontface-getglyphcount
     */
    GetGlyphCount() {
        result := ComCall(9, this, "ushort")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} glyphIndices 
     * @param {Integer} glyphCount 
     * @param {BOOL} isSideways 
     * @returns {DWRITE_GLYPH_METRICS} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontface-getdesignglyphmetrics
     */
    GetDesignGlyphMetrics(glyphIndices, glyphCount, isSideways) {
        glyphIndicesMarshal := glyphIndices is VarRef ? "ushort*" : "ptr"

        glyphMetrics := DWRITE_GLYPH_METRICS()
        result := ComCall(10, this, glyphIndicesMarshal, glyphIndices, "uint", glyphCount, "ptr", glyphMetrics, "int", isSideways, "HRESULT")
        return glyphMetrics
    }

    /**
     * 
     * @param {Pointer<Integer>} codePoints 
     * @param {Integer} codePointCount 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontface-getglyphindices
     */
    GetGlyphIndices(codePoints, codePointCount) {
        codePointsMarshal := codePoints is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, codePointsMarshal, codePoints, "uint", codePointCount, "ushort*", &glyphIndices := 0, "HRESULT")
        return glyphIndices
    }

    /**
     * 
     * @param {Integer} openTypeTableTag 
     * @param {Pointer<Pointer<Void>>} tableData 
     * @param {Pointer<Integer>} tableSize 
     * @param {Pointer<Pointer<Void>>} tableContext 
     * @param {Pointer<BOOL>} exists 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontface-trygetfonttable
     */
    TryGetFontTable(openTypeTableTag, tableData, tableSize, tableContext, exists) {
        tableDataMarshal := tableData is VarRef ? "ptr*" : "ptr"
        tableSizeMarshal := tableSize is VarRef ? "uint*" : "ptr"
        tableContextMarshal := tableContext is VarRef ? "ptr*" : "ptr"
        existsMarshal := exists is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, "uint", openTypeTableTag, tableDataMarshal, tableData, tableSizeMarshal, tableSize, tableContextMarshal, tableContext, existsMarshal, exists, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} tableContext 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontface-releasefonttable
     */
    ReleaseFontTable(tableContext) {
        tableContextMarshal := tableContext is VarRef ? "ptr" : "ptr"

        ComCall(13, this, tableContextMarshal, tableContext)
    }

    /**
     * 
     * @param {Float} emSize 
     * @param {Pointer<Integer>} glyphIndices 
     * @param {Pointer<Float>} glyphAdvances 
     * @param {Pointer<DWRITE_GLYPH_OFFSET>} glyphOffsets 
     * @param {Integer} glyphCount 
     * @param {BOOL} isSideways 
     * @param {BOOL} isRightToLeft 
     * @param {ID2D1SimplifiedGeometrySink} geometrySink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontface-getglyphrunoutline
     */
    GetGlyphRunOutline(emSize, glyphIndices, glyphAdvances, glyphOffsets, glyphCount, isSideways, isRightToLeft, geometrySink) {
        glyphIndicesMarshal := glyphIndices is VarRef ? "ushort*" : "ptr"
        glyphAdvancesMarshal := glyphAdvances is VarRef ? "float*" : "ptr"

        result := ComCall(14, this, "float", emSize, glyphIndicesMarshal, glyphIndices, glyphAdvancesMarshal, glyphAdvances, "ptr", glyphOffsets, "uint", glyphCount, "int", isSideways, "int", isRightToLeft, "ptr", geometrySink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} emSize 
     * @param {Float} pixelsPerDip 
     * @param {Integer} measuringMode 
     * @param {IDWriteRenderingParams} renderingParams 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontface-getrecommendedrenderingmode
     */
    GetRecommendedRenderingMode(emSize, pixelsPerDip, measuringMode, renderingParams) {
        result := ComCall(15, this, "float", emSize, "float", pixelsPerDip, "int", measuringMode, "ptr", renderingParams, "int*", &renderingMode := 0, "HRESULT")
        return renderingMode
    }

    /**
     * 
     * @param {Float} emSize 
     * @param {Float} pixelsPerDip 
     * @param {Pointer<DWRITE_MATRIX>} transform 
     * @returns {DWRITE_FONT_METRICS} 
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritefontface-getgdicompatiblemetrics
     */
    GetGdiCompatibleMetrics(emSize, pixelsPerDip, transform) {
        fontFaceMetrics := DWRITE_FONT_METRICS()
        result := ComCall(16, this, "float", emSize, "float", pixelsPerDip, "ptr", transform, "ptr", fontFaceMetrics, "HRESULT")
        return fontFaceMetrics
    }

    /**
     * 
     * @param {Float} emSize 
     * @param {Float} pixelsPerDip 
     * @param {Pointer<DWRITE_MATRIX>} transform 
     * @param {BOOL} useGdiNatural 
     * @param {Pointer<Integer>} glyphIndices 
     * @param {Integer} glyphCount 
     * @param {BOOL} isSideways 
     * @returns {DWRITE_GLYPH_METRICS} 
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritefontface-getgdicompatibleglyphmetrics
     */
    GetGdiCompatibleGlyphMetrics(emSize, pixelsPerDip, transform, useGdiNatural, glyphIndices, glyphCount, isSideways) {
        glyphIndicesMarshal := glyphIndices is VarRef ? "ushort*" : "ptr"

        glyphMetrics := DWRITE_GLYPH_METRICS()
        result := ComCall(17, this, "float", emSize, "float", pixelsPerDip, "ptr", transform, "int", useGdiNatural, glyphIndicesMarshal, glyphIndices, "uint", glyphCount, "ptr", glyphMetrics, "int", isSideways, "HRESULT")
        return glyphMetrics
    }
}
