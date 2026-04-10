#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteBitmapRenderTarget2.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class IDWriteBitmapRenderTarget3 extends IDWriteBitmapRenderTarget2 {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteBitmapRenderTarget3
     * @type {Guid}
     */
    static IID => Guid("{aeec37db-c337-40f1-8e2a-9a41b167b238}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPaintFeatureLevel", "DrawPaintGlyphRun", "DrawGlyphRunWithColorSupport"]

    /**
     * 
     * @returns {DWRITE_PAINT_FEATURE_LEVEL} 
     */
    GetPaintFeatureLevel() {
        result := ComCall(14, this, "int")
        return result
    }

    /**
     * 
     * @param {Float} baselineOriginX 
     * @param {Float} baselineOriginY 
     * @param {DWRITE_MEASURING_MODE} measuringMode 
     * @param {Pointer<DWRITE_GLYPH_RUN>} _glyphRun 
     * @param {DWRITE_GLYPH_IMAGE_FORMATS} glyphImageFormat 
     * @param {COLORREF} textColor 
     * @param {Integer} colorPaletteIndex 
     * @returns {RECT} 
     */
    DrawPaintGlyphRun(baselineOriginX, baselineOriginY, measuringMode, _glyphRun, glyphImageFormat, textColor, colorPaletteIndex) {
        blackBoxRect := RECT()
        result := ComCall(15, this, "float", baselineOriginX, "float", baselineOriginY, "int", measuringMode, "ptr", _glyphRun, "int", glyphImageFormat, "uint", textColor, "uint", colorPaletteIndex, "ptr", blackBoxRect, "HRESULT")
        return blackBoxRect
    }

    /**
     * 
     * @param {Float} baselineOriginX 
     * @param {Float} baselineOriginY 
     * @param {DWRITE_MEASURING_MODE} measuringMode 
     * @param {Pointer<DWRITE_GLYPH_RUN>} _glyphRun 
     * @param {IDWriteRenderingParams} renderingParams 
     * @param {COLORREF} textColor 
     * @param {Integer} colorPaletteIndex 
     * @returns {RECT} 
     */
    DrawGlyphRunWithColorSupport(baselineOriginX, baselineOriginY, measuringMode, _glyphRun, renderingParams, textColor, colorPaletteIndex) {
        blackBoxRect := RECT()
        result := ComCall(16, this, "float", baselineOriginX, "float", baselineOriginY, "int", measuringMode, "ptr", _glyphRun, "ptr", renderingParams, "uint", textColor, "uint", colorPaletteIndex, "ptr", blackBoxRect, "HRESULT")
        return blackBoxRect
    }
}
