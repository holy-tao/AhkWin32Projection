#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1SvgGlyphStyle.ahk
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
     * Creates an SVG glyph style object.
     * @returns {ID2D1SvgGlyphStyle} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1svgglyphstyle">ID2D1SvgGlyphStyle</a>**</b>
     * 
     * On completion points to the created <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1svgglyphstyle">ID2D1SvgGlyphStyle</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1devicecontext4-createsvgglyphstyle
     */
    CreateSvgGlyphStyle() {
        result := ComCall(108, this, "ptr*", &svgGlyphStyle := 0, "HRESULT")
        return ID2D1SvgGlyphStyle(svgGlyphStyle)
    }

    /**
     * 
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
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext4-drawtext(constwchar_uint32_idwritetextformat_constd2d1_rect_f_id2d1brush_id2d1svgglyphstyle_uint32_d2d1_draw_text_options_dwrite_measuring_mode)
     */
    DrawText(string, stringLength, textFormat, layoutRect, defaultFillBrush, svgGlyphStyle, colorPaletteIndex, options, measuringMode) {
        string := string is String ? StrPtr(string) : string

        ComCall(109, this, "ptr", string, "uint", stringLength, "ptr", textFormat, "ptr", layoutRect, "ptr", defaultFillBrush, "ptr", svgGlyphStyle, "uint", colorPaletteIndex, "int", options, "int", measuringMode)
    }

    /**
     * Draws a text layout object. If the layout is not subsequently changed, this can be more efficient than DrawText when drawing the same layout repeatedly.
     * @param {D2D_POINT_2F} origin Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The point, described in device-independent pixels, at which the upper-left corner of the text described by <i>textLayout</i> is drawn.
     * @param {IDWriteTextLayout} textLayout Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dwrite/nn-dwrite-idwritetextlayout">IDWriteTextLayout</a>*</b>
     * 
     * The formatted text to draw. Any drawing effects that do not inherit from <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1resource">ID2D1Resource</a> are ignored. If there are drawing effects that inherit from <b>ID2D1Resource</b> that are not brushes, this method fails and the render target is put in an error state.
     * @param {ID2D1Brush} defaultFillBrush Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * The brush used to paint the text.
     * @param {ID2D1SvgGlyphStyle} svgGlyphStyle Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1svgglyphstyle">ID2D1SvgGlyphStyle</a>*</b>
     * 
     * The values for context-fill, context-stroke, and context-value that are used when rendering SVG glyphs.
     * @param {Integer} colorPaletteIndex Type: <b>UINT32</b>
     * 
     * The index used to select a color palette within a color font.
     * @param {Integer} options Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_draw_text_options">D2D1_DRAW_TEXT_OPTIONS</a></b>
     * 
     * A value that indicates whether the text should be snapped to pixel boundaries and whether the text should be clipped to the layout rectangle. 
     *             The default value is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_draw_text_options">D2D1_DRAW_TEXT_OPTIONS_NONE</a>, 
     *             which indicates that text should be snapped to pixel boundaries and it should not be clipped to the layout rectangle.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1devicecontext4-drawtextlayout
     */
    DrawTextLayout(origin, textLayout, defaultFillBrush, svgGlyphStyle, colorPaletteIndex, options) {
        ComCall(110, this, "ptr", origin, "ptr", textLayout, "ptr", defaultFillBrush, "ptr", svgGlyphStyle, "uint", colorPaletteIndex, "int", options)
    }

    /**
     * Draws a color bitmap glyph run using one of the bitmap formats.
     * @param {Integer} glyphImageFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ne-dcommon-dwrite_glyph_image_formats">DWRITE_GLYPH_IMAGE_FORMATS</a></b>
     * 
     * Specifies the format of the glyph image. Supported formats are DWRITE_GLYPH_IMAGE_FORMATS_PNG, DWRITE_GLYPH_IMAGE_FORMATS_JPEG,
     *           DWRITE_GLYPH_IMAGE_FORMATS_TIFF, or DWRITE_GLYPH_IMAGE_FORMATS_PREMULTIPLIED_B8G8R8A8.  This method will result in an error if the color glyph run does not contain the requested format.
     *           
     * 
     * Only one format can be specified at a time, combinations of flags are not valid input.
     * @param {D2D_POINT_2F} baselineOrigin Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The origin of the baseline for the glyph run.
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/dwrite/ns-dwrite-dwrite_glyph_run">DWRITE_GLYPH_RUN</a>*</b>
     * 
     * The glyphs to render.
     * @param {Integer} measuringMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE</a></b>
     * 
     * Indicates the measuring method.
     * @param {Integer} bitmapSnapOption Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ne-d2d1_3-d2d1_color_bitmap_glyph_snap_option">D2D1_COLOR_BITMAP_GLYPH_SNAP_OPTION</a></b>
     * 
     * Specifies the pixel snapping policy when rendering color bitmap glyphs.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1devicecontext4-drawcolorbitmapglyphrun
     */
    DrawColorBitmapGlyphRun(glyphImageFormat, baselineOrigin, glyphRun, measuringMode, bitmapSnapOption) {
        ComCall(111, this, "int", glyphImageFormat, "ptr", baselineOrigin, "ptr", glyphRun, "int", measuringMode, "int", bitmapSnapOption)
    }

    /**
     * Draws a color glyph run that has the format of DWRITE_GLYPH_IMAGE_FORMATS_SVG.
     * @param {D2D_POINT_2F} baselineOrigin Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The origin of the baseline for the glyph run.
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/dwrite/ns-dwrite-dwrite_glyph_run">DWRITE_GLYPH_RUN</a>*</b>
     * 
     * The glyphs to render.
     * @param {ID2D1Brush} defaultFillBrush Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * The brush used to paint the specified glyphs.
     * @param {ID2D1SvgGlyphStyle} svgGlyphStyle Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1svgglyphstyle">ID2D1SvgGlyphStyle</a>*</b>
     * 
     * Values for context-fill, context-stroke, and context-value that are used when rendering SVG glyphs.
     * @param {Integer} colorPaletteIndex Type: <b>UINT32</b>
     * 
     * The index used to select a color palette within a color font. Note that this not the same as the paletteIndex in the
     *           DWRITE_COLOR_GLYPH_RUN struct, which is not relevant for SVG glyphs.
     * @param {Integer} measuringMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE</a></b>
     * 
     * Indicates the measuring method used for text layout.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1devicecontext4-drawsvgglyphrun
     */
    DrawSvgGlyphRun(baselineOrigin, glyphRun, defaultFillBrush, svgGlyphStyle, colorPaletteIndex, measuringMode) {
        ComCall(112, this, "ptr", baselineOrigin, "ptr", glyphRun, "ptr", defaultFillBrush, "ptr", svgGlyphStyle, "uint", colorPaletteIndex, "int", measuringMode)
    }

    /**
     * Retrieves an image of the color bitmap glyph from the color glyph cache.
     * @param {Integer} glyphImageFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ne-dcommon-dwrite_glyph_image_formats">DWRITE_GLYPH_IMAGE_FORMATS</a></b>
     * 
     * The format for the glyph image.
     *           If there is no image data in the requested format for the requested glyph, this method will return an error.
     * @param {D2D_POINT_2F} glyphOrigin Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The origin for the glyph.
     * @param {IDWriteFontFace} fontFace Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dwrite/nn-dwrite-idwritefontface">IDWriteFontFace</a>*</b>
     * 
     * Reference to a font face which contains font face type, appropriate file references, face identification data and various font data such as metrics, names and glyph outlines.
     * @param {Float} fontEmSize Type: <b>FLOAT</b>
     * 
     * The specified font size affects the choice of which bitmap to use from the font. It also affects the output glyphTransform, causing  it to properly scale the glyph.
     * @param {Integer} glyphIndex Type: <b>UINT16</b>
     * 
     * Index of the glyph.
     * @param {BOOL} isSideways Type: <b>BOOL</b>
     * 
     * If true, specifies that glyphs are rotated 90 degrees to the left and vertical metrics are used. Vertical writing is achieved by specifying isSideways as true and rotating the entire run 90 degrees to the right via a rotate transform.
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a>*</b>
     * 
     * The transform to apply to the image. This input transform affects the choice of which bitmap to use from the font. It is also factored into the output glyphTransform.
     * @param {Float} dpiX Type: <b>FLOAT</b>
     * 
     * Dots per inch along the x-axis.
     * @param {Float} dpiY Type: <b>FLOAT</b>
     * 
     * Dots per inch along the y-axis.
     * @param {Pointer<D2D_MATRIX_3X2_F>} glyphTransform Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a>*</b>
     * 
     * Output transform, which transforms from the glyph's space to the same output space as the worldTransform. This includes the input
     *           glyphOrigin, the glyph's offset from the glyphOrigin, and any other required transformations.
     * @param {Pointer<ID2D1Image>} glyphImage Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1image">ID2D1Image</a>**</b>
     * 
     * On completion contains the retrieved glyph image.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1devicecontext4-getcolorbitmapglyphimage
     */
    GetColorBitmapGlyphImage(glyphImageFormat, glyphOrigin, fontFace, fontEmSize, glyphIndex, isSideways, worldTransform, dpiX, dpiY, glyphTransform, glyphImage) {
        result := ComCall(113, this, "int", glyphImageFormat, "ptr", glyphOrigin, "ptr", fontFace, "float", fontEmSize, "ushort", glyphIndex, "int", isSideways, "ptr", worldTransform, "float", dpiX, "float", dpiY, "ptr", glyphTransform, "ptr*", glyphImage, "HRESULT")
        return result
    }

    /**
     * Retrieves an image of the SVG glyph from the color glyph cache.
     * @param {D2D_POINT_2F} glyphOrigin Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * Origin of the glyph.
     * @param {IDWriteFontFace} fontFace Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dwrite/nn-dwrite-idwritefontface">IDWriteFontFace</a>*</b>
     * 
     * Reference to a font face which contains font face type, appropriate file references, face identification data and various font data such as metrics, names and glyph outlines.
     * @param {Float} fontEmSize Type: <b>FLOAT</b>
     * 
     * The specified font size affects the output
     *           glyphTransform, causing it to properly scale the glyph.
     * @param {Integer} glyphIndex Type: <b>UINT16</b>
     * 
     * Index of the glyph to retrieve.
     * @param {BOOL} isSideways Type: <b>BOOL</b>
     * 
     * If true, specifies that glyphs are rotated 90 degrees to the left and vertical metrics are used. Vertical writing is achieved by specifying isSideways as true and rotating the entire run 90 degrees to the right via a rotate transform.
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a>*</b>
     * 
     * The transform to apply to the image.
     * @param {ID2D1Brush} defaultFillBrush Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * Describes how the area is painted.
     * @param {ID2D1SvgGlyphStyle} svgGlyphStyle Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1svgglyphstyle">ID2D1SvgGlyphStyle</a>*</b>
     * 
     * The values for context-fill, context-stroke, and context-value that are used when rendering SVG glyphs.
     * @param {Integer} colorPaletteIndex Type: <b>UINT32</b>
     * 
     * The index used to select a color palette within a color font. 
     *           Note that this not the same as the paletteIndex in the DWRITE_COLOR_GLYPH_RUN struct, which is not relevant for SVG glyphs.
     * @param {Pointer<D2D_MATRIX_3X2_F>} glyphTransform Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a>*</b>
     * 
     * Output transform, which transforms from the glyph's space to the same output space as the worldTransform. 
     *           This includes the input glyphOrigin, the glyph's offset from the glyphOrigin, and any other required transformations.
     * @param {Pointer<ID2D1CommandList>} glyphImage Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1commandlist">ID2D1CommandList</a>**</b>
     * 
     * On completion, contains the retrieved glyph image.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1devicecontext4-getsvgglyphimage
     */
    GetSvgGlyphImage(glyphOrigin, fontFace, fontEmSize, glyphIndex, isSideways, worldTransform, defaultFillBrush, svgGlyphStyle, colorPaletteIndex, glyphTransform, glyphImage) {
        result := ComCall(114, this, "ptr", glyphOrigin, "ptr", fontFace, "float", fontEmSize, "ushort", glyphIndex, "int", isSideways, "ptr", worldTransform, "ptr", defaultFillBrush, "ptr", svgGlyphStyle, "uint", colorPaletteIndex, "ptr", glyphTransform, "ptr*", glyphImage, "HRESULT")
        return result
    }
}
