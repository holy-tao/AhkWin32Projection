#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Resource.ahk

/**
 * This object supplies the values for context-fill, context-stroke, and context-value that are used when rendering SVG glyphs.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1svgglyphstyle
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1SvgGlyphStyle extends ID2D1Resource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1SvgGlyphStyle
     * @type {Guid}
     */
    static IID => Guid("{af671749-d241-4db8-8e41-dcc2e5c1a438}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFill", "GetFill", "SetStroke", "GetStrokeDashesCount", "GetStroke"]

    /**
     * Provides values to an SVG glyph for fill.
     * @param {ID2D1Brush} brush Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * Describes how the area is painted.  A null brush will cause the context-fill value to come from
     *           the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nf-d2d1_3-id2d1devicecontext4-drawtext(constwchar_uint32_idwritetextformat_constd2d1_rect_f__id2d1brush_id2d1svgglyphstyle_uint32_d2d1_draw_text_options_dwrite_measuring_mode)">defaultFillBrush</a>. If the defaultFillBrush is also null, the context-fill value will be 'none'.
     *           To set the ‘context-fill’ value, this method uses the provided brush with its opacity set to 1. To set the ‘context-fill-opacity’ value, this method uses the opacity of the provided brush.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1svgglyphstyle-setfill
     */
    SetFill(brush) {
        result := ComCall(4, this, "ptr", brush, "HRESULT")
        return result
    }

    /**
     * Returns the requested fill parameters.
     * @param {Pointer<ID2D1Brush>} brush Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>**</b>
     * 
     * Describes how the area is painted.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1svgglyphstyle-getfill
     */
    GetFill(brush) {
        ComCall(5, this, "ptr*", brush)
    }

    /**
     * Provides values to an SVG glyph for stroke properties. The brush with opacity set to 1 is used as the 'context-stroke'. The opacity of the brush is used as the 'context-stroke-opacity' value.
     * @param {ID2D1Brush} brush Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * Describes how the stroke is painted. A null brush will cause the context-stroke value to be none.
     * @param {Float} strokeWidth Type: <b>FLOAT</b>
     * 
     * Specifies the 'context-value' for the 'stroke-width' property.
     * @param {Pointer<Float>} dashes Type: <b>const FLOAT*</b>
     * 
     * Specifies the 'context-value' for the 'stroke-dasharray'
     *           property. A null value will cause the stroke-dasharray to be set to 'none'.
     * @param {Integer} dashesCount Type: <b>UINT32</b>
     * 
     * The the number of dashes in the dash array.
     * @param {Float} dashOffset Type: <b>FLOAT</b>
     * 
     * Specifies the 'context-value' for the 'stroke-dashoffset' property.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1svgglyphstyle-setstroke
     */
    SetStroke(brush, strokeWidth, dashes, dashesCount, dashOffset) {
        dashesMarshal := dashes is VarRef ? "float*" : "ptr"

        result := ComCall(6, this, "ptr", brush, "float", strokeWidth, dashesMarshal, dashes, "uint", dashesCount, "float", dashOffset, "HRESULT")
        return result
    }

    /**
     * Returns the number of dashes in the dash array.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * Returns the number of dashes in the dash array.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1svgglyphstyle-getstrokedashescount
     */
    GetStrokeDashesCount() {
        result := ComCall(7, this, "uint")
        return result
    }

    /**
     * Returns the requested stroke parameters.
     * @param {Pointer<ID2D1Brush>} brush Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>**</b>
     * 
     * Describes how the stroke is painted.
     * @param {Pointer<Float>} strokeWidth Type: <b>FLOAT*</b>
     * 
     * The 'context-value' for the 'stroke-width' property.
     * @param {Pointer<Float>} dashes Type: <b>FLOAT*</b>
     * 
     * The 'context-value' for the 'stroke-dasharray'
     *           property.
     * @param {Integer} dashesCount Type: <b>UINT32</b>
     * 
     * The the number of dashes in the dash array.
     * @param {Pointer<Float>} dashOffset Type: <b>FLOAT*</b>
     * 
     * The 'context-value' for the 'stroke-dashoffset' property.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1svgglyphstyle-getstroke
     */
    GetStroke(brush, strokeWidth, dashes, dashesCount, dashOffset) {
        strokeWidthMarshal := strokeWidth is VarRef ? "float*" : "ptr"
        dashesMarshal := dashes is VarRef ? "float*" : "ptr"
        dashOffsetMarshal := dashOffset is VarRef ? "float*" : "ptr"

        ComCall(8, this, "ptr*", brush, strokeWidthMarshal, strokeWidth, dashesMarshal, dashes, "uint", dashesCount, dashOffsetMarshal, dashOffset)
    }
}
