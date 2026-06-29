#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID2D1Resource.ahk" { ID2D1Resource }
#Import ".\ID2D1Brush.ahk" { ID2D1Brush }

/**
 * This object supplies the values for context-fill, context-stroke, and context-value that are used when rendering SVG glyphs.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nn-d2d1_3-id2d1svgglyphstyle
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1SvgGlyphStyle extends ID2D1Resource {
    /**
     * The interface identifier for ID2D1SvgGlyphStyle
     * @type {Guid}
     */
    static IID := Guid("{af671749-d241-4db8-8e41-dcc2e5c1a438}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1SvgGlyphStyle interfaces
    */
    struct Vtbl extends ID2D1Resource.Vtbl {
        SetFill              : IntPtr
        GetFill              : IntPtr
        SetStroke            : IntPtr
        GetStrokeDashesCount : IntPtr
        GetStroke            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1SvgGlyphStyle.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Provides values to an SVG glyph for fill.
     * @param {ID2D1Brush} brush Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * Describes how the area is painted.  A null brush will cause the context-fill value to come from
     *           the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nf-d2d1_3-id2d1devicecontext4-drawtext(constwchar_uint32_idwritetextformat_constd2d1_rect_f__id2d1brush_id2d1svgglyphstyle_uint32_d2d1_draw_text_options_dwrite_measuring_mode)">defaultFillBrush</a>. If the defaultFillBrush is also null, the context-fill value will be 'none'.
     *           To set the ‘context-fill’ value, this method uses the provided brush with its opacity set to 1. To set the ‘context-fill-opacity’ value, this method uses the opacity of the provided brush.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1svgglyphstyle-setfill
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
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1svgglyphstyle-getfill
     */
    GetFill(brush) {
        ComCall(5, this, ID2D1Brush.Ptr, brush)
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1svgglyphstyle-setstroke
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
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1svgglyphstyle-getstrokedashescount
     */
    GetStrokeDashesCount() {
        result := ComCall(7, this, UInt32)
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
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1svgglyphstyle-getstroke
     */
    GetStroke(brush, strokeWidth, dashes, dashesCount, dashOffset) {
        strokeWidthMarshal := strokeWidth is VarRef ? "float*" : "ptr"
        dashesMarshal := dashes is VarRef ? "float*" : "ptr"
        dashOffsetMarshal := dashOffset is VarRef ? "float*" : "ptr"

        ComCall(8, this, ID2D1Brush.Ptr, brush, strokeWidthMarshal, strokeWidth, dashesMarshal, dashes, "uint", dashesCount, dashOffsetMarshal, dashOffset)
    }

    Query(iid) {
        if (ID2D1SvgGlyphStyle.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetFill := CallbackCreate(GetMethod(implObj, "SetFill"), flags, 2)
        this.vtbl.GetFill := CallbackCreate(GetMethod(implObj, "GetFill"), flags, 2)
        this.vtbl.SetStroke := CallbackCreate(GetMethod(implObj, "SetStroke"), flags, 6)
        this.vtbl.GetStrokeDashesCount := CallbackCreate(GetMethod(implObj, "GetStrokeDashesCount"), flags, 1)
        this.vtbl.GetStroke := CallbackCreate(GetMethod(implObj, "GetStroke"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetFill)
        CallbackFree(this.vtbl.GetFill)
        CallbackFree(this.vtbl.SetStroke)
        CallbackFree(this.vtbl.GetStrokeDashesCount)
        CallbackFree(this.vtbl.GetStroke)
    }
}
