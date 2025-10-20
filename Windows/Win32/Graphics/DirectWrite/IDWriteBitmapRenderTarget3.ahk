#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteBitmapRenderTarget2.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteBitmapRenderTarget3 extends IDWriteBitmapRenderTarget2{
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
     * 
     * @returns {Integer} 
     */
    GetPaintFeatureLevel() {
        result := ComCall(14, this, "int")
        return result
    }

    /**
     * 
     * @param {Float} baselineOriginX 
     * @param {Float} baselineOriginY 
     * @param {Integer} measuringMode 
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun 
     * @param {Integer} glyphImageFormat 
     * @param {COLORREF} textColor 
     * @param {Integer} colorPaletteIndex 
     * @param {Pointer<RECT>} blackBoxRect 
     * @returns {HRESULT} 
     */
    DrawPaintGlyphRun(baselineOriginX, baselineOriginY, measuringMode, glyphRun, glyphImageFormat, textColor, colorPaletteIndex, blackBoxRect) {
        result := ComCall(15, this, "float", baselineOriginX, "float", baselineOriginY, "int", measuringMode, "ptr", glyphRun, "int", glyphImageFormat, "uint", textColor, "uint", colorPaletteIndex, "ptr", blackBoxRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} baselineOriginX 
     * @param {Float} baselineOriginY 
     * @param {Integer} measuringMode 
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun 
     * @param {Pointer<IDWriteRenderingParams>} renderingParams 
     * @param {COLORREF} textColor 
     * @param {Integer} colorPaletteIndex 
     * @param {Pointer<RECT>} blackBoxRect 
     * @returns {HRESULT} 
     */
    DrawGlyphRunWithColorSupport(baselineOriginX, baselineOriginY, measuringMode, glyphRun, renderingParams, textColor, colorPaletteIndex, blackBoxRect) {
        result := ComCall(16, this, "float", baselineOriginX, "float", baselineOriginY, "int", measuringMode, "ptr", glyphRun, "ptr", renderingParams, "uint", textColor, "uint", colorPaletteIndex, "ptr", blackBoxRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
