#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1DeviceContext6.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1DeviceContext7 extends ID2D1DeviceContext6{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1DeviceContext7
     * @type {Guid}
     */
    static IID => Guid("{ec891cf7-9b69-4851-9def-4e0915771e62}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 120

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPaintFeatureLevel", "DrawPaintGlyphRun", "DrawGlyphRunWithColorSupport"]

    /**
     * 
     * @returns {Integer} 
     */
    GetPaintFeatureLevel() {
        result := ComCall(120, this, "int")
        return result
    }

    /**
     * 
     * @param {D2D_POINT_2F} baselineOrigin 
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun 
     * @param {ID2D1Brush} defaultFillBrush 
     * @param {Integer} colorPaletteIndex 
     * @param {Integer} measuringMode 
     * @returns {String} Nothing - always returns an empty string
     */
    DrawPaintGlyphRun(baselineOrigin, glyphRun, defaultFillBrush, colorPaletteIndex, measuringMode) {
        ComCall(121, this, "ptr", baselineOrigin, "ptr", glyphRun, "ptr", defaultFillBrush, "uint", colorPaletteIndex, "int", measuringMode)
    }

    /**
     * 
     * @param {D2D_POINT_2F} baselineOrigin 
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun 
     * @param {Pointer<DWRITE_GLYPH_RUN_DESCRIPTION>} glyphRunDescription 
     * @param {ID2D1Brush} foregroundBrush 
     * @param {ID2D1SvgGlyphStyle} svgGlyphStyle 
     * @param {Integer} colorPaletteIndex 
     * @param {Integer} measuringMode 
     * @param {Integer} bitmapSnapOption 
     * @returns {String} Nothing - always returns an empty string
     */
    DrawGlyphRunWithColorSupport(baselineOrigin, glyphRun, glyphRunDescription, foregroundBrush, svgGlyphStyle, colorPaletteIndex, measuringMode, bitmapSnapOption) {
        ComCall(122, this, "ptr", baselineOrigin, "ptr", glyphRun, "ptr", glyphRunDescription, "ptr", foregroundBrush, "ptr", svgGlyphStyle, "uint", colorPaletteIndex, "int", measuringMode, "int", bitmapSnapOption)
    }
}
