#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1DeviceContext3.ahk

/**
 * This interface performs all the same functions as the ID2D1DeviceContext3 interface, plus it enables functionality for handling new types of color font glyphs.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1devicecontext4
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1DeviceContext4 extends ID2D1DeviceContext3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1DeviceContext4
     * @type {Guid}
     */
    static IID => Guid("{8c427831-3d90-4476-b647-c4fae349e4db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 108

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSvgGlyphStyle", "DrawText", "DrawTextLayout", "DrawColorBitmapGlyphRun", "DrawSvgGlyphRun", "GetColorBitmapGlyphImage", "GetSvgGlyphImage"]

    /**
     * 
     * @param {Pointer<ID2D1SvgGlyphStyle>} svgGlyphStyle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext4-createsvgglyphstyle
     */
    CreateSvgGlyphStyle(svgGlyphStyle) {
        result := ComCall(108, this, "ptr*", svgGlyphStyle, "HRESULT")
        return result
    }

    /**
     * The DrawText function draws formatted text in the specified rectangle. It formats the text according to the specified method (expanding tabs, justifying characters, breaking lines, and so forth).
     * @param {PWSTR} string 
     * @param {Integer} stringLength 
     * @param {IDWriteTextFormat} textFormat 
     * @param {Pointer<D2D_RECT_F>} layoutRect 
     * @param {ID2D1Brush} defaultFillBrush 
     * @param {ID2D1SvgGlyphStyle} svgGlyphStyle 
     * @param {Integer} colorPaletteIndex 
     * @param {Integer} options 
     * @param {Integer} measuringMode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-drawtext
     */
    DrawText(string, stringLength, textFormat, layoutRect, defaultFillBrush, svgGlyphStyle, colorPaletteIndex, options, measuringMode) {
        string := string is String ? StrPtr(string) : string

        ComCall(109, this, "ptr", string, "uint", stringLength, "ptr", textFormat, "ptr", layoutRect, "ptr", defaultFillBrush, "ptr", svgGlyphStyle, "uint", colorPaletteIndex, "int", options, "int", measuringMode)
    }

    /**
     * 
     * @param {D2D_POINT_2F} origin 
     * @param {IDWriteTextLayout} textLayout 
     * @param {ID2D1Brush} defaultFillBrush 
     * @param {ID2D1SvgGlyphStyle} svgGlyphStyle 
     * @param {Integer} colorPaletteIndex 
     * @param {Integer} options 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext4-drawtextlayout
     */
    DrawTextLayout(origin, textLayout, defaultFillBrush, svgGlyphStyle, colorPaletteIndex, options) {
        ComCall(110, this, "ptr", origin, "ptr", textLayout, "ptr", defaultFillBrush, "ptr", svgGlyphStyle, "uint", colorPaletteIndex, "int", options)
    }

    /**
     * 
     * @param {Integer} glyphImageFormat 
     * @param {D2D_POINT_2F} baselineOrigin 
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun 
     * @param {Integer} measuringMode 
     * @param {Integer} bitmapSnapOption 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext4-drawcolorbitmapglyphrun
     */
    DrawColorBitmapGlyphRun(glyphImageFormat, baselineOrigin, glyphRun, measuringMode, bitmapSnapOption) {
        ComCall(111, this, "int", glyphImageFormat, "ptr", baselineOrigin, "ptr", glyphRun, "int", measuringMode, "int", bitmapSnapOption)
    }

    /**
     * 
     * @param {D2D_POINT_2F} baselineOrigin 
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun 
     * @param {ID2D1Brush} defaultFillBrush 
     * @param {ID2D1SvgGlyphStyle} svgGlyphStyle 
     * @param {Integer} colorPaletteIndex 
     * @param {Integer} measuringMode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext4-drawsvgglyphrun
     */
    DrawSvgGlyphRun(baselineOrigin, glyphRun, defaultFillBrush, svgGlyphStyle, colorPaletteIndex, measuringMode) {
        ComCall(112, this, "ptr", baselineOrigin, "ptr", glyphRun, "ptr", defaultFillBrush, "ptr", svgGlyphStyle, "uint", colorPaletteIndex, "int", measuringMode)
    }

    /**
     * 
     * @param {Integer} glyphImageFormat 
     * @param {D2D_POINT_2F} glyphOrigin 
     * @param {IDWriteFontFace} fontFace 
     * @param {Float} fontEmSize 
     * @param {Integer} glyphIndex 
     * @param {BOOL} isSideways 
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @param {Float} dpiX 
     * @param {Float} dpiY 
     * @param {Pointer<D2D_MATRIX_3X2_F>} glyphTransform 
     * @param {Pointer<ID2D1Image>} glyphImage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext4-getcolorbitmapglyphimage
     */
    GetColorBitmapGlyphImage(glyphImageFormat, glyphOrigin, fontFace, fontEmSize, glyphIndex, isSideways, worldTransform, dpiX, dpiY, glyphTransform, glyphImage) {
        result := ComCall(113, this, "int", glyphImageFormat, "ptr", glyphOrigin, "ptr", fontFace, "float", fontEmSize, "ushort", glyphIndex, "int", isSideways, "ptr", worldTransform, "float", dpiX, "float", dpiY, "ptr", glyphTransform, "ptr*", glyphImage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {D2D_POINT_2F} glyphOrigin 
     * @param {IDWriteFontFace} fontFace 
     * @param {Float} fontEmSize 
     * @param {Integer} glyphIndex 
     * @param {BOOL} isSideways 
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @param {ID2D1Brush} defaultFillBrush 
     * @param {ID2D1SvgGlyphStyle} svgGlyphStyle 
     * @param {Integer} colorPaletteIndex 
     * @param {Pointer<D2D_MATRIX_3X2_F>} glyphTransform 
     * @param {Pointer<ID2D1CommandList>} glyphImage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext4-getsvgglyphimage
     */
    GetSvgGlyphImage(glyphOrigin, fontFace, fontEmSize, glyphIndex, isSideways, worldTransform, defaultFillBrush, svgGlyphStyle, colorPaletteIndex, glyphTransform, glyphImage) {
        result := ComCall(114, this, "ptr", glyphOrigin, "ptr", fontFace, "float", fontEmSize, "ushort", glyphIndex, "int", isSideways, "ptr", worldTransform, "ptr", defaultFillBrush, "ptr", svgGlyphStyle, "uint", colorPaletteIndex, "ptr", glyphTransform, "ptr*", glyphImage, "HRESULT")
        return result
    }
}
